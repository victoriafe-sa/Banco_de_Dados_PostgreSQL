/* Entidades do banco
public.comissoes
public.itens_vendas
public.produtos
public.funcionarios
public.vendas
public.mesas
*/
-- Criando a tabela masas
create table mesas(
	id					int not null primary key,
	mesas_codigo		varchar(20),
	mesa_situacao		varchar(1) default 'A',
	data_criacao		timestamp,
	data_atualizacao	timestamp);
	
create table funcionarios(
	id					int not null primary key,
	funcionario_codigo	varchar(20),
	funcionaro_nome		varchar(100),
	funcionaro_situacao varchar(1) default 'A',
	funcionaro_comissao	real,
	funcionaro_cargo	varchar(30),
	data_criacao		timestamp,
	data_atualizacao 	timestamp);
create table vendas(
	id					int not null primary key,
	funcionario_id		int references funcionarios(id),
	mesas_id			int references mesas(id),
	venda_codigo		varchar(20),
	venda_valor			real,
	venda_total			real,
	venda_desconto		real,
	venda_situacao		varchar(1) default 'A',
	data_criacao		timestamp,
	data_atualizacao	timestamp);
create table produtos(
	id					int not null primary key,
	produto_codigo		varchar(20),
	produto_nome		varchar(60),
	produto_valor		real,
	produto_situacao	varchar(1) default 'A',	
	data_criacao		timestamp,
	data_atualizacao	timestamp
);

create table itens_vendas(
	id					int not null primary key,
	produto_id			int not null references produtos(id),
	vendas_id			int not null references vendas(id),
	item_valor			real,
	item_quantidade		int,
	item_total			real,
	data_criacao		timestamp,
	data_atualizacao	timestamp
);

create table comissoes(
	id					int not null primary key,
	funcionario_id		int references funcionarios(id),
	comissao_valor		real,
	comissao_situacao	varchar(1) default 'A',	
	data_criacao		timestamp,
	data_atualizacao	timestamp);

create table comissoes(
	id 			int not null,
	funcionario_id 		int,
	comissao_valor		real,
	comissao_situacao	varchar(1) default 'A',
	data_criacao		timestamp,
	data_atualizacao	timestamp);
-- alterando a tabela adicionando chave estrangeira
alter table comissoes
add foreign key (funcionario_id) references funcionarios(id);
-- alterando a tabela removendo a chave estrangeira
alter table comissoes
drop constraint comissoes_funcionario_id_fkey;
-- constraints de validação
alter table vendas add check(venda_total>0);
alter table funcionarios
	add check(funcionario_nome <> null);


create sequence mesa_id_seq;
create sequence vendas_id_seq;
create sequence itens_vendas_id_seq;
create sequence produtos_id_seq;
create sequence funcionarios_id_seq;
create sequence comissoes_id_seq;


alter table mesas alter column id set default nextval('mesa_id_seq');

alter table itens_vendas alter column id set default nextval('itens_vendas_id_seq');

alter table vendas alter column id set default nextval('vendas_id_seq');

alter table produtos alter column id set default nextval('produtos_id_seq');

alter table funcionarios alter column id set default nextval('funcionarios_id_seq');

alter table comissoes alter column id set default nextval('comissoes_id_seq');