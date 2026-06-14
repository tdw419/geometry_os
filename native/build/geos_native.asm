
build/geos_native.elf:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_entry>:
80000000:	00019117          	auipc	sp,0x19
80000004:	00010113          	mv	sp,sp
80000008:	6291                	lui	t0,0x4
8000000a:	40510133          	sub	sp,sp,t0
8000000e:	00007297          	auipc	t0,0x7
80000012:	ff228293          	addi	t0,t0,-14 # 80007000 <ticks>
80000016:	00015317          	auipc	t1,0x15
8000001a:	fea30313          	addi	t1,t1,-22 # 80015000 <_bss_end>
8000001e:	0062f763          	bgeu	t0,t1,8000002c <bss_done>

80000022 <bss_loop>:
80000022:	0002a023          	sw	zero,0(t0)
80000026:	0291                	addi	t0,t0,4
80000028:	fe62ede3          	bltu	t0,t1,80000022 <bss_loop>

8000002c <bss_done>:
8000002c:	4201                	li	tp,0
8000002e:	31d010ef          	jal	80001b4a <geos_main>
80000032:	48a1                	li	a7,8
80000034:	00000073          	ecall
80000038:	a001                	j	80000038 <bss_done+0xc>

8000003a <putchar>:
8000003a:	4885                	li	a7,1
8000003c:	00000073          	ecall
80000040:	8082                	ret

80000042 <getchar_impl>:
80000042:	4889                	li	a7,2
80000044:	00000073          	ecall
80000048:	8082                	ret

8000004a <kalloc_impl>:
8000004a:	10000893          	li	a7,256
8000004e:	00000073          	ecall
80000052:	8082                	ret

80000054 <kfree_impl>:
80000054:	10100893          	li	a7,257
80000058:	00000073          	ecall
8000005c:	8082                	ret

8000005e <disk_read_impl>:
8000005e:	20000893          	li	a7,512
80000062:	00000073          	ecall
80000066:	8082                	ret

80000068 <disk_write_impl>:
80000068:	20100893          	li	a7,513
8000006c:	00000073          	ecall
80000070:	8082                	ret

80000072 <shutdown>:
80000072:	48a1                	li	a7,8
80000074:	00000073          	ecall
80000078:	a001                	j	80000078 <shutdown+0x6>

8000007a <exec_elf>:
8000007a:	842a                	mv	s0,a0
8000007c:	84ae                	mv	s1,a1
8000007e:	4885                	li	a7,1
80000080:	03000513          	li	a0,48
80000084:	00000073          	ecall
80000088:	10000293          	li	t0,256
8000008c:	30229073          	csrw	medeleg,t0
80000090:	00000297          	auipc	t0,0x0
80000094:	0b028293          	addi	t0,t0,176 # 80000140 <stvec_handler>
80000098:	10529073          	csrw	stvec,t0
8000009c:	10401073          	csrw	sie,zero
800000a0:	00019297          	auipc	t0,0x19
800000a4:	f6028293          	addi	t0,t0,-160 # 80019000 <_stack_top>
800000a8:	14029073          	csrw	sscratch,t0
800000ac:	6285                	lui	t0,0x1
800000ae:	88028293          	addi	t0,t0,-1920 # 880 <_entry-0x7ffff780>
800000b2:	30029073          	csrw	mstatus,t0
800000b6:	00000297          	auipc	t0,0x0
800000ba:	02e1                	addi	t0,t0,24 # 800000ce <exec_elf+0x54>
800000bc:	34129073          	csrw	mepc,t0
800000c0:	4885                	li	a7,1
800000c2:	03100513          	li	a0,49
800000c6:	00000073          	ecall
800000ca:	30200073          	mret
800000ce:	0001                	nop

800000d0 <exec_elf_smode_trampoline>:
800000d0:	4885                	li	a7,1
800000d2:	03200513          	li	a0,50
800000d6:	00000073          	ecall
800000da:	800002b7          	lui	t0,0x80000
800000de:	00c4d313          	srli	t1,s1,0xc
800000e2:	0062e2b3          	or	t0,t0,t1
800000e6:	18029073          	csrw	satp,t0
800000ea:	12000073          	sfence.vma
800000ee:	4885                	li	a7,1
800000f0:	03300513          	li	a0,51
800000f4:	00000073          	ecall
800000f8:	4885                	li	a7,1
800000fa:	8522                	mv	a0,s0
800000fc:	00000073          	ecall
80000100:	02000293          	li	t0,32
80000104:	10029073          	csrw	sstatus,t0
80000108:	4885                	li	a7,1
8000010a:	8522                	mv	a0,s0
8000010c:	00000073          	ecall
80000110:	82a2                	mv	t0,s0
80000112:	14129073          	csrw	sepc,t0
80000116:	7ffff137          	lui	sp,0x7ffff
8000011a:	4501                	li	a0,0
8000011c:	4581                	li	a1,0
8000011e:	4885                	li	a7,1
80000120:	03400513          	li	a0,52
80000124:	00000073          	ecall
80000128:	10200073          	sret

8000012c <kernelvec>:
8000012c:	7139                	addi	sp,sp,-64
8000012e:	c006                	sw	ra,0(sp)
80000130:	c216                	sw	t0,4(sp)
80000132:	c41a                	sw	t1,8(sp)
80000134:	4082                	lw	ra,0(sp)
80000136:	4292                	lw	t0,4(sp)
80000138:	4322                	lw	t1,8(sp)
8000013a:	6121                	addi	sp,sp,64
8000013c:	10200073          	sret

80000140 <stvec_handler>:
80000140:	14011173          	csrrw	sp,sscratch,sp
80000144:	7175                	addi	sp,sp,-144
80000146:	c616                	sw	t0,12(sp)
80000148:	140022f3          	csrr	t0,sscratch
8000014c:	dc96                	sw	t0,120(sp)
8000014e:	09010293          	addi	t0,sp,144 # 7ffff090 <_entry-0xf70>
80000152:	de96                	sw	t0,124(sp)
80000154:	141022f3          	csrr	t0,sepc
80000158:	c116                	sw	t0,128(sp)
8000015a:	100022f3          	csrr	t0,sstatus
8000015e:	c316                	sw	t0,132(sp)
80000160:	00000297          	auipc	t0,0x0
80000164:	fcc28293          	addi	t0,t0,-52 # 8000012c <kernelvec>
80000168:	10529073          	csrw	stvec,t0
8000016c:	c006                	sw	ra,0(sp)
8000016e:	c20e                	sw	gp,4(sp)
80000170:	c412                	sw	tp,8(sp)
80000172:	c81a                	sw	t1,16(sp)
80000174:	ca1e                	sw	t2,20(sp)
80000176:	cc22                	sw	s0,24(sp)
80000178:	ce26                	sw	s1,28(sp)
8000017a:	d02a                	sw	a0,32(sp)
8000017c:	d22e                	sw	a1,36(sp)
8000017e:	d432                	sw	a2,40(sp)
80000180:	d636                	sw	a3,44(sp)
80000182:	d83a                	sw	a4,48(sp)
80000184:	da3e                	sw	a5,52(sp)
80000186:	dc42                	sw	a6,56(sp)
80000188:	de46                	sw	a7,60(sp)
8000018a:	c0ca                	sw	s2,64(sp)
8000018c:	c2ce                	sw	s3,68(sp)
8000018e:	c4d2                	sw	s4,72(sp)
80000190:	c6d6                	sw	s5,76(sp)
80000192:	c8da                	sw	s6,80(sp)
80000194:	cade                	sw	s7,84(sp)
80000196:	cce2                	sw	s8,88(sp)
80000198:	cee6                	sw	s9,92(sp)
8000019a:	d0ea                	sw	s10,96(sp)
8000019c:	d2ee                	sw	s11,100(sp)
8000019e:	d4f2                	sw	t3,104(sp)
800001a0:	d6f6                	sw	t4,108(sp)
800001a2:	d8fa                	sw	t5,112(sp)
800001a4:	dafe                	sw	t6,116(sp)
800001a6:	10002373          	csrr	t1,sstatus
800001aa:	000402b7          	lui	t0,0x40
800001ae:	00536333          	or	t1,t1,t0
800001b2:	10031073          	csrw	sstatus,t1
800001b6:	142022f3          	csrr	t0,scause
800001ba:	4321                	li	t1,8
800001bc:	02629063          	bne	t0,t1,800001dc <non_syscall_trap>
800001c0:	850a                	mv	a0,sp
800001c2:	55f2                	lw	a1,60(sp)
800001c4:	5602                	lw	a2,32(sp)
800001c6:	5692                	lw	a3,36(sp)
800001c8:	5722                	lw	a4,40(sp)
800001ca:	57b2                	lw	a5,44(sp)
800001cc:	5842                	lw	a6,48(sp)
800001ce:	58d2                	lw	a7,52(sp)
800001d0:	698010ef          	jal	80001868 <handle_syscall>
800001d4:	428a                	lw	t0,128(sp)
800001d6:	0291                	addi	t0,t0,4 # 40004 <_entry-0x7ffbfffc>
800001d8:	c116                	sw	t0,128(sp)
800001da:	a839                	j	800001f8 <stvec_restore>

800001dc <non_syscall_trap>:
800001dc:	14202573          	csrr	a0,scause
800001e0:	458a                	lw	a1,128(sp)
800001e2:	650010ef          	jal	80001832 <handle_non_syscall_trap>
800001e6:	142022f3          	csrr	t0,scause
800001ea:	0002c563          	bltz	t0,800001f4 <is_interrupt>
800001ee:	428a                	lw	t0,128(sp)
800001f0:	0291                	addi	t0,t0,4
800001f2:	c116                	sw	t0,128(sp)

800001f4 <is_interrupt>:
800001f4:	a011                	j	800001f8 <stvec_restore>

800001f6 <child_trampoline>:
800001f6:	4501                	li	a0,0

800001f8 <stvec_restore>:
800001f8:	d02a                	sw	a0,32(sp)
800001fa:	00000297          	auipc	t0,0x0
800001fe:	f4628293          	addi	t0,t0,-186 # 80000140 <stvec_handler>
80000202:	10529073          	csrw	stvec,t0
80000206:	428a                	lw	t0,128(sp)
80000208:	14129073          	csrw	sepc,t0
8000020c:	429a                	lw	t0,132(sp)
8000020e:	10029073          	csrw	sstatus,t0
80000212:	52f6                	lw	t0,124(sp)
80000214:	14029073          	csrw	sscratch,t0
80000218:	4082                	lw	ra,0(sp)
8000021a:	4192                	lw	gp,4(sp)
8000021c:	4222                	lw	tp,8(sp)
8000021e:	42b2                	lw	t0,12(sp)
80000220:	4342                	lw	t1,16(sp)
80000222:	43d2                	lw	t2,20(sp)
80000224:	4462                	lw	s0,24(sp)
80000226:	44f2                	lw	s1,28(sp)
80000228:	5502                	lw	a0,32(sp)
8000022a:	5592                	lw	a1,36(sp)
8000022c:	5622                	lw	a2,40(sp)
8000022e:	56b2                	lw	a3,44(sp)
80000230:	5742                	lw	a4,48(sp)
80000232:	57d2                	lw	a5,52(sp)
80000234:	5862                	lw	a6,56(sp)
80000236:	58f2                	lw	a7,60(sp)
80000238:	4906                	lw	s2,64(sp)
8000023a:	4996                	lw	s3,68(sp)
8000023c:	4a26                	lw	s4,72(sp)
8000023e:	4ab6                	lw	s5,76(sp)
80000240:	4b46                	lw	s6,80(sp)
80000242:	4bd6                	lw	s7,84(sp)
80000244:	4c66                	lw	s8,88(sp)
80000246:	4cf6                	lw	s9,92(sp)
80000248:	5d06                	lw	s10,96(sp)
8000024a:	5d96                	lw	s11,100(sp)
8000024c:	5e26                	lw	t3,104(sp)
8000024e:	5eb6                	lw	t4,108(sp)
80000250:	5f46                	lw	t5,112(sp)
80000252:	5fd6                	lw	t6,116(sp)
80000254:	5166                	lw	sp,120(sp)
80000256:	10200073          	sret
8000025a:	0001                	nop

8000025c <sv32_enter_user>:
8000025c:	82aa                	mv	t0,a0
8000025e:	832e                	mv	t1,a1
80000260:	00000397          	auipc	t2,0x0
80000264:	ee038393          	addi	t2,t2,-288 # 80000140 <stvec_handler>
80000268:	10539073          	csrw	stvec,t2
8000026c:	10401073          	csrw	sie,zero
80000270:	10000393          	li	t2,256
80000274:	30239073          	csrw	medeleg,t2
80000278:	00019397          	auipc	t2,0x19
8000027c:	d8838393          	addi	t2,t2,-632 # 80019000 <_stack_top>
80000280:	14039073          	csrw	sscratch,t2
80000284:	7ffff137          	lui	sp,0x7ffff
80000288:	00c35e13          	srli	t3,t1,0xc
8000028c:	80000eb7          	lui	t4,0x80000
80000290:	01ceef33          	or	t5,t4,t3
80000294:	180f1073          	csrw	satp,t5
80000298:	12000073          	sfence.vma
8000029c:	7ffff3b7          	lui	t2,0x7ffff
800002a0:	14039073          	csrw	sscratch,t2
800002a4:	30002ff3          	csrr	t6,mstatus
800002a8:	000423b7          	lui	t2,0x42
800002ac:	a0038393          	addi	t2,t2,-1536 # 41a00 <_entry-0x7ffbe600>
800002b0:	fff3c393          	not	t2,t2
800002b4:	007fffb3          	and	t6,t6,t2
800002b8:	000403b7          	lui	t2,0x40
800002bc:	007fefb3          	or	t6,t6,t2
800002c0:	08000393          	li	t2,128
800002c4:	007fefb3          	or	t6,t6,t2
800002c8:	300f9073          	csrw	mstatus,t6
800002cc:	34129073          	csrw	mepc,t0
800002d0:	4501                	li	a0,0
800002d2:	4581                	li	a1,0
800002d4:	7ffff137          	lui	sp,0x7ffff
800002d8:	14129073          	csrw	sepc,t0
800002dc:	30200073          	mret
800002e0:	a001                	j	800002e0 <sv32_enter_user+0x84>

800002e2 <sret_to_user>:
800002e2:	00000297          	auipc	t0,0x0
800002e6:	e5e28293          	addi	t0,t0,-418 # 80000140 <stvec_handler>
800002ea:	10529073          	csrw	stvec,t0
800002ee:	00c52283          	lw	t0,12(a0)
800002f2:	0291                	addi	t0,t0,4
800002f4:	14129073          	csrw	sepc,t0
800002f8:	00452283          	lw	t0,4(a0)
800002fc:	14029073          	csrw	sscratch,t0
80000300:	000402b7          	lui	t0,0x40
80000304:	02028293          	addi	t0,t0,32 # 40020 <_entry-0x7ffbffe0>
80000308:	10029073          	csrw	sstatus,t0
8000030c:	01452083          	lw	ra,20(a0)
80000310:	01c52183          	lw	gp,28(a0)
80000314:	02052203          	lw	tp,32(a0)
80000318:	02852303          	lw	t1,40(a0)
8000031c:	02c52383          	lw	t2,44(a0)
80000320:	5900                	lw	s0,48(a0)
80000322:	5944                	lw	s1,52(a0)
80000324:	5d4c                	lw	a1,60(a0)
80000326:	4130                	lw	a2,64(a0)
80000328:	4174                	lw	a3,68(a0)
8000032a:	4538                	lw	a4,72(a0)
8000032c:	457c                	lw	a5,76(a0)
8000032e:	05052803          	lw	a6,80(a0)
80000332:	05452883          	lw	a7,84(a0)
80000336:	05852903          	lw	s2,88(a0)
8000033a:	05c52983          	lw	s3,92(a0)
8000033e:	06052a03          	lw	s4,96(a0)
80000342:	06452a83          	lw	s5,100(a0)
80000346:	06852b03          	lw	s6,104(a0)
8000034a:	06c52b83          	lw	s7,108(a0)
8000034e:	07052c03          	lw	s8,112(a0)
80000352:	07452c83          	lw	s9,116(a0)
80000356:	07852d03          	lw	s10,120(a0)
8000035a:	07c52d83          	lw	s11,124(a0)
8000035e:	08052e03          	lw	t3,128(a0)
80000362:	08452e83          	lw	t4,132(a0)
80000366:	08852f03          	lw	t5,136(a0)
8000036a:	08c52f83          	lw	t6,140(a0)
8000036e:	02452283          	lw	t0,36(a0)
80000372:	01852103          	lw	sp,24(a0)
80000376:	5d08                	lw	a0,56(a0)
80000378:	10200073          	sret

8000037c <stub_memmove>:
8000037c:	1141                	addi	sp,sp,-16 # 7fffeff0 <_entry-0x1010>
8000037e:	c622                	sw	s0,12(sp)
80000380:	0800                	addi	s0,sp,16
80000382:	ce09                	beqz	a2,8000039c <stub_memmove+0x20>
80000384:	00a5ef63          	bltu	a1,a0,800003a2 <stub_memmove+0x26>
80000388:	962e                	add	a2,a2,a1
8000038a:	87aa                	mv	a5,a0
8000038c:	0585                	addi	a1,a1,1
8000038e:	0785                	addi	a5,a5,1
80000390:	fff5c703          	lbu	a4,-1(a1)
80000394:	fee78fa3          	sb	a4,-1(a5)
80000398:	fec59ae3          	bne	a1,a2,8000038c <stub_memmove+0x10>
8000039c:	4432                	lw	s0,12(sp)
8000039e:	0141                	addi	sp,sp,16
800003a0:	8082                	ret
800003a2:	00c587b3          	add	a5,a1,a2
800003a6:	fef571e3          	bgeu	a0,a5,80000388 <stub_memmove+0xc>
800003aa:	962a                	add	a2,a2,a0
800003ac:	17fd                	addi	a5,a5,-1
800003ae:	167d                	addi	a2,a2,-1
800003b0:	0007c703          	lbu	a4,0(a5)
800003b4:	00e60023          	sb	a4,0(a2)
800003b8:	fef59ae3          	bne	a1,a5,800003ac <stub_memmove+0x30>
800003bc:	b7c5                	j	8000039c <stub_memmove+0x20>

800003be <print_str>:
800003be:	1141                	addi	sp,sp,-16
800003c0:	c606                	sw	ra,12(sp)
800003c2:	c422                	sw	s0,8(sp)
800003c4:	0800                	addi	s0,sp,16
800003c6:	c115                	beqz	a0,800003ea <print_str+0x2c>
800003c8:	c226                	sw	s1,4(sp)
800003ca:	84aa                	mv	s1,a0
800003cc:	00054503          	lbu	a0,0(a0)
800003d0:	c919                	beqz	a0,800003e6 <print_str+0x28>
800003d2:	0485                	addi	s1,s1,1
800003d4:	319d                	jal	8000003a <putchar>
800003d6:	0004c503          	lbu	a0,0(s1)
800003da:	fd65                	bnez	a0,800003d2 <print_str+0x14>
800003dc:	4492                	lw	s1,4(sp)
800003de:	40b2                	lw	ra,12(sp)
800003e0:	4422                	lw	s0,8(sp)
800003e2:	0141                	addi	sp,sp,16
800003e4:	8082                	ret
800003e6:	4492                	lw	s1,4(sp)
800003e8:	bfdd                	j	800003de <print_str+0x20>
800003ea:	00006517          	auipc	a0,0x6
800003ee:	c1650513          	addi	a0,a0,-1002 # 80006000 <consoleinit+0xbf6>
800003f2:	37f1                	jal	800003be <print_str>
800003f4:	b7ed                	j	800003de <print_str+0x20>

800003f6 <mycpu>:
800003f6:	1141                	addi	sp,sp,-16
800003f8:	c622                	sw	s0,12(sp)
800003fa:	0800                	addi	s0,sp,16
800003fc:	00007517          	auipc	a0,0x7
80000400:	c2450513          	addi	a0,a0,-988 # 80007020 <single_cpu>
80000404:	4432                	lw	s0,12(sp)
80000406:	0141                	addi	sp,sp,16
80000408:	8082                	ret

8000040a <myproc>:
8000040a:	1141                	addi	sp,sp,-16
8000040c:	c622                	sw	s0,12(sp)
8000040e:	0800                	addi	s0,sp,16
80000410:	00007517          	auipc	a0,0x7
80000414:	c0052503          	lw	a0,-1024(a0) # 80007010 <current_proc>
80000418:	c501                	beqz	a0,80000420 <myproc+0x16>
8000041a:	4432                	lw	s0,12(sp)
8000041c:	0141                	addi	sp,sp,16
8000041e:	8082                	ret
80000420:	00007797          	auipc	a5,0x7
80000424:	a307a783          	lw	a5,-1488(a5) # 80006e50 <dummy_proc+0x30>
80000428:	00007517          	auipc	a0,0x7
8000042c:	9f850513          	addi	a0,a0,-1544 # 80006e20 <dummy_proc>
80000430:	f7ed                	bnez	a5,8000041a <myproc+0x10>
80000432:	00007797          	auipc	a5,0x7
80000436:	c3278793          	addi	a5,a5,-974 # 80007064 <dummy_tf>
8000043a:	d91c                	sw	a5,48(a0)
8000043c:	bff9                	j	8000041a <myproc+0x10>

8000043e <child_entry>:
8000043e:	1141                	addi	sp,sp,-16
80000440:	c606                	sw	ra,12(sp)
80000442:	c422                	sw	s0,8(sp)
80000444:	0800                	addi	s0,sp,16
80000446:	37d1                	jal	8000040a <myproc>
80000448:	c511                	beqz	a0,80000454 <child_entry+0x16>
8000044a:	4791                	li	a5,4
8000044c:	c55c                	sw	a5,12(a0)
8000044e:	5908                	lw	a0,48(a0)
80000450:	c111                	beqz	a0,80000454 <child_entry+0x16>
80000452:	3d41                	jal	800002e2 <sret_to_user>
80000454:	a001                	j	80000454 <child_entry+0x16>

80000456 <set_myproc>:
80000456:	1141                	addi	sp,sp,-16
80000458:	c622                	sw	s0,12(sp)
8000045a:	0800                	addi	s0,sp,16
8000045c:	00007797          	auipc	a5,0x7
80000460:	baa7aa23          	sw	a0,-1100(a5) # 80007010 <current_proc>
80000464:	c511                	beqz	a0,80000470 <set_myproc+0x1a>
80000466:	515c                	lw	a5,36(a0)
80000468:	c781                	beqz	a5,80000470 <set_myproc+0x1a>
8000046a:	6705                	lui	a4,0x1
8000046c:	97ba                	add	a5,a5,a4
8000046e:	a029                	j	80000478 <set_myproc+0x22>
80000470:	00019797          	auipc	a5,0x19
80000474:	b9078793          	addi	a5,a5,-1136 # 80019000 <_stack_top>
80000478:	14079073          	csrw	sscratch,a5
8000047c:	c919                	beqz	a0,80000492 <set_myproc+0x3c>
8000047e:	555c                	lw	a5,44(a0)
80000480:	cb89                	beqz	a5,80000492 <set_myproc+0x3c>
80000482:	83b1                	srli	a5,a5,0xc
80000484:	80000737          	lui	a4,0x80000
80000488:	8fd9                	or	a5,a5,a4
8000048a:	18079073          	csrw	satp,a5
8000048e:	12000073          	sfence.vma
80000492:	4432                	lw	s0,12(sp)
80000494:	0141                	addi	sp,sp,16
80000496:	8082                	ret

80000498 <intr_on>:
80000498:	1141                	addi	sp,sp,-16
8000049a:	c622                	sw	s0,12(sp)
8000049c:	0800                	addi	s0,sp,16
8000049e:	4432                	lw	s0,12(sp)
800004a0:	0141                	addi	sp,sp,16
800004a2:	8082                	ret

800004a4 <intr_off>:
800004a4:	1141                	addi	sp,sp,-16
800004a6:	c622                	sw	s0,12(sp)
800004a8:	0800                	addi	s0,sp,16
800004aa:	4432                	lw	s0,12(sp)
800004ac:	0141                	addi	sp,sp,16
800004ae:	8082                	ret

800004b0 <intr_get>:
800004b0:	1141                	addi	sp,sp,-16
800004b2:	c622                	sw	s0,12(sp)
800004b4:	0800                	addi	s0,sp,16
800004b6:	4505                	li	a0,1
800004b8:	4432                	lw	s0,12(sp)
800004ba:	0141                	addi	sp,sp,16
800004bc:	8082                	ret

800004be <uartputc>:
800004be:	1141                	addi	sp,sp,-16
800004c0:	c606                	sw	ra,12(sp)
800004c2:	c422                	sw	s0,8(sp)
800004c4:	0800                	addi	s0,sp,16
800004c6:	3e95                	jal	8000003a <putchar>
800004c8:	40b2                	lw	ra,12(sp)
800004ca:	4422                	lw	s0,8(sp)
800004cc:	0141                	addi	sp,sp,16
800004ce:	8082                	ret

800004d0 <uartputc_sync>:
800004d0:	1141                	addi	sp,sp,-16
800004d2:	c606                	sw	ra,12(sp)
800004d4:	c422                	sw	s0,8(sp)
800004d6:	0800                	addi	s0,sp,16
800004d8:	368d                	jal	8000003a <putchar>
800004da:	40b2                	lw	ra,12(sp)
800004dc:	4422                	lw	s0,8(sp)
800004de:	0141                	addi	sp,sp,16
800004e0:	8082                	ret

800004e2 <uartinit>:
800004e2:	1141                	addi	sp,sp,-16
800004e4:	c622                	sw	s0,12(sp)
800004e6:	0800                	addi	s0,sp,16
800004e8:	4432                	lw	s0,12(sp)
800004ea:	0141                	addi	sp,sp,16
800004ec:	8082                	ret

800004ee <uartwrite>:
800004ee:	02b05763          	blez	a1,8000051c <uartwrite+0x2e>
800004f2:	1141                	addi	sp,sp,-16
800004f4:	c606                	sw	ra,12(sp)
800004f6:	c422                	sw	s0,8(sp)
800004f8:	c226                	sw	s1,4(sp)
800004fa:	c04a                	sw	s2,0(sp)
800004fc:	0800                	addi	s0,sp,16
800004fe:	84aa                	mv	s1,a0
80000500:	00b50933          	add	s2,a0,a1
80000504:	0004c503          	lbu	a0,0(s1)
80000508:	3e0d                	jal	8000003a <putchar>
8000050a:	0485                	addi	s1,s1,1
8000050c:	ff249ce3          	bne	s1,s2,80000504 <uartwrite+0x16>
80000510:	40b2                	lw	ra,12(sp)
80000512:	4422                	lw	s0,8(sp)
80000514:	4492                	lw	s1,4(sp)
80000516:	4902                	lw	s2,0(sp)
80000518:	0141                	addi	sp,sp,16
8000051a:	8082                	ret
8000051c:	8082                	ret

8000051e <kalloc>:
8000051e:	1141                	addi	sp,sp,-16
80000520:	c606                	sw	ra,12(sp)
80000522:	c422                	sw	s0,8(sp)
80000524:	0800                	addi	s0,sp,16
80000526:	3615                	jal	8000004a <kalloc_impl>
80000528:	40b2                	lw	ra,12(sp)
8000052a:	4422                	lw	s0,8(sp)
8000052c:	0141                	addi	sp,sp,16
8000052e:	8082                	ret

80000530 <kfree>:
80000530:	c911                	beqz	a0,80000544 <kfree+0x14>
80000532:	1141                	addi	sp,sp,-16
80000534:	c606                	sw	ra,12(sp)
80000536:	c422                	sw	s0,8(sp)
80000538:	0800                	addi	s0,sp,16
8000053a:	3e29                	jal	80000054 <kfree_impl>
8000053c:	40b2                	lw	ra,12(sp)
8000053e:	4422                	lw	s0,8(sp)
80000540:	0141                	addi	sp,sp,16
80000542:	8082                	ret
80000544:	8082                	ret

80000546 <kvminit>:
80000546:	1141                	addi	sp,sp,-16
80000548:	c622                	sw	s0,12(sp)
8000054a:	0800                	addi	s0,sp,16
8000054c:	4432                	lw	s0,12(sp)
8000054e:	0141                	addi	sp,sp,16
80000550:	8082                	ret

80000552 <kvminithart>:
80000552:	1141                	addi	sp,sp,-16
80000554:	c622                	sw	s0,12(sp)
80000556:	0800                	addi	s0,sp,16
80000558:	4432                	lw	s0,12(sp)
8000055a:	0141                	addi	sp,sp,16
8000055c:	8082                	ret

8000055e <uvminit>:
8000055e:	1141                	addi	sp,sp,-16
80000560:	c622                	sw	s0,12(sp)
80000562:	0800                	addi	s0,sp,16
80000564:	4432                	lw	s0,12(sp)
80000566:	0141                	addi	sp,sp,16
80000568:	8082                	ret

8000056a <uvmalloc>:
8000056a:	1141                	addi	sp,sp,-16
8000056c:	c622                	sw	s0,12(sp)
8000056e:	0800                	addi	s0,sp,16
80000570:	8532                	mv	a0,a2
80000572:	4432                	lw	s0,12(sp)
80000574:	0141                	addi	sp,sp,16
80000576:	8082                	ret

80000578 <uvmdealloc>:
80000578:	1141                	addi	sp,sp,-16
8000057a:	c622                	sw	s0,12(sp)
8000057c:	0800                	addi	s0,sp,16
8000057e:	8532                	mv	a0,a2
80000580:	4432                	lw	s0,12(sp)
80000582:	0141                	addi	sp,sp,16
80000584:	8082                	ret

80000586 <freewalk>:
80000586:	1141                	addi	sp,sp,-16
80000588:	c622                	sw	s0,12(sp)
8000058a:	0800                	addi	s0,sp,16
8000058c:	4432                	lw	s0,12(sp)
8000058e:	0141                	addi	sp,sp,16
80000590:	8082                	ret

80000592 <uvmunmap>:
80000592:	1141                	addi	sp,sp,-16
80000594:	c622                	sw	s0,12(sp)
80000596:	0800                	addi	s0,sp,16
80000598:	4432                	lw	s0,12(sp)
8000059a:	0141                	addi	sp,sp,16
8000059c:	8082                	ret

8000059e <uvmclear>:
8000059e:	1141                	addi	sp,sp,-16
800005a0:	c622                	sw	s0,12(sp)
800005a2:	0800                	addi	s0,sp,16
800005a4:	4432                	lw	s0,12(sp)
800005a6:	0141                	addi	sp,sp,16
800005a8:	8082                	ret

800005aa <walkaddr>:
800005aa:	1141                	addi	sp,sp,-16
800005ac:	c622                	sw	s0,12(sp)
800005ae:	0800                	addi	s0,sp,16
800005b0:	852e                	mv	a0,a1
800005b2:	4432                	lw	s0,12(sp)
800005b4:	0141                	addi	sp,sp,16
800005b6:	8082                	ret

800005b8 <mappages>:
800005b8:	1141                	addi	sp,sp,-16
800005ba:	c622                	sw	s0,12(sp)
800005bc:	0800                	addi	s0,sp,16
800005be:	4501                	li	a0,0
800005c0:	4432                	lw	s0,12(sp)
800005c2:	0141                	addi	sp,sp,16
800005c4:	8082                	ret

800005c6 <kvmpa>:
800005c6:	1141                	addi	sp,sp,-16
800005c8:	c622                	sw	s0,12(sp)
800005ca:	0800                	addi	s0,sp,16
800005cc:	4432                	lw	s0,12(sp)
800005ce:	0141                	addi	sp,sp,16
800005d0:	8082                	ret

800005d2 <procinit>:
800005d2:	1141                	addi	sp,sp,-16
800005d4:	c622                	sw	s0,12(sp)
800005d6:	0800                	addi	s0,sp,16
800005d8:	4432                	lw	s0,12(sp)
800005da:	0141                	addi	sp,sp,16
800005dc:	8082                	ret

800005de <trapinit>:
800005de:	1141                	addi	sp,sp,-16
800005e0:	c622                	sw	s0,12(sp)
800005e2:	0800                	addi	s0,sp,16
800005e4:	4432                	lw	s0,12(sp)
800005e6:	0141                	addi	sp,sp,16
800005e8:	8082                	ret

800005ea <trapinithart>:
800005ea:	1141                	addi	sp,sp,-16
800005ec:	c622                	sw	s0,12(sp)
800005ee:	0800                	addi	s0,sp,16
800005f0:	4432                	lw	s0,12(sp)
800005f2:	0141                	addi	sp,sp,16
800005f4:	8082                	ret

800005f6 <plicinit>:
800005f6:	1141                	addi	sp,sp,-16
800005f8:	c622                	sw	s0,12(sp)
800005fa:	0800                	addi	s0,sp,16
800005fc:	4432                	lw	s0,12(sp)
800005fe:	0141                	addi	sp,sp,16
80000600:	8082                	ret

80000602 <plicinithart>:
80000602:	1141                	addi	sp,sp,-16
80000604:	c622                	sw	s0,12(sp)
80000606:	0800                	addi	s0,sp,16
80000608:	4432                	lw	s0,12(sp)
8000060a:	0141                	addi	sp,sp,16
8000060c:	8082                	ret

8000060e <plic_claim>:
8000060e:	1141                	addi	sp,sp,-16
80000610:	c622                	sw	s0,12(sp)
80000612:	0800                	addi	s0,sp,16
80000614:	4501                	li	a0,0
80000616:	4432                	lw	s0,12(sp)
80000618:	0141                	addi	sp,sp,16
8000061a:	8082                	ret

8000061c <plic_complete>:
8000061c:	1141                	addi	sp,sp,-16
8000061e:	c622                	sw	s0,12(sp)
80000620:	0800                	addi	s0,sp,16
80000622:	4432                	lw	s0,12(sp)
80000624:	0141                	addi	sp,sp,16
80000626:	8082                	ret

80000628 <timerinit>:
80000628:	1141                	addi	sp,sp,-16
8000062a:	c622                	sw	s0,12(sp)
8000062c:	0800                	addi	s0,sp,16
8000062e:	4432                	lw	s0,12(sp)
80000630:	0141                	addi	sp,sp,16
80000632:	8082                	ret

80000634 <virtio_disk_init>:
80000634:	1141                	addi	sp,sp,-16
80000636:	c622                	sw	s0,12(sp)
80000638:	0800                	addi	s0,sp,16
8000063a:	4432                	lw	s0,12(sp)
8000063c:	0141                	addi	sp,sp,16
8000063e:	8082                	ret

80000640 <virtio_disk_rw>:
80000640:	1141                	addi	sp,sp,-16
80000642:	c606                	sw	ra,12(sp)
80000644:	c422                	sw	s0,8(sp)
80000646:	c226                	sw	s1,4(sp)
80000648:	0800                	addi	s0,sp,16
8000064a:	84aa                	mv	s1,a0
8000064c:	c18d                	beqz	a1,8000066e <virtio_disk_rw+0x2e>
8000064e:	4548                	lw	a0,12(a0)
80000650:	03448593          	addi	a1,s1,52
80000654:	0506                	slli	a0,a0,0x1
80000656:	3c09                	jal	80000068 <disk_write_impl>
80000658:	44c8                	lw	a0,12(s1)
8000065a:	0506                	slli	a0,a0,0x1
8000065c:	23448593          	addi	a1,s1,564
80000660:	0505                	addi	a0,a0,1
80000662:	3419                	jal	80000068 <disk_write_impl>
80000664:	40b2                	lw	ra,12(sp)
80000666:	4422                	lw	s0,8(sp)
80000668:	4492                	lw	s1,4(sp)
8000066a:	0141                	addi	sp,sp,16
8000066c:	8082                	ret
8000066e:	4548                	lw	a0,12(a0)
80000670:	03448593          	addi	a1,s1,52
80000674:	0506                	slli	a0,a0,0x1
80000676:	32e5                	jal	8000005e <disk_read_impl>
80000678:	44c8                	lw	a0,12(s1)
8000067a:	0506                	slli	a0,a0,0x1
8000067c:	23448593          	addi	a1,s1,564
80000680:	0505                	addi	a0,a0,1
80000682:	3af1                	jal	8000005e <disk_read_impl>
80000684:	b7c5                	j	80000664 <virtio_disk_rw+0x24>

80000686 <printf>:
80000686:	711d                	addi	sp,sp,-96
80000688:	de06                	sw	ra,60(sp)
8000068a:	dc22                	sw	s0,56(sp)
8000068c:	da26                	sw	s1,52(sp)
8000068e:	0080                	addi	s0,sp,64
80000690:	84aa                	mv	s1,a0
80000692:	c04c                	sw	a1,4(s0)
80000694:	c410                	sw	a2,8(s0)
80000696:	c454                	sw	a3,12(s0)
80000698:	c818                	sw	a4,16(s0)
8000069a:	c85c                	sw	a5,20(s0)
8000069c:	01042c23          	sw	a6,24(s0)
800006a0:	01142e23          	sw	a7,28(s0)
800006a4:	00440793          	addi	a5,s0,4
800006a8:	fcf42623          	sw	a5,-52(s0)
800006ac:	00054503          	lbu	a0,0(a0)
800006b0:	14050963          	beqz	a0,80000802 <printf+0x17c>
800006b4:	d84a                	sw	s2,48(sp)
800006b6:	d64e                	sw	s3,44(sp)
800006b8:	d452                	sw	s4,40(sp)
800006ba:	d256                	sw	s5,36(sp)
800006bc:	d05a                	sw	s6,32(sp)
800006be:	ce5e                	sw	s7,28(sp)
800006c0:	cc62                	sw	s8,24(sp)
800006c2:	ca66                	sw	s9,20(sp)
800006c4:	02500993          	li	s3,37
800006c8:	06400a13          	li	s4,100
800006cc:	07300b93          	li	s7,115
800006d0:	07800c13          	li	s8,120
800006d4:	5af1                	li	s5,-4
800006d6:	4b25                	li	s6,9
800006d8:	a809                	j	800006ea <printf+0x64>
800006da:	3285                	jal	8000003a <putchar>
800006dc:	8926                	mv	s2,s1
800006de:	00190493          	addi	s1,s2,1
800006e2:	00194503          	lbu	a0,1(s2)
800006e6:	10050663          	beqz	a0,800007f2 <printf+0x16c>
800006ea:	ff3518e3          	bne	a0,s3,800006da <printf+0x54>
800006ee:	00148913          	addi	s2,s1,1
800006f2:	0014c783          	lbu	a5,1(s1)
800006f6:	05478263          	beq	a5,s4,8000073a <printf+0xb4>
800006fa:	02fa7163          	bgeu	s4,a5,8000071c <printf+0x96>
800006fe:	0d778563          	beq	a5,s7,800007c8 <printf+0x142>
80000702:	0f879063          	bne	a5,s8,800007e2 <printf+0x15c>
80000706:	fcc42783          	lw	a5,-52(s0)
8000070a:	00478713          	addi	a4,a5,4
8000070e:	fce42623          	sw	a4,-52(s0)
80000712:	0007ac83          	lw	s9,0(a5)
80000716:	4701                	li	a4,0
80000718:	44f1                	li	s1,28
8000071a:	a861                	j	800007b2 <printf+0x12c>
8000071c:	0b378f63          	beq	a5,s3,800007da <printf+0x154>
80000720:	06300713          	li	a4,99
80000724:	0ae79f63          	bne	a5,a4,800007e2 <printf+0x15c>
80000728:	fcc42783          	lw	a5,-52(s0)
8000072c:	00478713          	addi	a4,a5,4
80000730:	fce42623          	sw	a4,-52(s0)
80000734:	4388                	lw	a0,0(a5)
80000736:	3211                	jal	8000003a <putchar>
80000738:	b75d                	j	800006de <printf+0x58>
8000073a:	fcc42783          	lw	a5,-52(s0)
8000073e:	00478713          	addi	a4,a5,4
80000742:	fce42623          	sw	a4,-52(s0)
80000746:	0007ac83          	lw	s9,0(a5)
8000074a:	000cc863          	bltz	s9,8000075a <printf+0xd4>
8000074e:	000c9b63          	bnez	s9,80000764 <printf+0xde>
80000752:	03000513          	li	a0,48
80000756:	30d5                	jal	8000003a <putchar>
80000758:	b759                	j	800006de <printf+0x58>
8000075a:	02d00513          	li	a0,45
8000075e:	38f1                	jal	8000003a <putchar>
80000760:	41900cb3          	neg	s9,s9
80000764:	4701                	li	a4,0
80000766:	46a9                	li	a3,10
80000768:	4625                	li	a2,9
8000076a:	0705                	addi	a4,a4,1 # 80000001 <_entry+0x1>
8000076c:	fc040793          	addi	a5,s0,-64
80000770:	00e784b3          	add	s1,a5,a4
80000774:	02dce7b3          	rem	a5,s9,a3
80000778:	03078793          	addi	a5,a5,48
8000077c:	fef48fa3          	sb	a5,-1(s1)
80000780:	87e6                	mv	a5,s9
80000782:	02dcccb3          	div	s9,s9,a3
80000786:	fef642e3          	blt	a2,a5,8000076a <printf+0xe4>
8000078a:	f4e05ae3          	blez	a4,800006de <printf+0x58>
8000078e:	fc040c93          	addi	s9,s0,-64
80000792:	fff4c503          	lbu	a0,-1(s1)
80000796:	3055                	jal	8000003a <putchar>
80000798:	14fd                	addi	s1,s1,-1
8000079a:	ff949ce3          	bne	s1,s9,80000792 <printf+0x10c>
8000079e:	b781                	j	800006de <printf+0x58>
800007a0:	05778513          	addi	a0,a5,87
800007a4:	00fb5f63          	bge	s6,a5,800007c2 <printf+0x13c>
800007a8:	3849                	jal	8000003a <putchar>
800007aa:	14f1                	addi	s1,s1,-4
800007ac:	f35489e3          	beq	s1,s5,800006de <printf+0x58>
800007b0:	4705                	li	a4,1
800007b2:	009cd7b3          	srl	a5,s9,s1
800007b6:	8bbd                	andi	a5,a5,15
800007b8:	8f5d                	or	a4,a4,a5
800007ba:	f37d                	bnez	a4,800007a0 <printf+0x11a>
800007bc:	c099                	beqz	s1,800007c2 <printf+0x13c>
800007be:	14f1                	addi	s1,s1,-4
800007c0:	bfcd                	j	800007b2 <printf+0x12c>
800007c2:	03078513          	addi	a0,a5,48
800007c6:	b7cd                	j	800007a8 <printf+0x122>
800007c8:	fcc42783          	lw	a5,-52(s0)
800007cc:	00478713          	addi	a4,a5,4
800007d0:	fce42623          	sw	a4,-52(s0)
800007d4:	4388                	lw	a0,0(a5)
800007d6:	36e5                	jal	800003be <print_str>
800007d8:	b719                	j	800006de <printf+0x58>
800007da:	854e                	mv	a0,s3
800007dc:	85fff0ef          	jal	8000003a <putchar>
800007e0:	bdfd                	j	800006de <printf+0x58>
800007e2:	854e                	mv	a0,s3
800007e4:	857ff0ef          	jal	8000003a <putchar>
800007e8:	0014c503          	lbu	a0,1(s1)
800007ec:	84fff0ef          	jal	8000003a <putchar>
800007f0:	b5fd                	j	800006de <printf+0x58>
800007f2:	5942                	lw	s2,48(sp)
800007f4:	59b2                	lw	s3,44(sp)
800007f6:	5a22                	lw	s4,40(sp)
800007f8:	5a92                	lw	s5,36(sp)
800007fa:	5b02                	lw	s6,32(sp)
800007fc:	4bf2                	lw	s7,28(sp)
800007fe:	4c62                	lw	s8,24(sp)
80000800:	4cd2                	lw	s9,20(sp)
80000802:	4501                	li	a0,0
80000804:	50f2                	lw	ra,60(sp)
80000806:	5462                	lw	s0,56(sp)
80000808:	54d2                	lw	s1,52(sp)
8000080a:	6125                	addi	sp,sp,96
8000080c:	8082                	ret

8000080e <procdump>:
8000080e:	1141                	addi	sp,sp,-16
80000810:	c606                	sw	ra,12(sp)
80000812:	c422                	sw	s0,8(sp)
80000814:	0800                	addi	s0,sp,16
80000816:	00005517          	auipc	a0,0x5
8000081a:	7f650513          	addi	a0,a0,2038 # 8000600c <consoleinit+0xc02>
8000081e:	35a5                	jal	80000686 <printf>
80000820:	40b2                	lw	ra,12(sp)
80000822:	4422                	lw	s0,8(sp)
80000824:	0141                	addi	sp,sp,16
80000826:	8082                	ret

80000828 <panic>:
80000828:	1141                	addi	sp,sp,-16
8000082a:	c606                	sw	ra,12(sp)
8000082c:	c422                	sw	s0,8(sp)
8000082e:	0800                	addi	s0,sp,16
80000830:	85aa                	mv	a1,a0
80000832:	00005517          	auipc	a0,0x5
80000836:	7fa50513          	addi	a0,a0,2042 # 8000602c <consoleinit+0xc22>
8000083a:	35b1                	jal	80000686 <printf>
8000083c:	837ff0ef          	jal	80000072 <shutdown>

80000840 <copyout>:
80000840:	c6c1                	beqz	a3,800008c8 <copyout+0x88>
80000842:	7179                	addi	sp,sp,-48
80000844:	d606                	sw	ra,44(sp)
80000846:	d422                	sw	s0,40(sp)
80000848:	d226                	sw	s1,36(sp)
8000084a:	d04a                	sw	s2,32(sp)
8000084c:	ce4e                	sw	s3,28(sp)
8000084e:	cc52                	sw	s4,24(sp)
80000850:	ca56                	sw	s5,20(sp)
80000852:	c85a                	sw	s6,16(sp)
80000854:	c65e                	sw	s7,12(sp)
80000856:	c462                	sw	s8,8(sp)
80000858:	c266                	sw	s9,4(sp)
8000085a:	1800                	addi	s0,sp,48
8000085c:	89aa                	mv	s3,a0
8000085e:	8a2e                	mv	s4,a1
80000860:	8ab2                	mv	s5,a2
80000862:	8936                	mv	s2,a3
80000864:	4481                	li	s1,0
80000866:	6b05                	lui	s6,0x1
80000868:	fffb0b93          	addi	s7,s6,-1 # fff <_entry-0x7ffff001>
8000086c:	4c15                	li	s8,5
8000086e:	a819                	j	80000884 <copyout+0x44>
80000870:	83a9                	srli	a5,a5,0xa
80000872:	07b2                	slli	a5,a5,0xc
80000874:	8666                	mv	a2,s9
80000876:	009a85b3          	add	a1,s5,s1
8000087a:	953e                	add	a0,a0,a5
8000087c:	3601                	jal	8000037c <stub_memmove>
8000087e:	94e6                	add	s1,s1,s9
80000880:	0524f263          	bgeu	s1,s2,800008c4 <copyout+0x84>
80000884:	009a07b3          	add	a5,s4,s1
80000888:	00c7d713          	srli	a4,a5,0xc
8000088c:	3ff77713          	andi	a4,a4,1023
80000890:	0177f533          	and	a0,a5,s7
80000894:	83d9                	srli	a5,a5,0x16
80000896:	078a                	slli	a5,a5,0x2
80000898:	97ce                	add	a5,a5,s3
8000089a:	439c                	lw	a5,0(a5)
8000089c:	0017f693          	andi	a3,a5,1
800008a0:	c695                	beqz	a3,800008cc <copyout+0x8c>
800008a2:	83a9                	srli	a5,a5,0xa
800008a4:	07b2                	slli	a5,a5,0xc
800008a6:	070a                	slli	a4,a4,0x2
800008a8:	973e                	add	a4,a4,a5
800008aa:	431c                	lw	a5,0(a4)
800008ac:	0057f713          	andi	a4,a5,5
800008b0:	03871063          	bne	a4,s8,800008d0 <copyout+0x90>
800008b4:	40ab0733          	sub	a4,s6,a0
800008b8:	40990cb3          	sub	s9,s2,s1
800008bc:	fb977ae3          	bgeu	a4,s9,80000870 <copyout+0x30>
800008c0:	8cba                	mv	s9,a4
800008c2:	b77d                	j	80000870 <copyout+0x30>
800008c4:	4501                	li	a0,0
800008c6:	a031                	j	800008d2 <copyout+0x92>
800008c8:	4501                	li	a0,0
800008ca:	8082                	ret
800008cc:	557d                	li	a0,-1
800008ce:	a011                	j	800008d2 <copyout+0x92>
800008d0:	557d                	li	a0,-1
800008d2:	50b2                	lw	ra,44(sp)
800008d4:	5422                	lw	s0,40(sp)
800008d6:	5492                	lw	s1,36(sp)
800008d8:	5902                	lw	s2,32(sp)
800008da:	49f2                	lw	s3,28(sp)
800008dc:	4a62                	lw	s4,24(sp)
800008de:	4ad2                	lw	s5,20(sp)
800008e0:	4b42                	lw	s6,16(sp)
800008e2:	4bb2                	lw	s7,12(sp)
800008e4:	4c22                	lw	s8,8(sp)
800008e6:	4c92                	lw	s9,4(sp)
800008e8:	6145                	addi	sp,sp,48
800008ea:	8082                	ret

800008ec <copyin>:
800008ec:	c2c9                	beqz	a3,8000096e <copyin+0x82>
800008ee:	7179                	addi	sp,sp,-48
800008f0:	d606                	sw	ra,44(sp)
800008f2:	d422                	sw	s0,40(sp)
800008f4:	d226                	sw	s1,36(sp)
800008f6:	d04a                	sw	s2,32(sp)
800008f8:	ce4e                	sw	s3,28(sp)
800008fa:	cc52                	sw	s4,24(sp)
800008fc:	ca56                	sw	s5,20(sp)
800008fe:	c85a                	sw	s6,16(sp)
80000900:	c65e                	sw	s7,12(sp)
80000902:	c462                	sw	s8,8(sp)
80000904:	1800                	addi	s0,sp,48
80000906:	89aa                	mv	s3,a0
80000908:	8aae                	mv	s5,a1
8000090a:	8a32                	mv	s4,a2
8000090c:	8936                	mv	s2,a3
8000090e:	4481                	li	s1,0
80000910:	6b05                	lui	s6,0x1
80000912:	fffb0b93          	addi	s7,s6,-1 # fff <_entry-0x7ffff001>
80000916:	a819                	j	8000092c <copyin+0x40>
80000918:	83a9                	srli	a5,a5,0xa
8000091a:	07b2                	slli	a5,a5,0xc
8000091c:	8662                	mv	a2,s8
8000091e:	95be                	add	a1,a1,a5
80000920:	009a8533          	add	a0,s5,s1
80000924:	3ca1                	jal	8000037c <stub_memmove>
80000926:	94e2                	add	s1,s1,s8
80000928:	0524f163          	bgeu	s1,s2,8000096a <copyin+0x7e>
8000092c:	009a07b3          	add	a5,s4,s1
80000930:	00c7d713          	srli	a4,a5,0xc
80000934:	3ff77713          	andi	a4,a4,1023
80000938:	0177f5b3          	and	a1,a5,s7
8000093c:	83d9                	srli	a5,a5,0x16
8000093e:	078a                	slli	a5,a5,0x2
80000940:	97ce                	add	a5,a5,s3
80000942:	439c                	lw	a5,0(a5)
80000944:	0017f693          	andi	a3,a5,1
80000948:	c68d                	beqz	a3,80000972 <copyin+0x86>
8000094a:	83a9                	srli	a5,a5,0xa
8000094c:	07b2                	slli	a5,a5,0xc
8000094e:	070a                	slli	a4,a4,0x2
80000950:	973e                	add	a4,a4,a5
80000952:	431c                	lw	a5,0(a4)
80000954:	0017f713          	andi	a4,a5,1
80000958:	cb15                	beqz	a4,8000098c <copyin+0xa0>
8000095a:	40bb0733          	sub	a4,s6,a1
8000095e:	40990c33          	sub	s8,s2,s1
80000962:	fb877be3          	bgeu	a4,s8,80000918 <copyin+0x2c>
80000966:	8c3a                	mv	s8,a4
80000968:	bf45                	j	80000918 <copyin+0x2c>
8000096a:	4501                	li	a0,0
8000096c:	a021                	j	80000974 <copyin+0x88>
8000096e:	4501                	li	a0,0
80000970:	8082                	ret
80000972:	557d                	li	a0,-1
80000974:	50b2                	lw	ra,44(sp)
80000976:	5422                	lw	s0,40(sp)
80000978:	5492                	lw	s1,36(sp)
8000097a:	5902                	lw	s2,32(sp)
8000097c:	49f2                	lw	s3,28(sp)
8000097e:	4a62                	lw	s4,24(sp)
80000980:	4ad2                	lw	s5,20(sp)
80000982:	4b42                	lw	s6,16(sp)
80000984:	4bb2                	lw	s7,12(sp)
80000986:	4c22                	lw	s8,8(sp)
80000988:	6145                	addi	sp,sp,48
8000098a:	8082                	ret
8000098c:	557d                	li	a0,-1
8000098e:	b7dd                	j	80000974 <copyin+0x88>

80000990 <either_copyout>:
80000990:	1101                	addi	sp,sp,-32
80000992:	ce06                	sw	ra,28(sp)
80000994:	cc22                	sw	s0,24(sp)
80000996:	c84a                	sw	s2,16(sp)
80000998:	c64e                	sw	s3,12(sp)
8000099a:	c452                	sw	s4,8(sp)
8000099c:	1000                	addi	s0,sp,32
8000099e:	892e                	mv	s2,a1
800009a0:	89b2                	mv	s3,a2
800009a2:	8a36                	mv	s4,a3
800009a4:	c911                	beqz	a0,800009b8 <either_copyout+0x28>
800009a6:	3495                	jal	8000040a <myproc>
800009a8:	c51d                	beqz	a0,800009d6 <either_copyout+0x46>
800009aa:	5548                	lw	a0,44(a0)
800009ac:	c51d                	beqz	a0,800009da <either_copyout+0x4a>
800009ae:	86d2                	mv	a3,s4
800009b0:	864e                	mv	a2,s3
800009b2:	85ca                	mv	a1,s2
800009b4:	3571                	jal	80000840 <copyout>
800009b6:	a809                	j	800009c8 <either_copyout+0x38>
800009b8:	ca26                	sw	s1,20(sp)
800009ba:	84aa                	mv	s1,a0
800009bc:	8636                	mv	a2,a3
800009be:	85ce                	mv	a1,s3
800009c0:	854a                	mv	a0,s2
800009c2:	3a6d                	jal	8000037c <stub_memmove>
800009c4:	8526                	mv	a0,s1
800009c6:	44d2                	lw	s1,20(sp)
800009c8:	40f2                	lw	ra,28(sp)
800009ca:	4462                	lw	s0,24(sp)
800009cc:	4942                	lw	s2,16(sp)
800009ce:	49b2                	lw	s3,12(sp)
800009d0:	4a22                	lw	s4,8(sp)
800009d2:	6105                	addi	sp,sp,32
800009d4:	8082                	ret
800009d6:	557d                	li	a0,-1
800009d8:	bfc5                	j	800009c8 <either_copyout+0x38>
800009da:	557d                	li	a0,-1
800009dc:	b7f5                	j	800009c8 <either_copyout+0x38>

800009de <sched>:
800009de:	1141                	addi	sp,sp,-16
800009e0:	c606                	sw	ra,12(sp)
800009e2:	c422                	sw	s0,8(sp)
800009e4:	c226                	sw	s1,4(sp)
800009e6:	0800                	addi	s0,sp,16
800009e8:	340d                	jal	8000040a <myproc>
800009ea:	455c                	lw	a5,12(a0)
800009ec:	4711                	li	a4,4
800009ee:	02e78663          	beq	a5,a4,80000a1a <sched+0x3c>
800009f2:	84aa                	mv	s1,a0
800009f4:	cb85                	beqz	a5,80000a24 <sched+0x46>
800009f6:	00006797          	auipc	a5,0x6
800009fa:	60e7a783          	lw	a5,1550(a5) # 80007004 <sched_initialized>
800009fe:	cb85                	beqz	a5,80000a2e <sched+0x50>
80000a00:	00006597          	auipc	a1,0x6
80000a04:	6f458593          	addi	a1,a1,1780 # 800070f4 <sched_ctx>
80000a08:	03450513          	addi	a0,a0,52
80000a0c:	3e5010ef          	jal	800025f0 <swtch>
80000a10:	40b2                	lw	ra,12(sp)
80000a12:	4422                	lw	s0,8(sp)
80000a14:	4492                	lw	s1,4(sp)
80000a16:	0141                	addi	sp,sp,16
80000a18:	8082                	ret
80000a1a:	00005517          	auipc	a0,0x5
80000a1e:	61e50513          	addi	a0,a0,1566 # 80006038 <consoleinit+0xc2e>
80000a22:	3519                	jal	80000828 <panic>
80000a24:	00005517          	auipc	a0,0x5
80000a28:	62450513          	addi	a0,a0,1572 # 80006048 <consoleinit+0xc3e>
80000a2c:	3bf5                	jal	80000828 <panic>
80000a2e:	4785                	li	a5,1
80000a30:	00006717          	auipc	a4,0x6
80000a34:	5cf72a23          	sw	a5,1492(a4) # 80007004 <sched_initialized>
80000a38:	03450513          	addi	a0,a0,52
80000a3c:	85aa                	mv	a1,a0
80000a3e:	3b3010ef          	jal	800025f0 <swtch>
80000a42:	00006697          	auipc	a3,0x6
80000a46:	5de68693          	addi	a3,a3,1502 # 80007020 <single_cpu>
80000a4a:	00000797          	auipc	a5,0x0
80000a4e:	14e78793          	addi	a5,a5,334 # 80000b98 <scheduler_entry>
80000a52:	0cf6aa23          	sw	a5,212(a3)
80000a56:	50dc                	lw	a5,36(s1)
80000a58:	6705                	lui	a4,0x1
80000a5a:	fc070713          	addi	a4,a4,-64 # fc0 <_entry-0x7ffff040>
80000a5e:	97ba                	add	a5,a5,a4
80000a60:	0cf6ac23          	sw	a5,216(a3)
80000a64:	b775                	j	80000a10 <sched+0x32>

80000a66 <yield>:
80000a66:	1141                	addi	sp,sp,-16
80000a68:	c606                	sw	ra,12(sp)
80000a6a:	c422                	sw	s0,8(sp)
80000a6c:	0800                	addi	s0,sp,16
80000a6e:	3a71                	jal	8000040a <myproc>
80000a70:	c501                	beqz	a0,80000a78 <yield+0x12>
80000a72:	478d                	li	a5,3
80000a74:	c55c                	sw	a5,12(a0)
80000a76:	37a5                	jal	800009de <sched>
80000a78:	40b2                	lw	ra,12(sp)
80000a7a:	4422                	lw	s0,8(sp)
80000a7c:	0141                	addi	sp,sp,16
80000a7e:	8082                	ret

80000a80 <freeproc>:
80000a80:	cd21                	beqz	a0,80000ad8 <freeproc+0x58>
80000a82:	1141                	addi	sp,sp,-16
80000a84:	c606                	sw	ra,12(sp)
80000a86:	c422                	sw	s0,8(sp)
80000a88:	c226                	sw	s1,4(sp)
80000a8a:	0800                	addi	s0,sp,16
80000a8c:	84aa                	mv	s1,a0
80000a8e:	455c                	lw	a5,12(a0)
80000a90:	cf9d                	beqz	a5,80000ace <freeproc+0x4e>
80000a92:	5908                	lw	a0,48(a0)
80000a94:	c501                	beqz	a0,80000a9c <freeproc+0x1c>
80000a96:	3c69                	jal	80000530 <kfree>
80000a98:	0204a823          	sw	zero,48(s1)
80000a9c:	50c8                	lw	a0,36(s1)
80000a9e:	e511                	bnez	a0,80000aaa <freeproc+0x2a>
80000aa0:	06c48793          	addi	a5,s1,108
80000aa4:	0ac48693          	addi	a3,s1,172
80000aa8:	a801                	j	80000ab8 <freeproc+0x38>
80000aaa:	3459                	jal	80000530 <kfree>
80000aac:	0204a223          	sw	zero,36(s1)
80000ab0:	bfc5                	j	80000aa0 <freeproc+0x20>
80000ab2:	0791                	addi	a5,a5,4
80000ab4:	00d78763          	beq	a5,a3,80000ac2 <freeproc+0x42>
80000ab8:	4398                	lw	a4,0(a5)
80000aba:	df65                	beqz	a4,80000ab2 <freeproc+0x32>
80000abc:	0007a023          	sw	zero,0(a5)
80000ac0:	bfcd                	j	80000ab2 <freeproc+0x32>
80000ac2:	0204a623          	sw	zero,44(s1)
80000ac6:	0204a423          	sw	zero,40(s1)
80000aca:	0004a623          	sw	zero,12(s1)
80000ace:	40b2                	lw	ra,12(sp)
80000ad0:	4422                	lw	s0,8(sp)
80000ad2:	4492                	lw	s1,4(sp)
80000ad4:	0141                	addi	sp,sp,16
80000ad6:	8082                	ret
80000ad8:	8082                	ret

80000ada <scheduler>:
80000ada:	7179                	addi	sp,sp,-48
80000adc:	d606                	sw	ra,44(sp)
80000ade:	d422                	sw	s0,40(sp)
80000ae0:	d226                	sw	s1,36(sp)
80000ae2:	d04a                	sw	s2,32(sp)
80000ae4:	ce4e                	sw	s3,28(sp)
80000ae6:	cc52                	sw	s4,24(sp)
80000ae8:	ca56                	sw	s5,20(sp)
80000aea:	c85a                	sw	s6,16(sp)
80000aec:	c65e                	sw	s7,12(sp)
80000aee:	c462                	sw	s8,8(sp)
80000af0:	1800                	addi	s0,sp,48
80000af2:	3a21                	jal	8000040a <myproc>
80000af4:	8a2a                	mv	s4,a0
80000af6:	4a81                	li	s5,0
80000af8:	00009997          	auipc	s3,0x9
80000afc:	64098993          	addi	s3,s3,1600 # 8000a138 <bcache>
80000b00:	490d                	li	s2,3
80000b02:	4b91                	li	s7,4
80000b04:	00006b17          	auipc	s6,0x6
80000b08:	5f0b0b13          	addi	s6,s6,1520 # 800070f4 <sched_ctx>
80000b0c:	4c09                	li	s8,2
80000b0e:	a81d                	j	80000b44 <scheduler+0x6a>
80000b10:	01752623          	sw	s7,12(a0)
80000b14:	3289                	jal	80000456 <set_myproc>
80000b16:	03448593          	addi	a1,s1,52
80000b1a:	855a                	mv	a0,s6
80000b1c:	2d5010ef          	jal	800025f0 <swtch>
80000b20:	8552                	mv	a0,s4
80000b22:	3a15                	jal	80000456 <set_myproc>
80000b24:	0c048493          	addi	s1,s1,192
80000b28:	01348b63          	beq	s1,s3,80000b3e <scheduler+0x64>
80000b2c:	8526                	mv	a0,s1
80000b2e:	44dc                	lw	a5,12(s1)
80000b30:	ff279ae3          	bne	a5,s2,80000b24 <scheduler+0x4a>
80000b34:	fc0a9ee3          	bnez	s5,80000b10 <scheduler+0x36>
80000b38:	fc9a1ce3          	bne	s4,s1,80000b10 <scheduler+0x36>
80000b3c:	b7e5                	j	80000b24 <scheduler+0x4a>
80000b3e:	0a85                	addi	s5,s5,1
80000b40:	018a8763          	beq	s5,s8,80000b4e <scheduler+0x74>
80000b44:	00006497          	auipc	s1,0x6
80000b48:	5f448493          	addi	s1,s1,1524 # 80007138 <ptable>
80000b4c:	b7c5                	j	80000b2c <scheduler+0x52>
80000b4e:	000a0763          	beqz	s4,80000b5c <scheduler+0x82>
80000b52:	00ca2703          	lw	a4,12(s4)
80000b56:	478d                	li	a5,3
80000b58:	00f70e63          	beq	a4,a5,80000b74 <scheduler+0x9a>
80000b5c:	50b2                	lw	ra,44(sp)
80000b5e:	5422                	lw	s0,40(sp)
80000b60:	5492                	lw	s1,36(sp)
80000b62:	5902                	lw	s2,32(sp)
80000b64:	49f2                	lw	s3,28(sp)
80000b66:	4a62                	lw	s4,24(sp)
80000b68:	4ad2                	lw	s5,20(sp)
80000b6a:	4b42                	lw	s6,16(sp)
80000b6c:	4bb2                	lw	s7,12(sp)
80000b6e:	4c22                	lw	s8,8(sp)
80000b70:	6145                	addi	sp,sp,48
80000b72:	8082                	ret
80000b74:	4791                	li	a5,4
80000b76:	00fa2623          	sw	a5,12(s4)
80000b7a:	8552                	mv	a0,s4
80000b7c:	8dbff0ef          	jal	80000456 <set_myproc>
80000b80:	034a0593          	addi	a1,s4,52
80000b84:	00006517          	auipc	a0,0x6
80000b88:	57050513          	addi	a0,a0,1392 # 800070f4 <sched_ctx>
80000b8c:	265010ef          	jal	800025f0 <swtch>
80000b90:	4501                	li	a0,0
80000b92:	8c5ff0ef          	jal	80000456 <set_myproc>
80000b96:	b7d9                	j	80000b5c <scheduler+0x82>

80000b98 <scheduler_entry>:
80000b98:	1141                	addi	sp,sp,-16
80000b9a:	c606                	sw	ra,12(sp)
80000b9c:	c422                	sw	s0,8(sp)
80000b9e:	0800                	addi	s0,sp,16
80000ba0:	3f2d                	jal	80000ada <scheduler>
80000ba2:	bffd                	j	80000ba0 <scheduler_entry+0x8>

80000ba4 <sleep>:
80000ba4:	1141                	addi	sp,sp,-16
80000ba6:	c606                	sw	ra,12(sp)
80000ba8:	c422                	sw	s0,8(sp)
80000baa:	c226                	sw	s1,4(sp)
80000bac:	c04a                	sw	s2,0(sp)
80000bae:	0800                	addi	s0,sp,16
80000bb0:	892a                	mv	s2,a0
80000bb2:	84ae                	mv	s1,a1
80000bb4:	857ff0ef          	jal	8000040a <myproc>
80000bb8:	01252823          	sw	s2,16(a0)
80000bbc:	4789                	li	a5,2
80000bbe:	c55c                	sw	a5,12(a0)
80000bc0:	3d39                	jal	800009de <sched>
80000bc2:	c481                	beqz	s1,80000bca <sleep+0x26>
80000bc4:	8526                	mv	a0,s1
80000bc6:	56f010ef          	jal	80002934 <acquire>
80000bca:	40b2                	lw	ra,12(sp)
80000bcc:	4422                	lw	s0,8(sp)
80000bce:	4492                	lw	s1,4(sp)
80000bd0:	4902                	lw	s2,0(sp)
80000bd2:	0141                	addi	sp,sp,16
80000bd4:	8082                	ret

80000bd6 <kwait>:
80000bd6:	7139                	addi	sp,sp,-64
80000bd8:	de06                	sw	ra,60(sp)
80000bda:	dc22                	sw	s0,56(sp)
80000bdc:	da26                	sw	s1,52(sp)
80000bde:	d84a                	sw	s2,48(sp)
80000be0:	d64e                	sw	s3,44(sp)
80000be2:	d452                	sw	s4,40(sp)
80000be4:	d256                	sw	s5,36(sp)
80000be6:	d05a                	sw	s6,32(sp)
80000be8:	ce5e                	sw	s7,28(sp)
80000bea:	0080                	addi	s0,sp,64
80000bec:	8b2a                	mv	s6,a0
80000bee:	81dff0ef          	jal	8000040a <myproc>
80000bf2:	892a                	mv	s2,a0
80000bf4:	4b81                	li	s7,0
80000bf6:	4a15                	li	s4,5
80000bf8:	4a85                	li	s5,1
80000bfa:	04000993          	li	s3,64
80000bfe:	00006797          	auipc	a5,0x6
80000c02:	54678793          	addi	a5,a5,1350 # 80007144 <ptable+0xc>
80000c06:	4481                	li	s1,0
80000c08:	86de                	mv	a3,s7
80000c0a:	a88d                	j	80000c7c <kwait+0xa6>
80000c0c:	00149793          	slli	a5,s1,0x1
80000c10:	97a6                	add	a5,a5,s1
80000c12:	079a                	slli	a5,a5,0x6
80000c14:	00006717          	auipc	a4,0x6
80000c18:	52470713          	addi	a4,a4,1316 # 80007138 <ptable>
80000c1c:	97ba                	add	a5,a5,a4
80000c1e:	01c7a983          	lw	s3,28(a5)
80000c22:	020b1863          	bnez	s6,80000c52 <kwait+0x7c>
80000c26:	00149793          	slli	a5,s1,0x1
80000c2a:	97a6                	add	a5,a5,s1
80000c2c:	079a                	slli	a5,a5,0x6
80000c2e:	00006517          	auipc	a0,0x6
80000c32:	50a50513          	addi	a0,a0,1290 # 80007138 <ptable>
80000c36:	953e                	add	a0,a0,a5
80000c38:	35a1                	jal	80000a80 <freeproc>
80000c3a:	854e                	mv	a0,s3
80000c3c:	50f2                	lw	ra,60(sp)
80000c3e:	5462                	lw	s0,56(sp)
80000c40:	54d2                	lw	s1,52(sp)
80000c42:	5942                	lw	s2,48(sp)
80000c44:	59b2                	lw	s3,44(sp)
80000c46:	5a22                	lw	s4,40(sp)
80000c48:	5a92                	lw	s5,36(sp)
80000c4a:	5b02                	lw	s6,32(sp)
80000c4c:	4bf2                	lw	s7,28(sp)
80000c4e:	6121                	addi	sp,sp,64
80000c50:	8082                	ret
80000c52:	00149793          	slli	a5,s1,0x1
80000c56:	97a6                	add	a5,a5,s1
80000c58:	079a                	slli	a5,a5,0x6
80000c5a:	97ba                	add	a5,a5,a4
80000c5c:	4f9c                	lw	a5,24(a5)
80000c5e:	fcf42623          	sw	a5,-52(s0)
80000c62:	4691                	li	a3,4
80000c64:	fcc40613          	addi	a2,s0,-52
80000c68:	85da                	mv	a1,s6
80000c6a:	02c92503          	lw	a0,44(s2)
80000c6e:	3ec9                	jal	80000840 <copyout>
80000c70:	bf5d                	j	80000c26 <kwait+0x50>
80000c72:	0485                	addi	s1,s1,1
80000c74:	0c078793          	addi	a5,a5,192
80000c78:	01348a63          	beq	s1,s3,80000c8c <kwait+0xb6>
80000c7c:	4bd8                	lw	a4,20(a5)
80000c7e:	ff271ae3          	bne	a4,s2,80000c72 <kwait+0x9c>
80000c82:	4398                	lw	a4,0(a5)
80000c84:	f94704e3          	beq	a4,s4,80000c0c <kwait+0x36>
80000c88:	86d6                	mv	a3,s5
80000c8a:	b7e5                	j	80000c72 <kwait+0x9c>
80000c8c:	c689                	beqz	a3,80000c96 <kwait+0xc0>
80000c8e:	4581                	li	a1,0
80000c90:	854a                	mv	a0,s2
80000c92:	3f09                	jal	80000ba4 <sleep>
80000c94:	b7ad                	j	80000bfe <kwait+0x28>
80000c96:	59fd                	li	s3,-1
80000c98:	b74d                	j	80000c3a <kwait+0x64>

80000c9a <wakeup>:
80000c9a:	1141                	addi	sp,sp,-16
80000c9c:	c622                	sw	s0,12(sp)
80000c9e:	0800                	addi	s0,sp,16
80000ca0:	00006797          	auipc	a5,0x6
80000ca4:	4a478793          	addi	a5,a5,1188 # 80007144 <ptable+0xc>
80000ca8:	00009597          	auipc	a1,0x9
80000cac:	49c58593          	addi	a1,a1,1180 # 8000a144 <bcache+0xc>
80000cb0:	4609                	li	a2,2
80000cb2:	480d                	li	a6,3
80000cb4:	a029                	j	80000cbe <wakeup+0x24>
80000cb6:	0c078793          	addi	a5,a5,192
80000cba:	00b78b63          	beq	a5,a1,80000cd0 <wakeup+0x36>
80000cbe:	4398                	lw	a4,0(a5)
80000cc0:	fec71be3          	bne	a4,a2,80000cb6 <wakeup+0x1c>
80000cc4:	43d8                	lw	a4,4(a5)
80000cc6:	fea718e3          	bne	a4,a0,80000cb6 <wakeup+0x1c>
80000cca:	0107a023          	sw	a6,0(a5)
80000cce:	b7e5                	j	80000cb6 <wakeup+0x1c>
80000cd0:	4432                	lw	s0,12(sp)
80000cd2:	0141                	addi	sp,sp,16
80000cd4:	8082                	ret

80000cd6 <kexit>:
80000cd6:	1141                	addi	sp,sp,-16
80000cd8:	c606                	sw	ra,12(sp)
80000cda:	c422                	sw	s0,8(sp)
80000cdc:	c226                	sw	s1,4(sp)
80000cde:	c04a                	sw	s2,0(sp)
80000ce0:	0800                	addi	s0,sp,16
80000ce2:	892a                	mv	s2,a0
80000ce4:	f26ff0ef          	jal	8000040a <myproc>
80000ce8:	84aa                	mv	s1,a0
80000cea:	01252c23          	sw	s2,24(a0)
80000cee:	06c50793          	addi	a5,a0,108
80000cf2:	0ac50693          	addi	a3,a0,172
80000cf6:	a021                	j	80000cfe <kexit+0x28>
80000cf8:	0791                	addi	a5,a5,4
80000cfa:	00d78763          	beq	a5,a3,80000d08 <kexit+0x32>
80000cfe:	4398                	lw	a4,0(a5)
80000d00:	df65                	beqz	a4,80000cf8 <kexit+0x22>
80000d02:	0007a023          	sw	zero,0(a5)
80000d06:	bfcd                	j	80000cf8 <kexit+0x22>
80000d08:	4795                	li	a5,5
80000d0a:	c4dc                	sw	a5,12(s1)
80000d0c:	5088                	lw	a0,32(s1)
80000d0e:	3771                	jal	80000c9a <wakeup>
80000d10:	00006797          	auipc	a5,0x6
80000d14:	44878793          	addi	a5,a5,1096 # 80007158 <ptable+0x20>
80000d18:	00009697          	auipc	a3,0x9
80000d1c:	44068693          	addi	a3,a3,1088 # 8000a158 <bcache+0x20>
80000d20:	00006617          	auipc	a2,0x6
80000d24:	41860613          	addi	a2,a2,1048 # 80007138 <ptable>
80000d28:	a029                	j	80000d32 <kexit+0x5c>
80000d2a:	0c078793          	addi	a5,a5,192
80000d2e:	00d78763          	beq	a5,a3,80000d3c <kexit+0x66>
80000d32:	4398                	lw	a4,0(a5)
80000d34:	fe971be3          	bne	a4,s1,80000d2a <kexit+0x54>
80000d38:	c390                	sw	a2,0(a5)
80000d3a:	bfc5                	j	80000d2a <kexit+0x54>
80000d3c:	509c                	lw	a5,32(s1)
80000d3e:	c799                	beqz	a5,80000d4c <kexit+0x76>
80000d40:	3979                	jal	800009de <sched>
80000d42:	00005517          	auipc	a0,0x5
80000d46:	31650513          	addi	a0,a0,790 # 80006058 <consoleinit+0xc4e>
80000d4a:	3cf9                	jal	80000828 <panic>
80000d4c:	b26ff0ef          	jal	80000072 <shutdown>

80000d50 <kkill>:
80000d50:	1141                	addi	sp,sp,-16
80000d52:	c622                	sw	s0,12(sp)
80000d54:	0800                	addi	s0,sp,16
80000d56:	557d                	li	a0,-1
80000d58:	4432                	lw	s0,12(sp)
80000d5a:	0141                	addi	sp,sp,16
80000d5c:	8082                	ret

80000d5e <either_copyin>:
80000d5e:	1141                	addi	sp,sp,-16
80000d60:	c606                	sw	ra,12(sp)
80000d62:	c422                	sw	s0,8(sp)
80000d64:	0800                	addi	s0,sp,16
80000d66:	85b2                	mv	a1,a2
80000d68:	8636                	mv	a2,a3
80000d6a:	e12ff0ef          	jal	8000037c <stub_memmove>
80000d6e:	4501                	li	a0,0
80000d70:	40b2                	lw	ra,12(sp)
80000d72:	4422                	lw	s0,8(sp)
80000d74:	0141                	addi	sp,sp,16
80000d76:	8082                	ret

80000d78 <copyinstr>:
80000d78:	1141                	addi	sp,sp,-16
80000d7a:	c622                	sw	s0,12(sp)
80000d7c:	0800                	addi	s0,sp,16
80000d7e:	01665713          	srli	a4,a2,0x16
80000d82:	070a                	slli	a4,a4,0x2
80000d84:	972a                	add	a4,a4,a0
80000d86:	4318                	lw	a4,0(a4)
80000d88:	00177813          	andi	a6,a4,1
80000d8c:	08080e63          	beqz	a6,80000e28 <copyinstr+0xb0>
80000d90:	00c65793          	srli	a5,a2,0xc
80000d94:	3ff7f793          	andi	a5,a5,1023
80000d98:	8329                	srli	a4,a4,0xa
80000d9a:	0732                	slli	a4,a4,0xc
80000d9c:	078a                	slli	a5,a5,0x2
80000d9e:	97ba                	add	a5,a5,a4
80000da0:	0007a803          	lw	a6,0(a5)
80000da4:	00187793          	andi	a5,a6,1
80000da8:	c3d1                	beqz	a5,80000e2c <copyinstr+0xb4>
80000daa:	00a85813          	srli	a6,a6,0xa
80000dae:	0832                	slli	a6,a6,0xc
80000db0:	fff68313          	addi	t1,a3,-1
80000db4:	4785                	li	a5,1
80000db6:	06f68163          	beq	a3,a5,80000e18 <copyinstr+0xa0>
80000dba:	4781                	li	a5,0
80000dbc:	6885                	lui	a7,0x1
80000dbe:	18fd                	addi	a7,a7,-1 # fff <_entry-0x7ffff001>
80000dc0:	a839                	j	80000dde <copyinstr+0x66>
80000dc2:	00a85813          	srli	a6,a6,0xa
80000dc6:	0832                	slli	a6,a6,0xc
80000dc8:	9742                	add	a4,a4,a6
80000dca:	00074703          	lbu	a4,0(a4)
80000dce:	00f586b3          	add	a3,a1,a5
80000dd2:	00e68023          	sb	a4,0(a3)
80000dd6:	cf39                	beqz	a4,80000e34 <copyinstr+0xbc>
80000dd8:	0785                	addi	a5,a5,1
80000dda:	04678063          	beq	a5,t1,80000e1a <copyinstr+0xa2>
80000dde:	00f606b3          	add	a3,a2,a5
80000de2:	0116f733          	and	a4,a3,a7
80000de6:	f36d                	bnez	a4,80000dc8 <copyinstr+0x50>
80000de8:	d3e5                	beqz	a5,80000dc8 <copyinstr+0x50>
80000dea:	00c6d813          	srli	a6,a3,0xc
80000dee:	3ff87813          	andi	a6,a6,1023
80000df2:	82d9                	srli	a3,a3,0x16
80000df4:	068a                	slli	a3,a3,0x2
80000df6:	96aa                	add	a3,a3,a0
80000df8:	4294                	lw	a3,0(a3)
80000dfa:	0016fe13          	andi	t3,a3,1
80000dfe:	020e0963          	beqz	t3,80000e30 <copyinstr+0xb8>
80000e02:	82a9                	srli	a3,a3,0xa
80000e04:	06b2                	slli	a3,a3,0xc
80000e06:	080a                	slli	a6,a6,0x2
80000e08:	9836                	add	a6,a6,a3
80000e0a:	00082803          	lw	a6,0(a6)
80000e0e:	00187693          	andi	a3,a6,1
80000e12:	fac5                	bnez	a3,80000dc2 <copyinstr+0x4a>
80000e14:	557d                	li	a0,-1
80000e16:	a031                	j	80000e22 <copyinstr+0xaa>
80000e18:	4301                	li	t1,0
80000e1a:	959a                	add	a1,a1,t1
80000e1c:	00058023          	sb	zero,0(a1)
80000e20:	4501                	li	a0,0
80000e22:	4432                	lw	s0,12(sp)
80000e24:	0141                	addi	sp,sp,16
80000e26:	8082                	ret
80000e28:	557d                	li	a0,-1
80000e2a:	bfe5                	j	80000e22 <copyinstr+0xaa>
80000e2c:	557d                	li	a0,-1
80000e2e:	bfd5                	j	80000e22 <copyinstr+0xaa>
80000e30:	557d                	li	a0,-1
80000e32:	bfc5                	j	80000e22 <copyinstr+0xaa>
80000e34:	4501                	li	a0,0
80000e36:	b7f5                	j	80000e22 <copyinstr+0xaa>

80000e38 <killed>:
80000e38:	1141                	addi	sp,sp,-16
80000e3a:	c622                	sw	s0,12(sp)
80000e3c:	0800                	addi	s0,sp,16
80000e3e:	4501                	li	a0,0
80000e40:	4432                	lw	s0,12(sp)
80000e42:	0141                	addi	sp,sp,16
80000e44:	8082                	ret

80000e46 <alloc_pgtbl>:
80000e46:	1141                	addi	sp,sp,-16
80000e48:	c606                	sw	ra,12(sp)
80000e4a:	c422                	sw	s0,8(sp)
80000e4c:	0800                	addi	s0,sp,16
80000e4e:	9fcff0ef          	jal	8000004a <kalloc_impl>
80000e52:	c909                	beqz	a0,80000e64 <alloc_pgtbl+0x1e>
80000e54:	87aa                	mv	a5,a0
80000e56:	6705                	lui	a4,0x1
80000e58:	972a                	add	a4,a4,a0
80000e5a:	0007a023          	sw	zero,0(a5)
80000e5e:	0791                	addi	a5,a5,4
80000e60:	fee79de3          	bne	a5,a4,80000e5a <alloc_pgtbl+0x14>
80000e64:	40b2                	lw	ra,12(sp)
80000e66:	4422                	lw	s0,8(sp)
80000e68:	0141                	addi	sp,sp,16
80000e6a:	8082                	ret

80000e6c <uvmcreate>:
80000e6c:	1141                	addi	sp,sp,-16
80000e6e:	c606                	sw	ra,12(sp)
80000e70:	c422                	sw	s0,8(sp)
80000e72:	0800                	addi	s0,sp,16
80000e74:	3fc9                	jal	80000e46 <alloc_pgtbl>
80000e76:	40b2                	lw	ra,12(sp)
80000e78:	4422                	lw	s0,8(sp)
80000e7a:	0141                	addi	sp,sp,16
80000e7c:	8082                	ret

80000e7e <sv32_map_page>:
80000e7e:	00c5e7b3          	or	a5,a1,a2
80000e82:	07d2                	slli	a5,a5,0x14
80000e84:	e7ad                	bnez	a5,80000eee <sv32_map_page+0x70>
80000e86:	1101                	addi	sp,sp,-32
80000e88:	ce06                	sw	ra,28(sp)
80000e8a:	cc22                	sw	s0,24(sp)
80000e8c:	ca26                	sw	s1,20(sp)
80000e8e:	c84a                	sw	s2,16(sp)
80000e90:	c64e                	sw	s3,12(sp)
80000e92:	c452                	sw	s4,8(sp)
80000e94:	1000                	addi	s0,sp,32
80000e96:	84b2                	mv	s1,a2
80000e98:	8a36                	mv	s4,a3
80000e9a:	00c5d913          	srli	s2,a1,0xc
80000e9e:	3ff97913          	andi	s2,s2,1023
80000ea2:	81d9                	srli	a1,a1,0x16
80000ea4:	058a                	slli	a1,a1,0x2
80000ea6:	00b509b3          	add	s3,a0,a1
80000eaa:	0009a783          	lw	a5,0(s3)
80000eae:	8b85                	andi	a5,a5,1
80000eb0:	c795                	beqz	a5,80000edc <sv32_map_page+0x5e>
80000eb2:	0009a783          	lw	a5,0(s3)
80000eb6:	83a9                	srli	a5,a5,0xa
80000eb8:	07b2                	slli	a5,a5,0xc
80000eba:	090a                	slli	s2,s2,0x2
80000ebc:	993e                	add	s2,s2,a5
80000ebe:	80b1                	srli	s1,s1,0xc
80000ec0:	04aa                	slli	s1,s1,0xa
80000ec2:	0144e6b3          	or	a3,s1,s4
80000ec6:	00d92023          	sw	a3,0(s2)
80000eca:	4501                	li	a0,0
80000ecc:	40f2                	lw	ra,28(sp)
80000ece:	4462                	lw	s0,24(sp)
80000ed0:	44d2                	lw	s1,20(sp)
80000ed2:	4942                	lw	s2,16(sp)
80000ed4:	49b2                	lw	s3,12(sp)
80000ed6:	4a22                	lw	s4,8(sp)
80000ed8:	6105                	addi	sp,sp,32
80000eda:	8082                	ret
80000edc:	37ad                	jal	80000e46 <alloc_pgtbl>
80000ede:	c911                	beqz	a0,80000ef2 <sv32_map_page+0x74>
80000ee0:	8131                	srli	a0,a0,0xc
80000ee2:	052a                	slli	a0,a0,0xa
80000ee4:	00156513          	ori	a0,a0,1
80000ee8:	00a9a023          	sw	a0,0(s3)
80000eec:	b7d9                	j	80000eb2 <sv32_map_page+0x34>
80000eee:	557d                	li	a0,-1
80000ef0:	8082                	ret
80000ef2:	557d                	li	a0,-1
80000ef4:	bfe1                	j	80000ecc <sv32_map_page+0x4e>

80000ef6 <allocproc>:
80000ef6:	1101                	addi	sp,sp,-32
80000ef8:	ce06                	sw	ra,28(sp)
80000efa:	cc22                	sw	s0,24(sp)
80000efc:	ca26                	sw	s1,20(sp)
80000efe:	c64e                	sw	s3,12(sp)
80000f00:	1000                	addi	s0,sp,32
80000f02:	00006797          	auipc	a5,0x6
80000f06:	24278793          	addi	a5,a5,578 # 80007144 <ptable+0xc>
80000f0a:	4481                	li	s1,0
80000f0c:	04000693          	li	a3,64
80000f10:	4398                	lw	a4,0(a5)
80000f12:	cb01                	beqz	a4,80000f22 <allocproc+0x2c>
80000f14:	0485                	addi	s1,s1,1
80000f16:	0c078793          	addi	a5,a5,192
80000f1a:	fed49be3          	bne	s1,a3,80000f10 <allocproc+0x1a>
80000f1e:	4981                	li	s3,0
80000f20:	aa6d                	j	800010da <allocproc+0x1e4>
80000f22:	c84a                	sw	s2,16(sp)
80000f24:	00149793          	slli	a5,s1,0x1
80000f28:	97a6                	add	a5,a5,s1
80000f2a:	079a                	slli	a5,a5,0x6
80000f2c:	00006917          	auipc	s2,0x6
80000f30:	20c90913          	addi	s2,s2,524 # 80007138 <ptable>
80000f34:	993e                	add	s2,s2,a5
80000f36:	4785                	li	a5,1
80000f38:	00f92623          	sw	a5,12(s2)
80000f3c:	00006717          	auipc	a4,0x6
80000f40:	ed470713          	addi	a4,a4,-300 # 80006e10 <next_pid>
80000f44:	431c                	lw	a5,0(a4)
80000f46:	00178693          	addi	a3,a5,1
80000f4a:	c314                	sw	a3,0(a4)
80000f4c:	00f92e23          	sw	a5,28(s2)
80000f50:	02092023          	sw	zero,32(s2)
80000f54:	00092823          	sw	zero,16(s2)
80000f58:	00092a23          	sw	zero,20(s2)
80000f5c:	00092c23          	sw	zero,24(s2)
80000f60:	02092423          	sw	zero,40(s2)
80000f64:	8e6ff0ef          	jal	8000004a <kalloc_impl>
80000f68:	02a92223          	sw	a0,36(s2)
80000f6c:	8deff0ef          	jal	8000004a <kalloc_impl>
80000f70:	02a92823          	sw	a0,48(s2)
80000f74:	02492783          	lw	a5,36(s2)
80000f78:	c3fd                	beqz	a5,8000105e <allocproc+0x168>
80000f7a:	c175                	beqz	a0,8000105e <allocproc+0x168>
80000f7c:	c452                	sw	s4,8(sp)
80000f7e:	c256                	sw	s5,4(sp)
80000f80:	35d9                	jal	80000e46 <alloc_pgtbl>
80000f82:	89aa                	mv	s3,a0
80000f84:	00149793          	slli	a5,s1,0x1
80000f88:	97a6                	add	a5,a5,s1
80000f8a:	079a                	slli	a5,a5,0x6
80000f8c:	00006717          	auipc	a4,0x6
80000f90:	1ac70713          	addi	a4,a4,428 # 80007138 <ptable>
80000f94:	97ba                	add	a5,a5,a4
80000f96:	d7c8                	sw	a0,44(a5)
80000f98:	80000937          	lui	s2,0x80000
80000f9c:	cd79                	beqz	a0,8000107a <allocproc+0x184>
80000f9e:	00149793          	slli	a5,s1,0x1
80000fa2:	97a6                	add	a5,a5,s1
80000fa4:	079a                	slli	a5,a5,0x6
80000fa6:	00f709b3          	add	s3,a4,a5
80000faa:	6a85                	lui	s5,0x1
80000fac:	80600a37          	lui	s4,0x80600
80000fb0:	46bd                	li	a3,15
80000fb2:	864a                	mv	a2,s2
80000fb4:	85ca                	mv	a1,s2
80000fb6:	02c9a503          	lw	a0,44(s3)
80000fba:	35d1                	jal	80000e7e <sv32_map_page>
80000fbc:	e57d                	bnez	a0,800010aa <allocproc+0x1b4>
80000fbe:	9956                	add	s2,s2,s5
80000fc0:	ff4918e3          	bne	s2,s4,80000fb0 <allocproc+0xba>
80000fc4:	00149793          	slli	a5,s1,0x1
80000fc8:	97a6                	add	a5,a5,s1
80000fca:	079a                	slli	a5,a5,0x6
80000fcc:	00006717          	auipc	a4,0x6
80000fd0:	16c70713          	addi	a4,a4,364 # 80007138 <ptable>
80000fd4:	97ba                	add	a5,a5,a4
80000fd6:	5b9c                	lw	a5,48(a5)
80000fd8:	6705                	lui	a4,0x1
80000fda:	973e                	add	a4,a4,a5
80000fdc:	0007a023          	sw	zero,0(a5)
80000fe0:	0791                	addi	a5,a5,4
80000fe2:	fee79de3          	bne	a5,a4,80000fdc <allocproc+0xe6>
80000fe6:	00006617          	auipc	a2,0x6
80000fea:	15260613          	addi	a2,a2,338 # 80007138 <ptable>
80000fee:	00149793          	slli	a5,s1,0x1
80000ff2:	00978733          	add	a4,a5,s1
80000ff6:	071a                	slli	a4,a4,0x6
80000ff8:	9732                	add	a4,a4,a2
80000ffa:	5b14                	lw	a3,48(a4)
80000ffc:	5358                	lw	a4,36(a4)
80000ffe:	6585                	lui	a1,0x1
80001000:	972e                	add	a4,a4,a1
80001002:	c2d8                	sw	a4,4(a3)
80001004:	97a6                	add	a5,a5,s1
80001006:	00679693          	slli	a3,a5,0x6
8000100a:	06c68793          	addi	a5,a3,108
8000100e:	97b2                	add	a5,a5,a2
80001010:	00006717          	auipc	a4,0x6
80001014:	1d470713          	addi	a4,a4,468 # 800071e4 <ptable+0xac>
80001018:	9736                	add	a4,a4,a3
8000101a:	0007a023          	sw	zero,0(a5)
8000101e:	0791                	addi	a5,a5,4
80001020:	fee79de3          	bne	a5,a4,8000101a <allocproc+0x124>
80001024:	00006917          	auipc	s2,0x6
80001028:	11490913          	addi	s2,s2,276 # 80007138 <ptable>
8000102c:	00d909b3          	add	s3,s2,a3
80001030:	03468693          	addi	a3,a3,52
80001034:	03800613          	li	a2,56
80001038:	4581                	li	a1,0
8000103a:	00d90533          	add	a0,s2,a3
8000103e:	154030ef          	jal	80004192 <memset>
80001042:	00149793          	slli	a5,s1,0x1
80001046:	00978733          	add	a4,a5,s1
8000104a:	071a                	slli	a4,a4,0x6
8000104c:	974a                	add	a4,a4,s2
8000104e:	0a072623          	sw	zero,172(a4)
80001052:	0a070823          	sb	zero,176(a4)
80001056:	4942                	lw	s2,16(sp)
80001058:	4a22                	lw	s4,8(sp)
8000105a:	4a92                	lw	s5,4(sp)
8000105c:	a8bd                	j	800010da <allocproc+0x1e4>
8000105e:	00149793          	slli	a5,s1,0x1
80001062:	97a6                	add	a5,a5,s1
80001064:	079a                	slli	a5,a5,0x6
80001066:	00006717          	auipc	a4,0x6
8000106a:	0d270713          	addi	a4,a4,210 # 80007138 <ptable>
8000106e:	97ba                	add	a5,a5,a4
80001070:	0007a623          	sw	zero,12(a5)
80001074:	4981                	li	s3,0
80001076:	4942                	lw	s2,16(sp)
80001078:	a08d                	j	800010da <allocproc+0x1e4>
8000107a:	00006a97          	auipc	s5,0x6
8000107e:	0bea8a93          	addi	s5,s5,190 # 80007138 <ptable>
80001082:	00149913          	slli	s2,s1,0x1
80001086:	00990a33          	add	s4,s2,s1
8000108a:	0a1a                	slli	s4,s4,0x6
8000108c:	9a56                	add	s4,s4,s5
8000108e:	024a2503          	lw	a0,36(s4) # 80600024 <_stack_top+0x5e7024>
80001092:	c9eff0ef          	jal	80000530 <kfree>
80001096:	030a2503          	lw	a0,48(s4)
8000109a:	c96ff0ef          	jal	80000530 <kfree>
8000109e:	000a2623          	sw	zero,12(s4)
800010a2:	4942                	lw	s2,16(sp)
800010a4:	4a22                	lw	s4,8(sp)
800010a6:	4a92                	lw	s5,4(sp)
800010a8:	a80d                	j	800010da <allocproc+0x1e4>
800010aa:	00006a17          	auipc	s4,0x6
800010ae:	08ea0a13          	addi	s4,s4,142 # 80007138 <ptable>
800010b2:	00149913          	slli	s2,s1,0x1
800010b6:	009909b3          	add	s3,s2,s1
800010ba:	099a                	slli	s3,s3,0x6
800010bc:	99d2                	add	s3,s3,s4
800010be:	0249a503          	lw	a0,36(s3)
800010c2:	c6eff0ef          	jal	80000530 <kfree>
800010c6:	0309a503          	lw	a0,48(s3)
800010ca:	c66ff0ef          	jal	80000530 <kfree>
800010ce:	0009a623          	sw	zero,12(s3)
800010d2:	4981                	li	s3,0
800010d4:	4942                	lw	s2,16(sp)
800010d6:	4a22                	lw	s4,8(sp)
800010d8:	4a92                	lw	s5,4(sp)
800010da:	854e                	mv	a0,s3
800010dc:	40f2                	lw	ra,28(sp)
800010de:	4462                	lw	s0,24(sp)
800010e0:	44d2                	lw	s1,20(sp)
800010e2:	49b2                	lw	s3,12(sp)
800010e4:	6105                	addi	sp,sp,32
800010e6:	8082                	ret

800010e8 <uvmcopy>:
800010e8:	715d                	addi	sp,sp,-80
800010ea:	c686                	sw	ra,76(sp)
800010ec:	c4a2                	sw	s0,72(sp)
800010ee:	c2a6                	sw	s1,68(sp)
800010f0:	c0ca                	sw	s2,64(sp)
800010f2:	de4e                	sw	s3,60(sp)
800010f4:	dc52                	sw	s4,56(sp)
800010f6:	da56                	sw	s5,52(sp)
800010f8:	d85a                	sw	s6,48(sp)
800010fa:	d65e                	sw	s7,44(sp)
800010fc:	d462                	sw	s8,40(sp)
800010fe:	d266                	sw	s9,36(sp)
80001100:	d06a                	sw	s10,32(sp)
80001102:	ce6e                	sw	s11,28(sp)
80001104:	0880                	addi	s0,sp,80
80001106:	fab42e23          	sw	a1,-68(s0)
8000110a:	8daa                	mv	s11,a0
8000110c:	6705                	lui	a4,0x1
8000110e:	00e507b3          	add	a5,a0,a4
80001112:	faf42c23          	sw	a5,-72(s0)
80001116:	4d01                	li	s10,0
80001118:	4c45                	li	s8,17
8000111a:	6b05                	lui	s6,0x1
8000111c:	00400bb7          	lui	s7,0x400
80001120:	a09d                	j	80001186 <uvmcopy+0x9e>
80001122:	0991                	addi	s3,s3,4
80001124:	995a                	add	s2,s2,s6
80001126:	05790a63          	beq	s2,s7,8000117a <uvmcopy+0x92>
8000112a:	0009aa03          	lw	s4,0(s3)
8000112e:	011a7793          	andi	a5,s4,17
80001132:	ff8798e3          	bne	a5,s8,80001122 <uvmcopy+0x3a>
80001136:	01a96cb3          	or	s9,s2,s10
8000113a:	00aa5493          	srli	s1,s4,0xa
8000113e:	04b2                	slli	s1,s1,0xc
80001140:	3ffa7a13          	andi	s4,s4,1023
80001144:	f07fe0ef          	jal	8000004a <kalloc_impl>
80001148:	8aaa                	mv	s5,a0
8000114a:	c931                	beqz	a0,8000119e <uvmcopy+0xb6>
8000114c:	016506b3          	add	a3,a0,s6
80001150:	87aa                	mv	a5,a0
80001152:	8c89                	sub	s1,s1,a0
80001154:	00f48733          	add	a4,s1,a5
80001158:	4318                	lw	a4,0(a4)
8000115a:	c398                	sw	a4,0(a5)
8000115c:	0791                	addi	a5,a5,4
8000115e:	fed79be3          	bne	a5,a3,80001154 <uvmcopy+0x6c>
80001162:	86d2                	mv	a3,s4
80001164:	8656                	mv	a2,s5
80001166:	85e6                	mv	a1,s9
80001168:	fbc42503          	lw	a0,-68(s0)
8000116c:	3b09                	jal	80000e7e <sv32_map_page>
8000116e:	d955                	beqz	a0,80001122 <uvmcopy+0x3a>
80001170:	8556                	mv	a0,s5
80001172:	bbeff0ef          	jal	80000530 <kfree>
80001176:	557d                	li	a0,-1
80001178:	a025                	j	800011a0 <uvmcopy+0xb8>
8000117a:	0d91                	addi	s11,s11,4
8000117c:	9d5e                	add	s10,s10,s7
8000117e:	fb842783          	lw	a5,-72(s0)
80001182:	00fd8c63          	beq	s11,a5,8000119a <uvmcopy+0xb2>
80001186:	000da783          	lw	a5,0(s11)
8000118a:	0017f713          	andi	a4,a5,1
8000118e:	d775                	beqz	a4,8000117a <uvmcopy+0x92>
80001190:	83a9                	srli	a5,a5,0xa
80001192:	00c79993          	slli	s3,a5,0xc
80001196:	4901                	li	s2,0
80001198:	bf49                	j	8000112a <uvmcopy+0x42>
8000119a:	4501                	li	a0,0
8000119c:	a011                	j	800011a0 <uvmcopy+0xb8>
8000119e:	557d                	li	a0,-1
800011a0:	40b6                	lw	ra,76(sp)
800011a2:	4426                	lw	s0,72(sp)
800011a4:	4496                	lw	s1,68(sp)
800011a6:	4906                	lw	s2,64(sp)
800011a8:	59f2                	lw	s3,60(sp)
800011aa:	5a62                	lw	s4,56(sp)
800011ac:	5ad2                	lw	s5,52(sp)
800011ae:	5b42                	lw	s6,48(sp)
800011b0:	5bb2                	lw	s7,44(sp)
800011b2:	5c22                	lw	s8,40(sp)
800011b4:	5c92                	lw	s9,36(sp)
800011b6:	5d02                	lw	s10,32(sp)
800011b8:	4df2                	lw	s11,28(sp)
800011ba:	6161                	addi	sp,sp,80
800011bc:	8082                	ret

800011be <kfork>:
800011be:	1101                	addi	sp,sp,-32
800011c0:	ce06                	sw	ra,28(sp)
800011c2:	cc22                	sw	s0,24(sp)
800011c4:	1000                	addi	s0,sp,32
800011c6:	3b05                	jal	80000ef6 <allocproc>
800011c8:	10050963          	beqz	a0,800012da <kfork+0x11c>
800011cc:	c84a                	sw	s2,16(sp)
800011ce:	c256                	sw	s5,4(sp)
800011d0:	892a                	mv	s2,a0
800011d2:	a38ff0ef          	jal	8000040a <myproc>
800011d6:	8aaa                	mv	s5,a0
800011d8:	5510                	lw	a2,40(a0)
800011da:	02c92583          	lw	a1,44(s2)
800011de:	5548                	lw	a0,44(a0)
800011e0:	3721                	jal	800010e8 <uvmcopy>
800011e2:	06054563          	bltz	a0,8000124c <kfork+0x8e>
800011e6:	ca26                	sw	s1,20(sp)
800011e8:	c64e                	sw	s3,12(sp)
800011ea:	c452                	sw	s4,8(sp)
800011ec:	028aa783          	lw	a5,40(s5)
800011f0:	02f92423          	sw	a5,40(s2)
800011f4:	800004b7          	lui	s1,0x80000
800011f8:	6a05                	lui	s4,0x1
800011fa:	806009b7          	lui	s3,0x80600
800011fe:	46bd                	li	a3,15
80001200:	8626                	mv	a2,s1
80001202:	85a6                	mv	a1,s1
80001204:	02c92503          	lw	a0,44(s2)
80001208:	399d                	jal	80000e7e <sv32_map_page>
8000120a:	e931                	bnez	a0,8000125e <kfork+0xa0>
8000120c:	94d2                	add	s1,s1,s4
8000120e:	ff3498e3          	bne	s1,s3,800011fe <kfork+0x40>
80001212:	03092583          	lw	a1,48(s2)
80001216:	030aa783          	lw	a5,48(s5)
8000121a:	872e                	mv	a4,a1
8000121c:	6605                	lui	a2,0x1
8000121e:	963e                	add	a2,a2,a5
80001220:	4394                	lw	a3,0(a5)
80001222:	c314                	sw	a3,0(a4)
80001224:	0791                	addi	a5,a5,4
80001226:	0711                	addi	a4,a4,4 # 1004 <_entry-0x7fffeffc>
80001228:	fec79ce3          	bne	a5,a2,80001220 <kfork+0x62>
8000122c:	0205ac23          	sw	zero,56(a1) # 1038 <_entry-0x7fffefc8>
80001230:	03092703          	lw	a4,48(s2)
80001234:	02492783          	lw	a5,36(s2)
80001238:	6685                	lui	a3,0x1
8000123a:	97b6                	add	a5,a5,a3
8000123c:	c35c                	sw	a5,4(a4)
8000123e:	06ca8493          	addi	s1,s5,108
80001242:	06c90993          	addi	s3,s2,108
80001246:	0aca8a13          	addi	s4,s5,172
8000124a:	a83d                	j	80001288 <kfork+0xca>
8000124c:	854a                	mv	a0,s2
8000124e:	833ff0ef          	jal	80000a80 <freeproc>
80001252:	00092623          	sw	zero,12(s2)
80001256:	557d                	li	a0,-1
80001258:	4942                	lw	s2,16(sp)
8000125a:	4a92                	lw	s5,4(sp)
8000125c:	a821                	j	80001274 <kfork+0xb6>
8000125e:	854a                	mv	a0,s2
80001260:	821ff0ef          	jal	80000a80 <freeproc>
80001264:	00092623          	sw	zero,12(s2)
80001268:	557d                	li	a0,-1
8000126a:	44d2                	lw	s1,20(sp)
8000126c:	4942                	lw	s2,16(sp)
8000126e:	49b2                	lw	s3,12(sp)
80001270:	4a22                	lw	s4,8(sp)
80001272:	4a92                	lw	s5,4(sp)
80001274:	40f2                	lw	ra,28(sp)
80001276:	4462                	lw	s0,24(sp)
80001278:	6105                	addi	sp,sp,32
8000127a:	8082                	ret
8000127c:	00a9a023          	sw	a0,0(s3) # 80600000 <_stack_top+0x5e7000>
80001280:	0491                	addi	s1,s1,4 # 80000004 <_entry+0x4>
80001282:	0991                	addi	s3,s3,4
80001284:	01448763          	beq	s1,s4,80001292 <kfork+0xd4>
80001288:	4088                	lw	a0,0(s1)
8000128a:	d96d                	beqz	a0,8000127c <kfork+0xbe>
8000128c:	51e020ef          	jal	800037aa <filedup>
80001290:	b7f5                	j	8000127c <kfork+0xbe>
80001292:	0acaa783          	lw	a5,172(s5)
80001296:	0af92623          	sw	a5,172(s2)
8000129a:	4641                	li	a2,16
8000129c:	0b0a8593          	addi	a1,s5,176
800012a0:	0b090513          	addi	a0,s2,176
800012a4:	000030ef          	jal	800042a4 <safestrcpy>
800012a8:	03592023          	sw	s5,32(s2)
800012ac:	fffff797          	auipc	a5,0xfffff
800012b0:	19278793          	addi	a5,a5,402 # 8000043e <child_entry>
800012b4:	02f92a23          	sw	a5,52(s2)
800012b8:	02492783          	lw	a5,36(s2)
800012bc:	6705                	lui	a4,0x1
800012be:	97ba                	add	a5,a5,a4
800012c0:	02f92c23          	sw	a5,56(s2)
800012c4:	478d                	li	a5,3
800012c6:	00f92623          	sw	a5,12(s2)
800012ca:	01c92503          	lw	a0,28(s2)
800012ce:	44d2                	lw	s1,20(sp)
800012d0:	4942                	lw	s2,16(sp)
800012d2:	49b2                	lw	s3,12(sp)
800012d4:	4a22                	lw	s4,8(sp)
800012d6:	4a92                	lw	s5,4(sp)
800012d8:	bf71                	j	80001274 <kfork+0xb6>
800012da:	557d                	li	a0,-1
800012dc:	bf61                	j	80001274 <kfork+0xb6>

800012de <kexec>:
800012de:	7171                	addi	sp,sp,-176
800012e0:	d706                	sw	ra,172(sp)
800012e2:	d522                	sw	s0,168(sp)
800012e4:	d326                	sw	s1,164(sp)
800012e6:	1900                	addi	s0,sp,176
800012e8:	f4b42c23          	sw	a1,-168(s0)
800012ec:	410020ef          	jal	800036fc <namei>
800012f0:	44050c63          	beqz	a0,80001748 <kexec+0x46a>
800012f4:	cd52                	sw	s4,152(sp)
800012f6:	8a2a                	mv	s4,a0
800012f8:	479010ef          	jal	80002f70 <ilock>
800012fc:	028a1703          	lh	a4,40(s4) # 1028 <_entry-0x7fffefd8>
80001300:	4789                	li	a5,2
80001302:	08f71863          	bne	a4,a5,80001392 <kexec+0xb4>
80001306:	44f020ef          	jal	80003f54 <begin_op>
8000130a:	03400713          	li	a4,52
8000130e:	4681                	li	a3,0
80001310:	f8c40613          	addi	a2,s0,-116
80001314:	4581                	li	a1,0
80001316:	8552                	mv	a0,s4
80001318:	7c1010ef          	jal	800032d8 <readi>
8000131c:	84aa                	mv	s1,a0
8000131e:	49f020ef          	jal	80003fbc <end_op>
80001322:	03300793          	li	a5,51
80001326:	0697dc63          	bge	a5,s1,8000139e <kexec+0xc0>
8000132a:	f8c42703          	lw	a4,-116(s0)
8000132e:	464c47b7          	lui	a5,0x464c4
80001332:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
80001336:	06f71a63          	bne	a4,a5,800013aa <kexec+0xcc>
8000133a:	f9044703          	lbu	a4,-112(s0)
8000133e:	4785                	li	a5,1
80001340:	06f71563          	bne	a4,a5,800013aa <kexec+0xcc>
80001344:	d14a                	sw	s2,160(sp)
80001346:	cf4e                	sw	s3,156(sp)
80001348:	cb56                	sw	s5,148(sp)
8000134a:	c95a                	sw	s6,144(sp)
8000134c:	3ced                	jal	80000e46 <alloc_pgtbl>
8000134e:	892a                	mv	s2,a0
80001350:	800009b7          	lui	s3,0x80000
80001354:	6b05                	lui	s6,0x1
80001356:	80600ab7          	lui	s5,0x80600
8000135a:	cd31                	beqz	a0,800013b6 <kexec+0xd8>
8000135c:	46bd                	li	a3,15
8000135e:	864e                	mv	a2,s3
80001360:	85ce                	mv	a1,s3
80001362:	854a                	mv	a0,s2
80001364:	3e29                	jal	80000e7e <sv32_map_page>
80001366:	84aa                	mv	s1,a0
80001368:	e12d                	bnez	a0,800013ca <kexec+0xec>
8000136a:	99da                	add	s3,s3,s6
8000136c:	ff5998e3          	bne	s3,s5,8000135c <kexec+0x7e>
80001370:	fb845783          	lhu	a5,-72(s0)
80001374:	20078663          	beqz	a5,80001580 <kexec+0x2a2>
80001378:	c75e                	sw	s7,140(sp)
8000137a:	c562                	sw	s8,136(sp)
8000137c:	c366                	sw	s9,132(sp)
8000137e:	c16a                	sw	s10,128(sp)
80001380:	deee                	sw	s11,124(sp)
80001382:	f4042a23          	sw	zero,-172(s0)
80001386:	6d05                	lui	s10,0x1
80001388:	fffd0793          	addi	a5,s10,-1 # fff <_entry-0x7ffff001>
8000138c:	f4f42823          	sw	a5,-176(s0)
80001390:	a23d                	j	800014be <kexec+0x1e0>
80001392:	8552                	mv	a0,s4
80001394:	5d9010ef          	jal	8000316c <iunlockput>
80001398:	54fd                	li	s1,-1
8000139a:	4a6a                	lw	s4,152(sp)
8000139c:	a081                	j	800013dc <kexec+0xfe>
8000139e:	8552                	mv	a0,s4
800013a0:	5cd010ef          	jal	8000316c <iunlockput>
800013a4:	54fd                	li	s1,-1
800013a6:	4a6a                	lw	s4,152(sp)
800013a8:	a815                	j	800013dc <kexec+0xfe>
800013aa:	8552                	mv	a0,s4
800013ac:	5c1010ef          	jal	8000316c <iunlockput>
800013b0:	54fd                	li	s1,-1
800013b2:	4a6a                	lw	s4,152(sp)
800013b4:	a025                	j	800013dc <kexec+0xfe>
800013b6:	8552                	mv	a0,s4
800013b8:	5b5010ef          	jal	8000316c <iunlockput>
800013bc:	54fd                	li	s1,-1
800013be:	590a                	lw	s2,160(sp)
800013c0:	49fa                	lw	s3,156(sp)
800013c2:	4a6a                	lw	s4,152(sp)
800013c4:	4ada                	lw	s5,148(sp)
800013c6:	4b4a                	lw	s6,144(sp)
800013c8:	a811                	j	800013dc <kexec+0xfe>
800013ca:	8552                	mv	a0,s4
800013cc:	5a1010ef          	jal	8000316c <iunlockput>
800013d0:	54fd                	li	s1,-1
800013d2:	590a                	lw	s2,160(sp)
800013d4:	49fa                	lw	s3,156(sp)
800013d6:	4a6a                	lw	s4,152(sp)
800013d8:	4ada                	lw	s5,148(sp)
800013da:	4b4a                	lw	s6,144(sp)
800013dc:	8526                	mv	a0,s1
800013de:	50ba                	lw	ra,172(sp)
800013e0:	542a                	lw	s0,168(sp)
800013e2:	549a                	lw	s1,164(sp)
800013e4:	614d                	addi	sp,sp,176
800013e6:	8082                	ret
800013e8:	8552                	mv	a0,s4
800013ea:	583010ef          	jal	8000316c <iunlockput>
800013ee:	54fd                	li	s1,-1
800013f0:	590a                	lw	s2,160(sp)
800013f2:	49fa                	lw	s3,156(sp)
800013f4:	4a6a                	lw	s4,152(sp)
800013f6:	4ada                	lw	s5,148(sp)
800013f8:	4b4a                	lw	s6,144(sp)
800013fa:	4bba                	lw	s7,140(sp)
800013fc:	4c2a                	lw	s8,136(sp)
800013fe:	4c9a                	lw	s9,132(sp)
80001400:	4d0a                	lw	s10,128(sp)
80001402:	5df6                	lw	s11,124(sp)
80001404:	bfe1                	j	800013dc <kexec+0xfe>
80001406:	8b85                	andi	a5,a5,1
80001408:	078e                	slli	a5,a5,0x3
8000140a:	8edd                	or	a3,a3,a5
8000140c:	864e                	mv	a2,s3
8000140e:	85d6                	mv	a1,s5
80001410:	854a                	mv	a0,s2
80001412:	34b5                	jal	80000e7e <sv32_map_page>
80001414:	e159                	bnez	a0,8000149a <kexec+0x1bc>
80001416:	0c85                	addi	s9,s9,1
80001418:	09bcf563          	bgeu	s9,s11,800014a2 <kexec+0x1c4>
8000141c:	8ae2                	mv	s5,s8
8000141e:	c2dfe0ef          	jal	8000004a <kalloc_impl>
80001422:	89aa                	mv	s3,a0
80001424:	d171                	beqz	a0,800013e8 <kexec+0x10a>
80001426:	01a50733          	add	a4,a0,s10
8000142a:	87aa                	mv	a5,a0
8000142c:	00078023          	sb	zero,0(a5)
80001430:	0785                	addi	a5,a5,1
80001432:	fef71de3          	bne	a4,a5,8000142c <kexec+0x14e>
80001436:	01aa8c33          	add	s8,s5,s10
8000143a:	f7442b03          	lw	s6,-140(s0)
8000143e:	8bda                	mv	s7,s6
80001440:	015b7363          	bgeu	s6,s5,80001446 <kexec+0x168>
80001444:	8bd6                	mv	s7,s5
80001446:	f7c42783          	lw	a5,-132(s0)
8000144a:	97da                	add	a5,a5,s6
8000144c:	00fc7363          	bgeu	s8,a5,80001452 <kexec+0x174>
80001450:	87e2                	mv	a5,s8
80001452:	02fbf863          	bgeu	s7,a5,80001482 <kexec+0x1a4>
80001456:	417787b3          	sub	a5,a5,s7
8000145a:	f4f42e23          	sw	a5,-164(s0)
8000145e:	2f7020ef          	jal	80003f54 <begin_op>
80001462:	f7042683          	lw	a3,-144(s0)
80001466:	416686b3          	sub	a3,a3,s6
8000146a:	415b8633          	sub	a2,s7,s5
8000146e:	f5c42703          	lw	a4,-164(s0)
80001472:	96de                	add	a3,a3,s7
80001474:	964e                	add	a2,a2,s3
80001476:	4581                	li	a1,0
80001478:	8552                	mv	a0,s4
8000147a:	65f010ef          	jal	800032d8 <readi>
8000147e:	33f020ef          	jal	80003fbc <end_op>
80001482:	f8442783          	lw	a5,-124(s0)
80001486:	0017d693          	srli	a3,a5,0x1
8000148a:	8a89                	andi	a3,a3,2
8000148c:	06c5                	addi	a3,a3,17 # 1011 <_entry-0x7fffefef>
8000148e:	0027f713          	andi	a4,a5,2
80001492:	db35                	beqz	a4,80001406 <kexec+0x128>
80001494:	0046e693          	ori	a3,a3,4
80001498:	b7bd                	j	80001406 <kexec+0x128>
8000149a:	8552                	mv	a0,s4
8000149c:	4d1010ef          	jal	8000316c <iunlockput>
800014a0:	b7b9                	j	800013ee <kexec+0x110>
800014a2:	f5442783          	lw	a5,-172(s0)
800014a6:	0785                	addi	a5,a5,1
800014a8:	f4f42a23          	sw	a5,-172(s0)
800014ac:	0485                	addi	s1,s1,1
800014ae:	fb845783          	lhu	a5,-72(s0)
800014b2:	06f4d463          	bge	s1,a5,8000151a <kexec+0x23c>
800014b6:	02000793          	li	a5,32
800014ba:	06f48063          	beq	s1,a5,8000151a <kexec+0x23c>
800014be:	297020ef          	jal	80003f54 <begin_op>
800014c2:	00549793          	slli	a5,s1,0x5
800014c6:	02000713          	li	a4,32
800014ca:	fa842683          	lw	a3,-88(s0)
800014ce:	96be                	add	a3,a3,a5
800014d0:	f6c40613          	addi	a2,s0,-148
800014d4:	4581                	li	a1,0
800014d6:	8552                	mv	a0,s4
800014d8:	601010ef          	jal	800032d8 <readi>
800014dc:	89aa                	mv	s3,a0
800014de:	2df020ef          	jal	80003fbc <end_op>
800014e2:	47fd                	li	a5,31
800014e4:	0337db63          	bge	a5,s3,8000151a <kexec+0x23c>
800014e8:	f6c42783          	lw	a5,-148(s0)
800014ec:	4705                	li	a4,1
800014ee:	fae79fe3          	bne	a5,a4,800014ac <kexec+0x1ce>
800014f2:	f7442783          	lw	a5,-140(s0)
800014f6:	76fd                	lui	a3,0xfffff
800014f8:	00d7fab3          	and	s5,a5,a3
800014fc:	f8042703          	lw	a4,-128(s0)
80001500:	97ba                	add	a5,a5,a4
80001502:	f5042703          	lw	a4,-176(s0)
80001506:	97ba                	add	a5,a5,a4
80001508:	8ff5                	and	a5,a5,a3
8000150a:	415787b3          	sub	a5,a5,s5
8000150e:	00c7dd93          	srli	s11,a5,0xc
80001512:	f9a7e8e3          	bltu	a5,s10,800014a2 <kexec+0x1c4>
80001516:	4c81                	li	s9,0
80001518:	b719                	j	8000141e <kexec+0x140>
8000151a:	7ffe04b7          	lui	s1,0x7ffe0
8000151e:	6a85                	lui	s5,0x1
80001520:	80000b37          	lui	s6,0x80000
80001524:	f5442783          	lw	a5,-172(s0)
80001528:	c7b9                	beqz	a5,80001576 <kexec+0x298>
8000152a:	b21fe0ef          	jal	8000004a <kalloc_impl>
8000152e:	862a                	mv	a2,a0
80001530:	c135                	beqz	a0,80001594 <kexec+0x2b6>
80001532:	01550733          	add	a4,a0,s5
80001536:	87aa                	mv	a5,a0
80001538:	00078023          	sb	zero,0(a5)
8000153c:	0785                	addi	a5,a5,1
8000153e:	fef71de3          	bne	a4,a5,80001538 <kexec+0x25a>
80001542:	46dd                	li	a3,23
80001544:	85a6                	mv	a1,s1
80001546:	854a                	mv	a0,s2
80001548:	3a1d                	jal	80000e7e <sv32_map_page>
8000154a:	89aa                	mv	s3,a0
8000154c:	e13d                	bnez	a0,800015b2 <kexec+0x2d4>
8000154e:	94d6                	add	s1,s1,s5
80001550:	fd649de3          	bne	s1,s6,8000152a <kexec+0x24c>
80001554:	8552                	mv	a0,s4
80001556:	417010ef          	jal	8000316c <iunlockput>
8000155a:	eb1fe0ef          	jal	8000040a <myproc>
8000155e:	8aaa                	mv	s5,a0
80001560:	03252623          	sw	s2,44(a0)
80001564:	fb845783          	lhu	a5,-72(s0)
80001568:	12078f63          	beqz	a5,800016a6 <kexec+0x3c8>
8000156c:	8b4e                	mv	s6,s3
8000156e:	4481                	li	s1,0
80001570:	4c7d                	li	s8,31
80001572:	4b85                	li	s7,1
80001574:	a0bd                	j	800015e2 <kexec+0x304>
80001576:	4bba                	lw	s7,140(sp)
80001578:	4c2a                	lw	s8,136(sp)
8000157a:	4c9a                	lw	s9,132(sp)
8000157c:	4d0a                	lw	s10,128(sp)
8000157e:	5df6                	lw	s11,124(sp)
80001580:	8552                	mv	a0,s4
80001582:	3eb010ef          	jal	8000316c <iunlockput>
80001586:	54fd                	li	s1,-1
80001588:	590a                	lw	s2,160(sp)
8000158a:	49fa                	lw	s3,156(sp)
8000158c:	4a6a                	lw	s4,152(sp)
8000158e:	4ada                	lw	s5,148(sp)
80001590:	4b4a                	lw	s6,144(sp)
80001592:	b5a9                	j	800013dc <kexec+0xfe>
80001594:	8552                	mv	a0,s4
80001596:	3d7010ef          	jal	8000316c <iunlockput>
8000159a:	54fd                	li	s1,-1
8000159c:	590a                	lw	s2,160(sp)
8000159e:	49fa                	lw	s3,156(sp)
800015a0:	4a6a                	lw	s4,152(sp)
800015a2:	4ada                	lw	s5,148(sp)
800015a4:	4b4a                	lw	s6,144(sp)
800015a6:	4bba                	lw	s7,140(sp)
800015a8:	4c2a                	lw	s8,136(sp)
800015aa:	4c9a                	lw	s9,132(sp)
800015ac:	4d0a                	lw	s10,128(sp)
800015ae:	5df6                	lw	s11,124(sp)
800015b0:	b535                	j	800013dc <kexec+0xfe>
800015b2:	8552                	mv	a0,s4
800015b4:	3b9010ef          	jal	8000316c <iunlockput>
800015b8:	54fd                	li	s1,-1
800015ba:	590a                	lw	s2,160(sp)
800015bc:	49fa                	lw	s3,156(sp)
800015be:	4a6a                	lw	s4,152(sp)
800015c0:	4ada                	lw	s5,148(sp)
800015c2:	4b4a                	lw	s6,144(sp)
800015c4:	4bba                	lw	s7,140(sp)
800015c6:	4c2a                	lw	s8,136(sp)
800015c8:	4c9a                	lw	s9,132(sp)
800015ca:	4d0a                	lw	s10,128(sp)
800015cc:	5df6                	lw	s11,124(sp)
800015ce:	b539                	j	800013dc <kexec+0xfe>
800015d0:	0b05                	addi	s6,s6,1 # 80000001 <_entry+0x1>
800015d2:	fb845783          	lhu	a5,-72(s0)
800015d6:	04fb5763          	bge	s6,a5,80001624 <kexec+0x346>
800015da:	02000793          	li	a5,32
800015de:	04fb0363          	beq	s6,a5,80001624 <kexec+0x346>
800015e2:	173020ef          	jal	80003f54 <begin_op>
800015e6:	005b1793          	slli	a5,s6,0x5
800015ea:	02000713          	li	a4,32
800015ee:	fa842683          	lw	a3,-88(s0)
800015f2:	96be                	add	a3,a3,a5
800015f4:	f6c40613          	addi	a2,s0,-148
800015f8:	4581                	li	a1,0
800015fa:	8552                	mv	a0,s4
800015fc:	4dd010ef          	jal	800032d8 <readi>
80001600:	8caa                	mv	s9,a0
80001602:	1bb020ef          	jal	80003fbc <end_op>
80001606:	019c5f63          	bge	s8,s9,80001624 <kexec+0x346>
8000160a:	f6c42783          	lw	a5,-148(s0)
8000160e:	fd7791e3          	bne	a5,s7,800015d0 <kexec+0x2f2>
80001612:	f7442783          	lw	a5,-140(s0)
80001616:	f8042703          	lw	a4,-128(s0)
8000161a:	97ba                	add	a5,a5,a4
8000161c:	faf4fae3          	bgeu	s1,a5,800015d0 <kexec+0x2f2>
80001620:	84be                	mv	s1,a5
80001622:	b77d                	j	800015d0 <kexec+0x2f2>
80001624:	6785                	lui	a5,0x1
80001626:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
80001628:	97a6                	add	a5,a5,s1
8000162a:	777d                	lui	a4,0xfffff
8000162c:	8ff9                	and	a5,a5,a4
8000162e:	cbb5                	beqz	a5,800016a2 <kexec+0x3c4>
80001630:	02faa423          	sw	a5,40(s5) # 1028 <_entry-0x7fffefd8>
80001634:	00c95793          	srli	a5,s2,0xc
80001638:	80000737          	lui	a4,0x80000
8000163c:	8fd9                	or	a5,a5,a4
8000163e:	18079073          	csrw	satp,a5
80001642:	12000073          	.word	0x12000073
80001646:	f5842783          	lw	a5,-168(s0)
8000164a:	10078163          	beqz	a5,8000174c <kexec+0x46e>
8000164e:	4388                	lw	a0,0(a5)
80001650:	0e050e63          	beqz	a0,8000174c <kexec+0x46e>
80001654:	00478a13          	addi	s4,a5,4
80001658:	84ce                	mv	s1,s3
8000165a:	4901                	li	s2,0
8000165c:	477020ef          	jal	800042d2 <strlen>
80001660:	00150793          	addi	a5,a0,1
80001664:	993e                	add	s2,s2,a5
80001666:	8326                	mv	t1,s1
80001668:	0485                	addi	s1,s1,1 # 7ffe0001 <_entry-0x1ffff>
8000166a:	0a11                	addi	s4,s4,4
8000166c:	ffca2503          	lw	a0,-4(s4)
80001670:	f575                	bnez	a0,8000165c <kexec+0x37e>
80001672:	00230793          	addi	a5,t1,2
80001676:	078a                	slli	a5,a5,0x2
80001678:	00f90733          	add	a4,s2,a5
8000167c:	071d                	addi	a4,a4,7 # 80000007 <_entry+0x7>
8000167e:	9b71                	andi	a4,a4,-4
80001680:	80000637          	lui	a2,0x80000
80001684:	8e19                	sub	a2,a2,a4
80001686:	8826                	mv	a6,s1
80001688:	c204                	sw	s1,0(a2)
8000168a:	00460593          	addi	a1,a2,4 # 80000004 <_entry+0x4>
8000168e:	97ae                	add	a5,a5,a1
80001690:	04905763          	blez	s1,800016de <kexec+0x400>
80001694:	f5842703          	lw	a4,-168(s0)
80001698:	853a                	mv	a0,a4
8000169a:	4891                	li	a7,4
8000169c:	40e888b3          	sub	a7,a7,a4
800016a0:	a031                	j	800016ac <kexec+0x3ce>
800016a2:	6785                	lui	a5,0x1
800016a4:	b771                	j	80001630 <kexec+0x352>
800016a6:	6785                	lui	a5,0x1
800016a8:	b761                	j	80001630 <kexec+0x352>
800016aa:	89ba                	mv	s3,a4
800016ac:	00a60733          	add	a4,a2,a0
800016b0:	9746                	add	a4,a4,a7
800016b2:	c31c                	sw	a5,0(a4)
800016b4:	4114                	lw	a3,0(a0)
800016b6:	0006c703          	lbu	a4,0(a3) # fffff000 <_stack_top+0x7ffe6000>
800016ba:	c749                	beqz	a4,80001744 <kexec+0x466>
800016bc:	0685                	addi	a3,a3,1
800016be:	0785                	addi	a5,a5,1 # 1001 <_entry-0x7fffefff>
800016c0:	fee78fa3          	sb	a4,-1(a5)
800016c4:	0006c703          	lbu	a4,0(a3)
800016c8:	fb75                	bnez	a4,800016bc <kexec+0x3de>
800016ca:	873e                	mv	a4,a5
800016cc:	00170793          	addi	a5,a4,1
800016d0:	00070023          	sb	zero,0(a4)
800016d4:	00198713          	addi	a4,s3,1 # 80000001 <_entry+0x1>
800016d8:	0511                	addi	a0,a0,4
800016da:	fc69c8e3          	blt	s3,t1,800016aa <kexec+0x3cc>
800016de:	00281793          	slli	a5,a6,0x2
800016e2:	97ae                	add	a5,a5,a1
800016e4:	0007a023          	sw	zero,0(a5)
800016e8:	030aa783          	lw	a5,48(s5)
800016ec:	c395                	beqz	a5,80001710 <kexec+0x432>
800016ee:	fa442703          	lw	a4,-92(s0)
800016f2:	c7d8                	sw	a4,12(a5)
800016f4:	030aa783          	lw	a5,48(s5)
800016f8:	cf90                	sw	a2,24(a5)
800016fa:	030aa783          	lw	a5,48(s5)
800016fe:	0307ac23          	sw	a6,56(a5)
80001702:	030aa783          	lw	a5,48(s5)
80001706:	dfcc                	sw	a1,60(a5)
80001708:	030aa783          	lw	a5,48(s5)
8000170c:	577d                	li	a4,-1
8000170e:	cbd8                	sw	a4,20(a5)
80001710:	00006797          	auipc	a5,0x6
80001714:	8fc7a783          	lw	a5,-1796(a5) # 8000700c <saved_tf>
80001718:	d3cc                	sw	a1,36(a5)
8000171a:	4785                	li	a5,1
8000171c:	00006717          	auipc	a4,0x6
80001720:	8ef72623          	sw	a5,-1812(a4) # 80007008 <exec_pending>
80001724:	fa442783          	lw	a5,-92(s0)
80001728:	17f1                	addi	a5,a5,-4
8000172a:	14179073          	csrw	sepc,a5
8000172e:	590a                	lw	s2,160(sp)
80001730:	49fa                	lw	s3,156(sp)
80001732:	4a6a                	lw	s4,152(sp)
80001734:	4ada                	lw	s5,148(sp)
80001736:	4b4a                	lw	s6,144(sp)
80001738:	4bba                	lw	s7,140(sp)
8000173a:	4c2a                	lw	s8,136(sp)
8000173c:	4c9a                	lw	s9,132(sp)
8000173e:	4d0a                	lw	s10,128(sp)
80001740:	5df6                	lw	s11,124(sp)
80001742:	b969                	j	800013dc <kexec+0xfe>
80001744:	873e                	mv	a4,a5
80001746:	b759                	j	800016cc <kexec+0x3ee>
80001748:	54fd                	li	s1,-1
8000174a:	b949                	j	800013dc <kexec+0xfe>
8000174c:	80000637          	lui	a2,0x80000
80001750:	1661                	addi	a2,a2,-8 # 7ffffff8 <_entry-0x8>
80001752:	00062023          	sw	zero,0(a2)
80001756:	84ce                	mv	s1,s3
80001758:	800005b7          	lui	a1,0x80000
8000175c:	15f1                	addi	a1,a1,-4 # 7ffffffc <_entry-0x4>
8000175e:	4801                	li	a6,0
80001760:	bfbd                	j	800016de <kexec+0x400>

80001762 <growproc>:
80001762:	1101                	addi	sp,sp,-32
80001764:	ce06                	sw	ra,28(sp)
80001766:	cc22                	sw	s0,24(sp)
80001768:	c64e                	sw	s3,12(sp)
8000176a:	c452                	sw	s4,8(sp)
8000176c:	1000                	addi	s0,sp,32
8000176e:	89aa                	mv	s3,a0
80001770:	c9bfe0ef          	jal	8000040a <myproc>
80001774:	8a2a                	mv	s4,a0
80001776:	551c                	lw	a5,40(a0)
80001778:	09305463          	blez	s3,80001800 <growproc+0x9e>
8000177c:	6705                	lui	a4,0x1
8000177e:	177d                	addi	a4,a4,-1 # fff <_entry-0x7ffff001>
80001780:	99ba                	add	s3,s3,a4
80001782:	99be                	add	s3,s3,a5
80001784:	777d                	lui	a4,0xfffff
80001786:	00e9f9b3          	and	s3,s3,a4
8000178a:	80000737          	lui	a4,0x80000
8000178e:	01377463          	bgeu	a4,s3,80001796 <growproc+0x34>
80001792:	800009b7          	lui	s3,0x80000
80001796:	4501                	li	a0,0
80001798:	0737f763          	bgeu	a5,s3,80001806 <growproc+0xa4>
8000179c:	c84a                	sw	s2,16(sp)
8000179e:	6705                	lui	a4,0x1
800017a0:	177d                	addi	a4,a4,-1 # fff <_entry-0x7ffff001>
800017a2:	97ba                	add	a5,a5,a4
800017a4:	777d                	lui	a4,0xfffff
800017a6:	00e7f933          	and	s2,a5,a4
800017aa:	03397e63          	bgeu	s2,s3,800017e6 <growproc+0x84>
800017ae:	ca26                	sw	s1,20(sp)
800017b0:	c256                	sw	s5,4(sp)
800017b2:	6a85                	lui	s5,0x1
800017b4:	897fe0ef          	jal	8000004a <kalloc_impl>
800017b8:	84aa                	mv	s1,a0
800017ba:	c53d                	beqz	a0,80001828 <growproc+0xc6>
800017bc:	01550733          	add	a4,a0,s5
800017c0:	87aa                	mv	a5,a0
800017c2:	00078023          	sb	zero,0(a5)
800017c6:	0785                	addi	a5,a5,1
800017c8:	fee79de3          	bne	a5,a4,800017c2 <growproc+0x60>
800017cc:	46dd                	li	a3,23
800017ce:	8626                	mv	a2,s1
800017d0:	85ca                	mv	a1,s2
800017d2:	02ca2503          	lw	a0,44(s4)
800017d6:	ea8ff0ef          	jal	80000e7e <sv32_map_page>
800017da:	e919                	bnez	a0,800017f0 <growproc+0x8e>
800017dc:	9956                	add	s2,s2,s5
800017de:	fd396be3          	bltu	s2,s3,800017b4 <growproc+0x52>
800017e2:	44d2                	lw	s1,20(sp)
800017e4:	4a92                	lw	s5,4(sp)
800017e6:	033a2423          	sw	s3,40(s4)
800017ea:	4501                	li	a0,0
800017ec:	4942                	lw	s2,16(sp)
800017ee:	a821                	j	80001806 <growproc+0xa4>
800017f0:	8526                	mv	a0,s1
800017f2:	d3ffe0ef          	jal	80000530 <kfree>
800017f6:	557d                	li	a0,-1
800017f8:	44d2                	lw	s1,20(sp)
800017fa:	4942                	lw	s2,16(sp)
800017fc:	4a92                	lw	s5,4(sp)
800017fe:	a021                	j	80001806 <growproc+0xa4>
80001800:	4501                	li	a0,0
80001802:	0009c863          	bltz	s3,80001812 <growproc+0xb0>
80001806:	40f2                	lw	ra,28(sp)
80001808:	4462                	lw	s0,24(sp)
8000180a:	49b2                	lw	s3,12(sp)
8000180c:	4a22                	lw	s4,8(sp)
8000180e:	6105                	addi	sp,sp,32
80001810:	8082                	ret
80001812:	41300733          	neg	a4,s3
80001816:	4681                	li	a3,0
80001818:	00e7e463          	bltu	a5,a4,80001820 <growproc+0xbe>
8000181c:	00f986b3          	add	a3,s3,a5
80001820:	02da2423          	sw	a3,40(s4)
80001824:	4501                	li	a0,0
80001826:	b7c5                	j	80001806 <growproc+0xa4>
80001828:	557d                	li	a0,-1
8000182a:	44d2                	lw	s1,20(sp)
8000182c:	4942                	lw	s2,16(sp)
8000182e:	4a92                	lw	s5,4(sp)
80001830:	bfd9                	j	80001806 <growproc+0xa4>

80001832 <handle_non_syscall_trap>:
80001832:	1141                	addi	sp,sp,-16
80001834:	c606                	sw	ra,12(sp)
80001836:	c422                	sw	s0,8(sp)
80001838:	c226                	sw	s1,4(sp)
8000183a:	c04a                	sw	s2,0(sp)
8000183c:	0800                	addi	s0,sp,16
8000183e:	84aa                	mv	s1,a0
80001840:	892e                	mv	s2,a1
80001842:	bc9fe0ef          	jal	8000040a <myproc>
80001846:	56fd                	li	a3,-1
80001848:	c111                	beqz	a0,8000184c <handle_non_syscall_trap+0x1a>
8000184a:	4d54                	lw	a3,28(a0)
8000184c:	864a                	mv	a2,s2
8000184e:	85a6                	mv	a1,s1
80001850:	00005517          	auipc	a0,0x5
80001854:	81450513          	addi	a0,a0,-2028 # 80006064 <consoleinit+0xc5a>
80001858:	e2ffe0ef          	jal	80000686 <printf>
8000185c:	40b2                	lw	ra,12(sp)
8000185e:	4422                	lw	s0,8(sp)
80001860:	4492                	lw	s1,4(sp)
80001862:	4902                	lw	s2,0(sp)
80001864:	0141                	addi	sp,sp,16
80001866:	8082                	ret

80001868 <handle_syscall>:
80001868:	7179                	addi	sp,sp,-48
8000186a:	d606                	sw	ra,44(sp)
8000186c:	d422                	sw	s0,40(sp)
8000186e:	d226                	sw	s1,36(sp)
80001870:	d04a                	sw	s2,32(sp)
80001872:	ce4e                	sw	s3,28(sp)
80001874:	cc52                	sw	s4,24(sp)
80001876:	ca56                	sw	s5,20(sp)
80001878:	c85a                	sw	s6,16(sp)
8000187a:	c65e                	sw	s7,12(sp)
8000187c:	c462                	sw	s8,8(sp)
8000187e:	c266                	sw	s9,4(sp)
80001880:	1800                	addi	s0,sp,48
80001882:	892a                	mv	s2,a0
80001884:	89ae                	mv	s3,a1
80001886:	8ab2                	mv	s5,a2
80001888:	8a36                	mv	s4,a3
8000188a:	8b3a                	mv	s6,a4
8000188c:	8bbe                	mv	s7,a5
8000188e:	8cc2                	mv	s9,a6
80001890:	8c46                	mv	s8,a7
80001892:	00005797          	auipc	a5,0x5
80001896:	76a7ad23          	sw	a0,1914(a5) # 8000700c <saved_tf>
8000189a:	b71fe0ef          	jal	8000040a <myproc>
8000189e:	84aa                	mv	s1,a0
800018a0:	10050663          	beqz	a0,800019ac <handle_syscall+0x144>
800018a4:	555c                	lw	a5,44(a0)
800018a6:	16078063          	beqz	a5,80001a06 <handle_syscall+0x19e>
800018aa:	47b1                	li	a5,12
800018ac:	14f98463          	beq	s3,a5,800019f4 <handle_syscall+0x18c>
800018b0:	589c                	lw	a5,48(s1)
800018b2:	cfed                	beqz	a5,800019ac <handle_syscall+0x144>
800018b4:	0537aa23          	sw	s3,84(a5)
800018b8:	589c                	lw	a5,48(s1)
800018ba:	0357ac23          	sw	s5,56(a5)
800018be:	589c                	lw	a5,48(s1)
800018c0:	0347ae23          	sw	s4,60(a5)
800018c4:	589c                	lw	a5,48(s1)
800018c6:	0567a023          	sw	s6,64(a5)
800018ca:	589c                	lw	a5,48(s1)
800018cc:	0577a223          	sw	s7,68(a5)
800018d0:	589c                	lw	a5,48(s1)
800018d2:	0597a423          	sw	s9,72(a5)
800018d6:	589c                	lw	a5,48(s1)
800018d8:	0587a623          	sw	s8,76(a5)
800018dc:	589c                	lw	a5,48(s1)
800018de:	03892703          	lw	a4,56(s2)
800018e2:	cbb8                	sw	a4,80(a5)
800018e4:	589c                	lw	a5,48(s1)
800018e6:	00092703          	lw	a4,0(s2)
800018ea:	cbd8                	sw	a4,20(a5)
800018ec:	589c                	lw	a5,48(s1)
800018ee:	00492703          	lw	a4,4(s2)
800018f2:	cfd8                	sw	a4,28(a5)
800018f4:	589c                	lw	a5,48(s1)
800018f6:	00892703          	lw	a4,8(s2)
800018fa:	d398                	sw	a4,32(a5)
800018fc:	589c                	lw	a5,48(s1)
800018fe:	00c92703          	lw	a4,12(s2)
80001902:	d3d8                	sw	a4,36(a5)
80001904:	589c                	lw	a5,48(s1)
80001906:	01092703          	lw	a4,16(s2)
8000190a:	d798                	sw	a4,40(a5)
8000190c:	589c                	lw	a5,48(s1)
8000190e:	01492703          	lw	a4,20(s2)
80001912:	d7d8                	sw	a4,44(a5)
80001914:	589c                	lw	a5,48(s1)
80001916:	01892703          	lw	a4,24(s2)
8000191a:	db98                	sw	a4,48(a5)
8000191c:	589c                	lw	a5,48(s1)
8000191e:	01c92703          	lw	a4,28(s2)
80001922:	dbd8                	sw	a4,52(a5)
80001924:	589c                	lw	a5,48(s1)
80001926:	04092703          	lw	a4,64(s2)
8000192a:	cfb8                	sw	a4,88(a5)
8000192c:	589c                	lw	a5,48(s1)
8000192e:	04492703          	lw	a4,68(s2)
80001932:	cff8                	sw	a4,92(a5)
80001934:	589c                	lw	a5,48(s1)
80001936:	04892703          	lw	a4,72(s2)
8000193a:	d3b8                	sw	a4,96(a5)
8000193c:	589c                	lw	a5,48(s1)
8000193e:	04c92703          	lw	a4,76(s2)
80001942:	d3f8                	sw	a4,100(a5)
80001944:	589c                	lw	a5,48(s1)
80001946:	05092703          	lw	a4,80(s2)
8000194a:	d7b8                	sw	a4,104(a5)
8000194c:	589c                	lw	a5,48(s1)
8000194e:	05492703          	lw	a4,84(s2)
80001952:	d7f8                	sw	a4,108(a5)
80001954:	589c                	lw	a5,48(s1)
80001956:	05892703          	lw	a4,88(s2)
8000195a:	dbb8                	sw	a4,112(a5)
8000195c:	589c                	lw	a5,48(s1)
8000195e:	05c92703          	lw	a4,92(s2)
80001962:	dbf8                	sw	a4,116(a5)
80001964:	589c                	lw	a5,48(s1)
80001966:	06092703          	lw	a4,96(s2)
8000196a:	dfb8                	sw	a4,120(a5)
8000196c:	589c                	lw	a5,48(s1)
8000196e:	06492703          	lw	a4,100(s2)
80001972:	dff8                	sw	a4,124(a5)
80001974:	589c                	lw	a5,48(s1)
80001976:	06892703          	lw	a4,104(s2)
8000197a:	08e7a023          	sw	a4,128(a5)
8000197e:	589c                	lw	a5,48(s1)
80001980:	06c92703          	lw	a4,108(s2)
80001984:	08e7a223          	sw	a4,132(a5)
80001988:	589c                	lw	a5,48(s1)
8000198a:	07092703          	lw	a4,112(s2)
8000198e:	08e7a423          	sw	a4,136(a5)
80001992:	589c                	lw	a5,48(s1)
80001994:	07492703          	lw	a4,116(s2)
80001998:	08e7a623          	sw	a4,140(a5)
8000199c:	589c                	lw	a5,48(s1)
8000199e:	07892703          	lw	a4,120(s2)
800019a2:	cf98                	sw	a4,24(a5)
800019a4:	589c                	lw	a5,48(s1)
800019a6:	08092703          	lw	a4,128(s2)
800019aa:	c7d8                	sw	a4,12(a5)
800019ac:	67a030ef          	jal	80005026 <syscall>
800019b0:	589c                	lw	a5,48(s1)
800019b2:	cba1                	beqz	a5,80001a02 <handle_syscall+0x19a>
800019b4:	5f9c                	lw	a5,56(a5)
800019b6:	02f92023          	sw	a5,32(s2)
800019ba:	00005797          	auipc	a5,0x5
800019be:	64e7a783          	lw	a5,1614(a5) # 80007008 <exec_pending>
800019c2:	cb9d                	beqz	a5,800019f8 <handle_syscall+0x190>
800019c4:	589c                	lw	a5,48(s1)
800019c6:	47dc                	lw	a5,12(a5)
800019c8:	17f1                	addi	a5,a5,-4
800019ca:	08f92023          	sw	a5,128(s2)
800019ce:	00005797          	auipc	a5,0x5
800019d2:	6207ad23          	sw	zero,1594(a5) # 80007008 <exec_pending>
800019d6:	589c                	lw	a5,48(s1)
800019d8:	5f88                	lw	a0,56(a5)
800019da:	50b2                	lw	ra,44(sp)
800019dc:	5422                	lw	s0,40(sp)
800019de:	5492                	lw	s1,36(sp)
800019e0:	5902                	lw	s2,32(sp)
800019e2:	49f2                	lw	s3,28(sp)
800019e4:	4a62                	lw	s4,24(sp)
800019e6:	4ad2                	lw	s5,20(sp)
800019e8:	4b42                	lw	s6,16(sp)
800019ea:	4bb2                	lw	s7,12(sp)
800019ec:	4c22                	lw	s8,8(sp)
800019ee:	4c92                	lw	s9,4(sp)
800019f0:	6145                	addi	sp,sp,48
800019f2:	8082                	ret
800019f4:	4a05                	li	s4,1
800019f6:	bd6d                	j	800018b0 <handle_syscall+0x48>
800019f8:	589c                	lw	a5,48(s1)
800019fa:	47dc                	lw	a5,12(a5)
800019fc:	08f92023          	sw	a5,128(s2)
80001a00:	bfd9                	j	800019d6 <handle_syscall+0x16e>
80001a02:	557d                	li	a0,-1
80001a04:	bfd9                	j	800019da <handle_syscall+0x172>
80001a06:	47b1                	li	a5,12
80001a08:	eaf994e3          	bne	s3,a5,800018b0 <handle_syscall+0x48>
80001a0c:	4a05                	li	s4,1
80001a0e:	b54d                	j	800018b0 <handle_syscall+0x48>

80001a10 <print_dirent>:
80001a10:	bc010113          	addi	sp,sp,-1088
80001a14:	42112e23          	sw	ra,1084(sp)
80001a18:	42812c23          	sw	s0,1080(sp)
80001a1c:	41812c23          	sw	s8,1048(sp)
80001a20:	44010413          	addi	s0,sp,1088
80001a24:	8c2a                	mv	s8,a0
80001a26:	00004517          	auipc	a0,0x4
80001a2a:	65e50513          	addi	a0,a0,1630 # 80006084 <consoleinit+0xc7a>
80001a2e:	c59fe0ef          	jal	80000686 <printf>
80001a32:	030c2703          	lw	a4,48(s8)
80001a36:	10070163          	beqz	a4,80001b38 <print_dirent+0x128>
80001a3a:	42912a23          	sw	s1,1076(sp)
80001a3e:	43212823          	sw	s2,1072(sp)
80001a42:	43312623          	sw	s3,1068(sp)
80001a46:	43412423          	sw	s4,1064(sp)
80001a4a:	43512223          	sw	s5,1060(sp)
80001a4e:	43612023          	sw	s6,1056(sp)
80001a52:	41712e23          	sw	s7,1052(sp)
80001a56:	41912a23          	sw	s9,1044(sp)
80001a5a:	41a12823          	sw	s10,1040(sp)
80001a5e:	4b01                	li	s6,0
80001a60:	40000c93          	li	s9,1024
80001a64:	4d3d                	li	s10,15
80001a66:	49b9                	li	s3,14
80001a68:	00004b97          	auipc	s7,0x4
80001a6c:	634b8b93          	addi	s7,s7,1588 # 8000609c <consoleinit+0xc92>
80001a70:	a891                	j	80001ac4 <print_dirent+0xb4>
80001a72:	fd078793          	addi	a5,a5,-48
80001a76:	97a2                	add	a5,a5,s0
80001a78:	be078823          	sb	zero,-1040(a5)
80001a7c:	bc040613          	addi	a2,s0,-1088
80001a80:	855e                	mv	a0,s7
80001a82:	c05fe0ef          	jal	80000686 <printf>
80001a86:	0941                	addi	s2,s2,16
80001a88:	01048793          	addi	a5,s1,16
80001a8c:	04f9                	addi	s1,s1,30
80001a8e:	029a6663          	bltu	s4,s1,80001aba <print_dirent+0xaa>
80001a92:	84be                	mv	s1,a5
80001a94:	864a                	mv	a2,s2
80001a96:	00095583          	lhu	a1,0(s2)
80001a9a:	bc040713          	addi	a4,s0,-1088
80001a9e:	4781                	li	a5,0
80001aa0:	d1fd                	beqz	a1,80001a86 <print_dirent+0x76>
80001aa2:	00f606b3          	add	a3,a2,a5
80001aa6:	0026c683          	lbu	a3,2(a3)
80001aaa:	d6e1                	beqz	a3,80001a72 <print_dirent+0x62>
80001aac:	00d70023          	sb	a3,0(a4) # fffff000 <_stack_top+0x7ffe6000>
80001ab0:	0785                	addi	a5,a5,1
80001ab2:	0705                	addi	a4,a4,1
80001ab4:	ff3797e3          	bne	a5,s3,80001aa2 <print_dirent+0x92>
80001ab8:	bf6d                	j	80001a72 <print_dirent+0x62>
80001aba:	9b56                	add	s6,s6,s5
80001abc:	030c2703          	lw	a4,48(s8)
80001ac0:	02eb7763          	bgeu	s6,a4,80001aee <print_dirent+0xde>
80001ac4:	bd040913          	addi	s2,s0,-1072
80001ac8:	41670733          	sub	a4,a4,s6
80001acc:	00ecf363          	bgeu	s9,a4,80001ad2 <print_dirent+0xc2>
80001ad0:	8766                	mv	a4,s9
80001ad2:	86da                	mv	a3,s6
80001ad4:	864a                	mv	a2,s2
80001ad6:	4581                	li	a1,0
80001ad8:	8562                	mv	a0,s8
80001ada:	7fe010ef          	jal	800032d8 <readi>
80001ade:	8aaa                	mv	s5,a0
80001ae0:	02a05a63          	blez	a0,80001b14 <print_dirent+0x104>
80001ae4:	8a2a                	mv	s4,a0
80001ae6:	fcad7ae3          	bgeu	s10,a0,80001aba <print_dirent+0xaa>
80001aea:	4489                	li	s1,2
80001aec:	b765                	j	80001a94 <print_dirent+0x84>
80001aee:	43412483          	lw	s1,1076(sp)
80001af2:	43012903          	lw	s2,1072(sp)
80001af6:	42c12983          	lw	s3,1068(sp)
80001afa:	42812a03          	lw	s4,1064(sp)
80001afe:	42412a83          	lw	s5,1060(sp)
80001b02:	42012b03          	lw	s6,1056(sp)
80001b06:	41c12b83          	lw	s7,1052(sp)
80001b0a:	41412c83          	lw	s9,1044(sp)
80001b0e:	41012d03          	lw	s10,1040(sp)
80001b12:	a01d                	j	80001b38 <print_dirent+0x128>
80001b14:	43412483          	lw	s1,1076(sp)
80001b18:	43012903          	lw	s2,1072(sp)
80001b1c:	42c12983          	lw	s3,1068(sp)
80001b20:	42812a03          	lw	s4,1064(sp)
80001b24:	42412a83          	lw	s5,1060(sp)
80001b28:	42012b03          	lw	s6,1056(sp)
80001b2c:	41c12b83          	lw	s7,1052(sp)
80001b30:	41412c83          	lw	s9,1044(sp)
80001b34:	41012d03          	lw	s10,1040(sp)
80001b38:	43c12083          	lw	ra,1084(sp)
80001b3c:	43812403          	lw	s0,1080(sp)
80001b40:	41812c03          	lw	s8,1048(sp)
80001b44:	44010113          	addi	sp,sp,1088
80001b48:	8082                	ret

80001b4a <geos_main>:
80001b4a:	7151                	addi	sp,sp,-240
80001b4c:	d786                	sw	ra,236(sp)
80001b4e:	d5a2                	sw	s0,232(sp)
80001b50:	d3a6                	sw	s1,228(sp)
80001b52:	d1ca                	sw	s2,224(sp)
80001b54:	cfce                	sw	s3,220(sp)
80001b56:	cdd2                	sw	s4,216(sp)
80001b58:	cbd6                	sw	s5,212(sp)
80001b5a:	c9da                	sw	s6,208(sp)
80001b5c:	c7de                	sw	s7,204(sp)
80001b5e:	c5e2                	sw	s8,200(sp)
80001b60:	c3e6                	sw	s9,196(sp)
80001b62:	c1ea                	sw	s10,192(sp)
80001b64:	df6e                	sw	s11,188(sp)
80001b66:	1980                	addi	s0,sp,240
80001b68:	00004517          	auipc	a0,0x4
80001b6c:	54850513          	addi	a0,a0,1352 # 800060b0 <consoleinit+0xca6>
80001b70:	b17fe0ef          	jal	80000686 <printf>
80001b74:	00004517          	auipc	a0,0x4
80001b78:	54050513          	addi	a0,a0,1344 # 800060b4 <consoleinit+0xcaa>
80001b7c:	b0bfe0ef          	jal	80000686 <printf>
80001b80:	00004517          	auipc	a0,0x4
80001b84:	56050513          	addi	a0,a0,1376 # 800060e0 <consoleinit+0xcd6>
80001b88:	afffe0ef          	jal	80000686 <printf>
80001b8c:	00004517          	auipc	a0,0x4
80001b90:	52450513          	addi	a0,a0,1316 # 800060b0 <consoleinit+0xca6>
80001b94:	af3fe0ef          	jal	80000686 <printf>
80001b98:	393010ef          	jal	8000372a <fileinit>
80001b9c:	06f030ef          	jal	8000540a <consoleinit>
80001ba0:	b56ff0ef          	jal	80000ef6 <allocproc>
80001ba4:	cd11                	beqz	a0,80001bc0 <geos_main+0x76>
80001ba6:	84aa                	mv	s1,a0
80001ba8:	4641                	li	a2,16
80001baa:	00004597          	auipc	a1,0x4
80001bae:	56a58593          	addi	a1,a1,1386 # 80006114 <consoleinit+0xd0a>
80001bb2:	0b050513          	addi	a0,a0,176
80001bb6:	6ee020ef          	jal	800042a4 <safestrcpy>
80001bba:	8526                	mv	a0,s1
80001bbc:	89bfe0ef          	jal	80000456 <set_myproc>
80001bc0:	00004517          	auipc	a0,0x4
80001bc4:	55c50513          	addi	a0,a0,1372 # 8000611c <consoleinit+0xd12>
80001bc8:	abffe0ef          	jal	80000686 <printf>
80001bcc:	00004517          	auipc	a0,0x4
80001bd0:	57850513          	addi	a0,a0,1400 # 80006144 <consoleinit+0xd3a>
80001bd4:	ab3fe0ef          	jal	80000686 <printf>
80001bd8:	283000ef          	jal	8000265a <binit>
80001bdc:	00004517          	auipc	a0,0x4
80001be0:	58050513          	addi	a0,a0,1408 # 8000615c <consoleinit+0xd52>
80001be4:	aa3fe0ef          	jal	80000686 <printf>
80001be8:	00004517          	auipc	a0,0x4
80001bec:	59450513          	addi	a0,a0,1428 # 8000617c <consoleinit+0xd72>
80001bf0:	a97fe0ef          	jal	80000686 <printf>
80001bf4:	1be010ef          	jal	80002db2 <iinit>
80001bf8:	00004517          	auipc	a0,0x4
80001bfc:	59c50513          	addi	a0,a0,1436 # 80006194 <consoleinit+0xd8a>
80001c00:	a87fe0ef          	jal	80000686 <printf>
80001c04:	00004517          	auipc	a0,0x4
80001c08:	5b050513          	addi	a0,a0,1456 # 800061b4 <consoleinit+0xdaa>
80001c0c:	a7bfe0ef          	jal	80000686 <printf>
80001c10:	4505                	li	a0,1
80001c12:	62e010ef          	jal	80003240 <fsinit>
80001c16:	00004517          	auipc	a0,0x4
80001c1a:	5ba50513          	addi	a0,a0,1466 # 800061d0 <consoleinit+0xdc6>
80001c1e:	a69fe0ef          	jal	80000686 <printf>
80001c22:	00010797          	auipc	a5,0x10
80001c26:	76e78793          	addi	a5,a5,1902 # 80012390 <sb>
80001c2a:	47d8                	lw	a4,12(a5)
80001c2c:	4794                	lw	a3,8(a5)
80001c2e:	43d0                	lw	a2,4(a5)
80001c30:	438c                	lw	a1,0(a5)
80001c32:	00004517          	auipc	a0,0x4
80001c36:	5c650513          	addi	a0,a0,1478 # 800061f8 <consoleinit+0xdee>
80001c3a:	a4dfe0ef          	jal	80000686 <printf>
80001c3e:	00004517          	auipc	a0,0x4
80001c42:	5f650513          	addi	a0,a0,1526 # 80006234 <consoleinit+0xe2a>
80001c46:	2b7010ef          	jal	800036fc <namei>
80001c4a:	84aa                	mv	s1,a0
80001c4c:	c559                	beqz	a0,80001cda <geos_main+0x190>
80001c4e:	00004517          	auipc	a0,0x4
80001c52:	60e50513          	addi	a0,a0,1550 # 8000625c <consoleinit+0xe52>
80001c56:	a31fe0ef          	jal	80000686 <printf>
80001c5a:	8526                	mv	a0,s1
80001c5c:	314010ef          	jal	80002f70 <ilock>
80001c60:	5894                	lw	a3,48(s1)
80001c62:	02e49603          	lh	a2,46(s1)
80001c66:	02849583          	lh	a1,40(s1)
80001c6a:	00004517          	auipc	a0,0x4
80001c6e:	61250513          	addi	a0,a0,1554 # 8000627c <consoleinit+0xe72>
80001c72:	a15fe0ef          	jal	80000686 <printf>
80001c76:	02849583          	lh	a1,40(s1)
80001c7a:	4785                	li	a5,1
80001c7c:	06f59663          	bne	a1,a5,80001ce8 <geos_main+0x19e>
80001c80:	8526                	mv	a0,s1
80001c82:	3379                	jal	80001a10 <print_dirent>
80001c84:	8526                	mv	a0,s1
80001c86:	4e6010ef          	jal	8000316c <iunlockput>
80001c8a:	00004517          	auipc	a0,0x4
80001c8e:	65e50513          	addi	a0,a0,1630 # 800062e8 <consoleinit+0xede>
80001c92:	9f5fe0ef          	jal	80000686 <printf>
80001c96:	00005797          	auipc	a5,0x5
80001c9a:	0f678793          	addi	a5,a5,246 # 80006d8c <consoleinit+0x1982>
80001c9e:	0007a903          	lw	s2,0(a5)
80001ca2:	43d0                	lw	a2,4(a5)
80001ca4:	4794                	lw	a3,8(a5)
80001ca6:	47d8                	lw	a4,12(a5)
80001ca8:	4b9c                	lw	a5,16(a5)
80001caa:	f7242023          	sw	s2,-160(s0)
80001cae:	f6c42223          	sw	a2,-156(s0)
80001cb2:	f6d42423          	sw	a3,-152(s0)
80001cb6:	f6e42623          	sw	a4,-148(s0)
80001cba:	f6f42823          	sw	a5,-144(s0)
80001cbe:	10090b63          	beqz	s2,80001dd4 <geos_main+0x28a>
80001cc2:	f6440a13          	addi	s4,s0,-156
80001cc6:	00004c17          	auipc	s8,0x4
80001cca:	696c0c13          	addi	s8,s8,1686 # 8000635c <consoleinit+0xf52>
80001cce:	00004b97          	auipc	s7,0x4
80001cd2:	636b8b93          	addi	s7,s7,1590 # 80006304 <consoleinit+0xefa>
80001cd6:	4b09                	li	s6,2
80001cd8:	a88d                	j	80001d4a <geos_main+0x200>
80001cda:	00004517          	auipc	a0,0x4
80001cde:	55e50513          	addi	a0,a0,1374 # 80006238 <consoleinit+0xe2e>
80001ce2:	9a5fe0ef          	jal	80000686 <printf>
80001ce6:	a819                	j	80001cfc <geos_main+0x1b2>
80001ce8:	4605                	li	a2,1
80001cea:	00004517          	auipc	a0,0x4
80001cee:	5be50513          	addi	a0,a0,1470 # 800062a8 <consoleinit+0xe9e>
80001cf2:	995fe0ef          	jal	80000686 <printf>
80001cf6:	8526                	mv	a0,s1
80001cf8:	474010ef          	jal	8000316c <iunlockput>
80001cfc:	55fd                	li	a1,-1
80001cfe:	00005517          	auipc	a0,0x5
80001d02:	dd650513          	addi	a0,a0,-554 # 80006ad4 <consoleinit+0x16ca>
80001d06:	981fe0ef          	jal	80000686 <printf>
80001d0a:	b68fe0ef          	jal	80000072 <shutdown>
80001d0e:	856a                	mv	a0,s10
80001d10:	977fe0ef          	jal	80000686 <printf>
80001d14:	0009c583          	lbu	a1,0(s3) # 80000000 <_entry>
80001d18:	8566                	mv	a0,s9
80001d1a:	96dfe0ef          	jal	80000686 <printf>
80001d1e:	0905                	addi	s2,s2,1
80001d20:	0985                	addi	s3,s3,1
80001d22:	012a8663          	beq	s5,s2,80001d2e <geos_main+0x1e4>
80001d26:	00f97793          	andi	a5,s2,15
80001d2a:	f7ed                	bnez	a5,80001d14 <geos_main+0x1ca>
80001d2c:	b7cd                	j	80001d0e <geos_main+0x1c4>
80001d2e:	00004517          	auipc	a0,0x4
80001d32:	38250513          	addi	a0,a0,898 # 800060b0 <consoleinit+0xca6>
80001d36:	951fe0ef          	jal	80000686 <printf>
80001d3a:	8526                	mv	a0,s1
80001d3c:	430010ef          	jal	8000316c <iunlockput>
80001d40:	0a11                	addi	s4,s4,4
80001d42:	ffca2903          	lw	s2,-4(s4)
80001d46:	08090763          	beqz	s2,80001dd4 <geos_main+0x28a>
80001d4a:	854a                	mv	a0,s2
80001d4c:	1b1010ef          	jal	800036fc <namei>
80001d50:	84aa                	mv	s1,a0
80001d52:	cd25                	beqz	a0,80001dca <geos_main+0x280>
80001d54:	21c010ef          	jal	80002f70 <ilock>
80001d58:	02e49703          	lh	a4,46(s1)
80001d5c:	5894                	lw	a3,48(s1)
80001d5e:	02849603          	lh	a2,40(s1)
80001d62:	85ca                	mv	a1,s2
80001d64:	855e                	mv	a0,s7
80001d66:	921fe0ef          	jal	80000686 <printf>
80001d6a:	02849783          	lh	a5,40(s1)
80001d6e:	fd6796e3          	bne	a5,s6,80001d3a <geos_main+0x1f0>
80001d72:	1e2020ef          	jal	80003f54 <begin_op>
80001d76:	f8040993          	addi	s3,s0,-128
80001d7a:	04000713          	li	a4,64
80001d7e:	4681                	li	a3,0
80001d80:	864e                	mv	a2,s3
80001d82:	4581                	li	a1,0
80001d84:	8526                	mv	a0,s1
80001d86:	552010ef          	jal	800032d8 <readi>
80001d8a:	8aaa                	mv	s5,a0
80001d8c:	230020ef          	jal	80003fbc <end_op>
80001d90:	fb5055e3          	blez	s5,80001d3a <geos_main+0x1f0>
80001d94:	02000793          	li	a5,32
80001d98:	0157d463          	bge	a5,s5,80001da0 <geos_main+0x256>
80001d9c:	02000a93          	li	s5,32
80001da0:	8656                	mv	a2,s5
80001da2:	00004597          	auipc	a1,0x4
80001da6:	58e58593          	addi	a1,a1,1422 # 80006330 <consoleinit+0xf26>
80001daa:	00004517          	auipc	a0,0x4
80001dae:	59250513          	addi	a0,a0,1426 # 8000633c <consoleinit+0xf32>
80001db2:	8d5fe0ef          	jal	80000686 <printf>
80001db6:	4901                	li	s2,0
80001db8:	00004d17          	auipc	s10,0x4
80001dbc:	598d0d13          	addi	s10,s10,1432 # 80006350 <consoleinit+0xf46>
80001dc0:	00004c97          	auipc	s9,0x4
80001dc4:	598c8c93          	addi	s9,s9,1432 # 80006358 <consoleinit+0xf4e>
80001dc8:	bfb9                	j	80001d26 <geos_main+0x1dc>
80001dca:	85ca                	mv	a1,s2
80001dcc:	8562                	mv	a0,s8
80001dce:	8b9fe0ef          	jal	80000686 <printf>
80001dd2:	b7bd                	j	80001d40 <geos_main+0x1f6>
80001dd4:	00004517          	auipc	a0,0x4
80001dd8:	5ac50513          	addi	a0,a0,1452 # 80006380 <consoleinit+0xf76>
80001ddc:	8abfe0ef          	jal	80000686 <printf>
80001de0:	00004517          	auipc	a0,0x4
80001de4:	5cc50513          	addi	a0,a0,1484 # 800063ac <consoleinit+0xfa2>
80001de8:	89ffe0ef          	jal	80000686 <printf>
80001dec:	00004517          	auipc	a0,0x4
80001df0:	5d850513          	addi	a0,a0,1496 # 800063c4 <consoleinit+0xfba>
80001df4:	893fe0ef          	jal	80000686 <printf>
80001df8:	00004597          	auipc	a1,0x4
80001dfc:	5f858593          	addi	a1,a1,1528 # 800063f0 <consoleinit+0xfe6>
80001e00:	00004517          	auipc	a0,0x4
80001e04:	5f450513          	addi	a0,a0,1524 # 800063f4 <consoleinit+0xfea>
80001e08:	87ffe0ef          	jal	80000686 <printf>
80001e0c:	00004517          	auipc	a0,0x4
80001e10:	5e450513          	addi	a0,a0,1508 # 800063f0 <consoleinit+0xfe6>
80001e14:	0e9010ef          	jal	800036fc <namei>
80001e18:	84aa                	mv	s1,a0
80001e1a:	cd0d                	beqz	a0,80001e54 <geos_main+0x30a>
80001e1c:	154010ef          	jal	80002f70 <ilock>
80001e20:	02849603          	lh	a2,40(s1)
80001e24:	4789                	li	a5,2
80001e26:	04f60263          	beq	a2,a5,80001e6a <geos_main+0x320>
80001e2a:	00004597          	auipc	a1,0x4
80001e2e:	5c658593          	addi	a1,a1,1478 # 800063f0 <consoleinit+0xfe6>
80001e32:	00004517          	auipc	a0,0x4
80001e36:	60250513          	addi	a0,a0,1538 # 80006434 <consoleinit+0x102a>
80001e3a:	84dfe0ef          	jal	80000686 <printf>
80001e3e:	8526                	mv	a0,s1
80001e40:	32c010ef          	jal	8000316c <iunlockput>
80001e44:	00005517          	auipc	a0,0x5
80001e48:	c6c50513          	addi	a0,a0,-916 # 80006ab0 <consoleinit+0x16a6>
80001e4c:	83bfe0ef          	jal	80000686 <printf>
80001e50:	a22fe0ef          	jal	80000072 <shutdown>
80001e54:	00004597          	auipc	a1,0x4
80001e58:	59c58593          	addi	a1,a1,1436 # 800063f0 <consoleinit+0xfe6>
80001e5c:	00004517          	auipc	a0,0x4
80001e60:	5b450513          	addi	a0,a0,1460 # 80006410 <consoleinit+0x1006>
80001e64:	823fe0ef          	jal	80000686 <printf>
80001e68:	bff1                	j	80001e44 <geos_main+0x2fa>
80001e6a:	0ea020ef          	jal	80003f54 <begin_op>
80001e6e:	03400713          	li	a4,52
80001e72:	4681                	li	a3,0
80001e74:	f8040613          	addi	a2,s0,-128
80001e78:	4581                	li	a1,0
80001e7a:	8526                	mv	a0,s1
80001e7c:	45c010ef          	jal	800032d8 <readi>
80001e80:	892a                	mv	s2,a0
80001e82:	13a020ef          	jal	80003fbc <end_op>
80001e86:	03300793          	li	a5,51
80001e8a:	0327d963          	bge	a5,s2,80001ebc <geos_main+0x372>
80001e8e:	f8042583          	lw	a1,-128(s0)
80001e92:	464c47b7          	lui	a5,0x464c4
80001e96:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
80001e9a:	02f59b63          	bne	a1,a5,80001ed0 <geos_main+0x386>
80001e9e:	f8444703          	lbu	a4,-124(s0)
80001ea2:	4785                	li	a5,1
80001ea4:	04f70063          	beq	a4,a5,80001ee4 <geos_main+0x39a>
80001ea8:	00004517          	auipc	a0,0x4
80001eac:	60450513          	addi	a0,a0,1540 # 800064ac <consoleinit+0x10a2>
80001eb0:	fd6fe0ef          	jal	80000686 <printf>
80001eb4:	8526                	mv	a0,s1
80001eb6:	2b6010ef          	jal	8000316c <iunlockput>
80001eba:	b769                	j	80001e44 <geos_main+0x2fa>
80001ebc:	00004517          	auipc	a0,0x4
80001ec0:	5a850513          	addi	a0,a0,1448 # 80006464 <consoleinit+0x105a>
80001ec4:	fc2fe0ef          	jal	80000686 <printf>
80001ec8:	8526                	mv	a0,s1
80001eca:	2a2010ef          	jal	8000316c <iunlockput>
80001ece:	bf9d                	j	80001e44 <geos_main+0x2fa>
80001ed0:	00004517          	auipc	a0,0x4
80001ed4:	5b850513          	addi	a0,a0,1464 # 80006488 <consoleinit+0x107e>
80001ed8:	faefe0ef          	jal	80000686 <printf>
80001edc:	8526                	mv	a0,s1
80001ede:	28e010ef          	jal	8000316c <iunlockput>
80001ee2:	b78d                	j	80001e44 <geos_main+0x2fa>
80001ee4:	f9842683          	lw	a3,-104(s0)
80001ee8:	f9245603          	lhu	a2,-110(s0)
80001eec:	f9045583          	lhu	a1,-112(s0)
80001ef0:	00004517          	auipc	a0,0x4
80001ef4:	5d850513          	addi	a0,a0,1496 # 800064c8 <consoleinit+0x10be>
80001ef8:	f8efe0ef          	jal	80000686 <printf>
80001efc:	faa45683          	lhu	a3,-86(s0)
80001f00:	f9c42603          	lw	a2,-100(s0)
80001f04:	fac45583          	lhu	a1,-84(s0)
80001f08:	00004517          	auipc	a0,0x4
80001f0c:	5e850513          	addi	a0,a0,1512 # 800064f0 <consoleinit+0x10e6>
80001f10:	f76fe0ef          	jal	80000686 <printf>
80001f14:	f33fe0ef          	jal	80000e46 <alloc_pgtbl>
80001f18:	89aa                	mv	s3,a0
80001f1a:	c505                	beqz	a0,80001f42 <geos_main+0x3f8>
80001f1c:	00004517          	auipc	a0,0x4
80001f20:	63450513          	addi	a0,a0,1588 # 80006550 <consoleinit+0x1146>
80001f24:	f62fe0ef          	jal	80000686 <printf>
80001f28:	80000a37          	lui	s4,0x80000
80001f2c:	00100ab7          	lui	s5,0x100
80001f30:	1afd                	addi	s5,s5,-1 # fffff <_entry-0x7ff00001>
80001f32:	00004c17          	auipc	s8,0x4
80001f36:	632c0c13          	addi	s8,s8,1586 # 80006564 <consoleinit+0x115a>
80001f3a:	6b85                	lui	s7,0x1
80001f3c:	80600b37          	lui	s6,0x80600
80001f40:	a815                	j	80001f74 <geos_main+0x42a>
80001f42:	00004517          	auipc	a0,0x4
80001f46:	5e250513          	addi	a0,a0,1506 # 80006524 <consoleinit+0x111a>
80001f4a:	f3cfe0ef          	jal	80000686 <printf>
80001f4e:	8526                	mv	a0,s1
80001f50:	21c010ef          	jal	8000316c <iunlockput>
80001f54:	bdc5                	j	80001e44 <geos_main+0x2fa>
80001f56:	85d2                	mv	a1,s4
80001f58:	8562                	mv	a0,s8
80001f5a:	f2cfe0ef          	jal	80000686 <printf>
80001f5e:	46bd                	li	a3,15
80001f60:	8652                	mv	a2,s4
80001f62:	85d2                	mv	a1,s4
80001f64:	854e                	mv	a0,s3
80001f66:	f19fe0ef          	jal	80000e7e <sv32_map_page>
80001f6a:	892a                	mv	s2,a0
80001f6c:	e901                	bnez	a0,80001f7c <geos_main+0x432>
80001f6e:	9a5e                	add	s4,s4,s7
80001f70:	036a0163          	beq	s4,s6,80001f92 <geos_main+0x448>
80001f74:	015a77b3          	and	a5,s4,s5
80001f78:	f3fd                	bnez	a5,80001f5e <geos_main+0x414>
80001f7a:	bff1                	j	80001f56 <geos_main+0x40c>
80001f7c:	85d2                	mv	a1,s4
80001f7e:	00004517          	auipc	a0,0x4
80001f82:	5fe50513          	addi	a0,a0,1534 # 8000657c <consoleinit+0x1172>
80001f86:	f00fe0ef          	jal	80000686 <printf>
80001f8a:	8526                	mv	a0,s1
80001f8c:	1e0010ef          	jal	8000316c <iunlockput>
80001f90:	bd55                	j	80001e44 <geos_main+0x2fa>
80001f92:	8daa                	mv	s11,a0
80001f94:	f4042023          	sw	zero,-192(s0)
80001f98:	f2042a23          	sw	zero,-204(s0)
80001f9c:	f4042223          	sw	zero,-188(s0)
80001fa0:	6d05                	lui	s10,0x1
80001fa2:	fffd0793          	addi	a5,s10,-1 # fff <_entry-0x7ffff001>
80001fa6:	f2f42823          	sw	a5,-208(s0)
80001faa:	002d37b7          	lui	a5,0x2d3
80001fae:	d2d78793          	addi	a5,a5,-723 # 2d2d2d <_entry-0x7fd2d2d3>
80001fb2:	f2f42623          	sw	a5,-212(s0)
80001fb6:	a479                	j	80002244 <geos_main+0x6fa>
80001fb8:	85ee                	mv	a1,s11
80001fba:	00004517          	auipc	a0,0x4
80001fbe:	5e650513          	addi	a0,a0,1510 # 800065a0 <consoleinit+0x1196>
80001fc2:	ec4fe0ef          	jal	80000686 <printf>
80001fc6:	f4442783          	lw	a5,-188(s0)
80001fca:	34078163          	beqz	a5,8000230c <geos_main+0x7c2>
80001fce:	0009a783          	lw	a5,0(s3)
80001fd2:	0017f713          	andi	a4,a5,1
80001fd6:	cb01                	beqz	a4,80001fe6 <geos_main+0x49c>
80001fd8:	83a9                	srli	a5,a5,0xa
80001fda:	07b2                	slli	a5,a5,0xc
80001fdc:	43dc                	lw	a5,4(a5)
80001fde:	0017f713          	andi	a4,a5,1
80001fe2:	32071f63          	bnez	a4,80002320 <geos_main+0x7d6>
80001fe6:	80000637          	lui	a2,0x80000
80001fea:	7fff05b7          	lui	a1,0x7fff0
80001fee:	00004517          	auipc	a0,0x4
80001ff2:	75250513          	addi	a0,a0,1874 # 80006740 <consoleinit+0x1336>
80001ff6:	e90fe0ef          	jal	80000686 <printf>
80001ffa:	7fff0c37          	lui	s8,0x7fff0
80001ffe:	00004b97          	auipc	s7,0x4
80002002:	766b8b93          	addi	s7,s7,1894 # 80006764 <consoleinit+0x135a>
80002006:	6b05                	lui	s6,0x1
80002008:	4ac1                	li	s5,16
8000200a:	00c91a13          	slli	s4,s2,0xc
8000200e:	9a62                	add	s4,s4,s8
80002010:	85ca                	mv	a1,s2
80002012:	8652                	mv	a2,s4
80002014:	0905                	addi	s2,s2,1
80002016:	855e                	mv	a0,s7
80002018:	e6efe0ef          	jal	80000686 <printf>
8000201c:	d02fe0ef          	jal	8000051e <kalloc>
80002020:	862a                	mv	a2,a0
80002022:	36050e63          	beqz	a0,8000239e <geos_main+0x854>
80002026:	01650733          	add	a4,a0,s6
8000202a:	87aa                	mv	a5,a0
8000202c:	00078023          	sb	zero,0(a5)
80002030:	0785                	addi	a5,a5,1
80002032:	fee79de3          	bne	a5,a4,8000202c <geos_main+0x4e2>
80002036:	46dd                	li	a3,23
80002038:	85d2                	mv	a1,s4
8000203a:	854e                	mv	a0,s3
8000203c:	e43fe0ef          	jal	80000e7e <sv32_map_page>
80002040:	8caa                	mv	s9,a0
80002042:	36051963          	bnez	a0,800023b4 <geos_main+0x86a>
80002046:	fd5912e3          	bne	s2,s5,8000200a <geos_main+0x4c0>
8000204a:	00004517          	auipc	a0,0x4
8000204e:	78250513          	addi	a0,a0,1922 # 800067cc <consoleinit+0x13c2>
80002052:	e34fe0ef          	jal	80000686 <printf>
80002056:	85ce                	mv	a1,s3
80002058:	00004517          	auipc	a0,0x4
8000205c:	79850513          	addi	a0,a0,1944 # 800067f0 <consoleinit+0x13e6>
80002060:	e26fe0ef          	jal	80000686 <printf>
80002064:	4741                	li	a4,16
80002066:	800006b7          	lui	a3,0x80000
8000206a:	7fff0637          	lui	a2,0x7fff0
8000206e:	6589                	lui	a1,0x2
80002070:	00004517          	auipc	a0,0x4
80002074:	7b850513          	addi	a0,a0,1976 # 80006828 <consoleinit+0x141e>
80002078:	e0efe0ef          	jal	80000686 <printf>
8000207c:	f9842583          	lw	a1,-104(s0)
80002080:	00004517          	auipc	a0,0x4
80002084:	7e050513          	addi	a0,a0,2016 # 80006860 <consoleinit+0x1456>
80002088:	dfefe0ef          	jal	80000686 <printf>
8000208c:	797d                	lui	s2,0xfffff
8000208e:	f9842783          	lw	a5,-104(s0)
80002092:	00f97933          	and	s2,s2,a5
80002096:	85ca                	mv	a1,s2
80002098:	00005517          	auipc	a0,0x5
8000209c:	80450513          	addi	a0,a0,-2044 # 8000689c <consoleinit+0x1492>
800020a0:	de6fe0ef          	jal	80000686 <printf>
800020a4:	01695593          	srli	a1,s2,0x16
800020a8:	00259793          	slli	a5,a1,0x2
800020ac:	97ce                	add	a5,a5,s3
800020ae:	0007aa03          	lw	s4,0(a5)
800020b2:	8652                	mv	a2,s4
800020b4:	00005517          	auipc	a0,0x5
800020b8:	81450513          	addi	a0,a0,-2028 # 800068c8 <consoleinit+0x14be>
800020bc:	dcafe0ef          	jal	80000686 <printf>
800020c0:	001a7793          	andi	a5,s4,1
800020c4:	30078a63          	beqz	a5,800023d8 <geos_main+0x88e>
800020c8:	00c95593          	srli	a1,s2,0xc
800020cc:	3ff5f593          	andi	a1,a1,1023
800020d0:	00aa5793          	srli	a5,s4,0xa
800020d4:	07b2                	slli	a5,a5,0xc
800020d6:	00259713          	slli	a4,a1,0x2
800020da:	97ba                	add	a5,a5,a4
800020dc:	0007a903          	lw	s2,0(a5)
800020e0:	864a                	mv	a2,s2
800020e2:	00004517          	auipc	a0,0x4
800020e6:	7fa50513          	addi	a0,a0,2042 # 800068dc <consoleinit+0x14d2>
800020ea:	d9cfe0ef          	jal	80000686 <printf>
800020ee:	00197793          	andi	a5,s2,1
800020f2:	2c078c63          	beqz	a5,800023ca <geos_main+0x880>
800020f6:	00a95593          	srli	a1,s2,0xa
800020fa:	0ff97613          	zext.b	a2,s2
800020fe:	05b2                	slli	a1,a1,0xc
80002100:	00004517          	auipc	a0,0x4
80002104:	7f050513          	addi	a0,a0,2032 # 800068f0 <consoleinit+0x14e6>
80002108:	d7efe0ef          	jal	80000686 <printf>
8000210c:	ace1                	j	800023e4 <geos_main+0x89a>
8000210e:	85d6                	mv	a1,s5
80002110:	00004517          	auipc	a0,0x4
80002114:	4f850513          	addi	a0,a0,1272 # 80006608 <consoleinit+0x11fe>
80002118:	d6efe0ef          	jal	80000686 <printf>
8000211c:	8526                	mv	a0,s1
8000211e:	04e010ef          	jal	8000316c <iunlockput>
80002122:	b30d                	j	80001e44 <geos_main+0x2fa>
80002124:	f7842783          	lw	a5,-136(s0)
80002128:	0047f693          	andi	a3,a5,4
8000212c:	474d                	li	a4,19
8000212e:	e291                	bnez	a3,80002132 <geos_main+0x5e8>
80002130:	4745                	li	a4,17
80002132:	0027f693          	andi	a3,a5,2
80002136:	c299                	beqz	a3,8000213c <geos_main+0x5f2>
80002138:	00476713          	ori	a4,a4,4
8000213c:	0017fb13          	andi	s6,a5,1
80002140:	0b0e                	slli	s6,s6,0x3
80002142:	00eb6b33          	or	s6,s6,a4
80002146:	86da                	mv	a3,s6
80002148:	8652                	mv	a2,s4
8000214a:	85d6                	mv	a1,s5
8000214c:	00004517          	auipc	a0,0x4
80002150:	52050513          	addi	a0,a0,1312 # 8000666c <consoleinit+0x1262>
80002154:	d32fe0ef          	jal	80000686 <printf>
80002158:	86da                	mv	a3,s6
8000215a:	8652                	mv	a2,s4
8000215c:	85d6                	mv	a1,s5
8000215e:	854e                	mv	a0,s3
80002160:	d1ffe0ef          	jal	80000e7e <sv32_map_page>
80002164:	e94d                	bnez	a0,80002216 <geos_main+0x6cc>
80002166:	f4442783          	lw	a5,-188(s0)
8000216a:	0187e7b3          	or	a5,a5,s8
8000216e:	c3e1                	beqz	a5,8000222e <geos_main+0x6e4>
80002170:	f4042783          	lw	a5,-192(s0)
80002174:	f4f42623          	sw	a5,-180(s0)
80002178:	0c05                	addi	s8,s8,1 # 7fff0001 <_entry-0xffff>
8000217a:	8ae6                	mv	s5,s9
8000217c:	f4c42783          	lw	a5,-180(s0)
80002180:	f4f42023          	sw	a5,-192(s0)
80002184:	f3c42783          	lw	a5,-196(s0)
80002188:	0b878863          	beq	a5,s8,80002238 <geos_main+0x6ee>
8000218c:	b92fe0ef          	jal	8000051e <kalloc>
80002190:	8a2a                	mv	s4,a0
80002192:	dd35                	beqz	a0,8000210e <geos_main+0x5c4>
80002194:	f4a42623          	sw	a0,-180(s0)
80002198:	01a50733          	add	a4,a0,s10
8000219c:	87aa                	mv	a5,a0
8000219e:	00078023          	sb	zero,0(a5)
800021a2:	0785                	addi	a5,a5,1
800021a4:	fee79de3          	bne	a5,a4,8000219e <geos_main+0x654>
800021a8:	01aa8cb3          	add	s9,s5,s10
800021ac:	f6842b03          	lw	s6,-152(s0)
800021b0:	8bda                	mv	s7,s6
800021b2:	015b7363          	bgeu	s6,s5,800021b8 <geos_main+0x66e>
800021b6:	8bd6                	mv	s7,s5
800021b8:	f7042783          	lw	a5,-144(s0)
800021bc:	97da                	add	a5,a5,s6
800021be:	00fcf363          	bgeu	s9,a5,800021c4 <geos_main+0x67a>
800021c2:	87e6                	mv	a5,s9
800021c4:	f6fbf0e3          	bgeu	s7,a5,80002124 <geos_main+0x5da>
800021c8:	417787b3          	sub	a5,a5,s7
800021cc:	f4f42423          	sw	a5,-184(s0)
800021d0:	585010ef          	jal	80003f54 <begin_op>
800021d4:	f6442683          	lw	a3,-156(s0)
800021d8:	416686b3          	sub	a3,a3,s6
800021dc:	415b8633          	sub	a2,s7,s5
800021e0:	f4842703          	lw	a4,-184(s0)
800021e4:	96de                	add	a3,a3,s7
800021e6:	9652                	add	a2,a2,s4
800021e8:	4581                	li	a1,0
800021ea:	8526                	mv	a0,s1
800021ec:	0ec010ef          	jal	800032d8 <readi>
800021f0:	8b2a                	mv	s6,a0
800021f2:	5cb010ef          	jal	80003fbc <end_op>
800021f6:	f4842783          	lw	a5,-184(s0)
800021fa:	f2fb55e3          	bge	s6,a5,80002124 <geos_main+0x5da>
800021fe:	873e                	mv	a4,a5
80002200:	86da                	mv	a3,s6
80002202:	8656                	mv	a2,s5
80002204:	f4442583          	lw	a1,-188(s0)
80002208:	00004517          	auipc	a0,0x4
8000220c:	42c50513          	addi	a0,a0,1068 # 80006634 <consoleinit+0x122a>
80002210:	c76fe0ef          	jal	80000686 <printf>
80002214:	bf01                	j	80002124 <geos_main+0x5da>
80002216:	8652                	mv	a2,s4
80002218:	85d6                	mv	a1,s5
8000221a:	00004517          	auipc	a0,0x4
8000221e:	47a50513          	addi	a0,a0,1146 # 80006694 <consoleinit+0x128a>
80002222:	c64fe0ef          	jal	80000686 <printf>
80002226:	8526                	mv	a0,s1
80002228:	745000ef          	jal	8000316c <iunlockput>
8000222c:	b921                	j	80001e44 <geos_main+0x2fa>
8000222e:	f3842783          	lw	a5,-200(s0)
80002232:	f2f42a23          	sw	a5,-204(s0)
80002236:	b789                	j	80002178 <geos_main+0x62e>
80002238:	f4442783          	lw	a5,-188(s0)
8000223c:	0785                	addi	a5,a5,1
8000223e:	f4f42223          	sw	a5,-188(s0)
80002242:	0d85                	addi	s11,s11,1
80002244:	fac45783          	lhu	a5,-84(s0)
80002248:	d6fddfe3          	bge	s11,a5,80001fc6 <geos_main+0x47c>
8000224c:	02000793          	li	a5,32
80002250:	d6fd8be3          	beq	s11,a5,80001fc6 <geos_main+0x47c>
80002254:	501010ef          	jal	80003f54 <begin_op>
80002258:	005d9793          	slli	a5,s11,0x5
8000225c:	02000713          	li	a4,32
80002260:	f9c42683          	lw	a3,-100(s0)
80002264:	96be                	add	a3,a3,a5
80002266:	f6040613          	addi	a2,s0,-160
8000226a:	4581                	li	a1,0
8000226c:	8526                	mv	a0,s1
8000226e:	06a010ef          	jal	800032d8 <readi>
80002272:	8a2a                	mv	s4,a0
80002274:	549010ef          	jal	80003fbc <end_op>
80002278:	47fd                	li	a5,31
8000227a:	d347dfe3          	bge	a5,s4,80001fb8 <geos_main+0x46e>
8000227e:	f6042703          	lw	a4,-160(s0)
80002282:	4785                	li	a5,1
80002284:	faf71fe3          	bne	a4,a5,80002242 <geos_main+0x6f8>
80002288:	f6842603          	lw	a2,-152(s0)
8000228c:	76fd                	lui	a3,0xfffff
8000228e:	00d675b3          	and	a1,a2,a3
80002292:	f2b42c23          	sw	a1,-200(s0)
80002296:	f7442703          	lw	a4,-140(s0)
8000229a:	00e607b3          	add	a5,a2,a4
8000229e:	f3042503          	lw	a0,-208(s0)
800022a2:	97aa                	add	a5,a5,a0
800022a4:	8ff5                	and	a5,a5,a3
800022a6:	40b786b3          	sub	a3,a5,a1
800022aa:	82b1                	srli	a3,a3,0xc
800022ac:	f2d42e23          	sw	a3,-196(s0)
800022b0:	f2c42683          	lw	a3,-212(s0)
800022b4:	f4d42e23          	sw	a3,-164(s0)
800022b8:	f7842683          	lw	a3,-136(s0)
800022bc:	0046f593          	andi	a1,a3,4
800022c0:	c589                	beqz	a1,800022ca <geos_main+0x780>
800022c2:	05200593          	li	a1,82
800022c6:	f4b40e23          	sb	a1,-164(s0)
800022ca:	0026f593          	andi	a1,a3,2
800022ce:	c589                	beqz	a1,800022d8 <geos_main+0x78e>
800022d0:	05700593          	li	a1,87
800022d4:	f4b40ea3          	sb	a1,-163(s0)
800022d8:	8a85                	andi	a3,a3,1
800022da:	c689                	beqz	a3,800022e4 <geos_main+0x79a>
800022dc:	05800693          	li	a3,88
800022e0:	f4d40f23          	sb	a3,-162(s0)
800022e4:	c03e                	sw	a5,0(sp)
800022e6:	f3842a83          	lw	s5,-200(s0)
800022ea:	88d6                	mv	a7,s5
800022ec:	f3c42803          	lw	a6,-196(s0)
800022f0:	f5c40793          	addi	a5,s0,-164
800022f4:	f7042683          	lw	a3,-144(s0)
800022f8:	f4442583          	lw	a1,-188(s0)
800022fc:	00004517          	auipc	a0,0x4
80002300:	2c450513          	addi	a0,a0,708 # 800065c0 <consoleinit+0x11b6>
80002304:	b82fe0ef          	jal	80000686 <printf>
80002308:	4c01                	li	s8,0
8000230a:	bdad                	j	80002184 <geos_main+0x63a>
8000230c:	00004517          	auipc	a0,0x4
80002310:	3b850513          	addi	a0,a0,952 # 800066c4 <consoleinit+0x12ba>
80002314:	b72fe0ef          	jal	80000686 <printf>
80002318:	8526                	mv	a0,s1
8000231a:	653000ef          	jal	8000316c <iunlockput>
8000231e:	b61d                	j	80001e44 <geos_main+0x2fa>
80002320:	00a7da13          	srli	s4,a5,0xa
80002324:	0a32                	slli	s4,s4,0xc
80002326:	0b4a0a93          	addi	s5,s4,180 # 800000b4 <exec_elf+0x3a>
8000232a:	8656                	mv	a2,s5
8000232c:	6585                	lui	a1,0x1
8000232e:	0b458593          	addi	a1,a1,180 # 10b4 <_entry-0x7fffef4c>
80002332:	00004517          	auipc	a0,0x4
80002336:	3b650513          	addi	a0,a0,950 # 800066e8 <consoleinit+0x12de>
8000233a:	b4cfe0ef          	jal	80000686 <printf>
8000233e:	0c4a0a13          	addi	s4,s4,196
80002342:	8b56                	mv	s6,s5
80002344:	00004b97          	auipc	s7,0x4
80002348:	3dcb8b93          	addi	s7,s7,988 # 80006720 <consoleinit+0x1316>
8000234c:	000b4583          	lbu	a1,0(s6) # 1000 <_entry-0x7ffff000>
80002350:	855e                	mv	a0,s7
80002352:	b34fe0ef          	jal	80000686 <printf>
80002356:	0b05                	addi	s6,s6,1
80002358:	ff4b1ae3          	bne	s6,s4,8000234c <geos_main+0x802>
8000235c:	4529                	li	a0,10
8000235e:	cddfd0ef          	jal	8000003a <putchar>
80002362:	00004517          	auipc	a0,0x4
80002366:	3c650513          	addi	a0,a0,966 # 80006728 <consoleinit+0x131e>
8000236a:	b1cfe0ef          	jal	80000686 <printf>
8000236e:	05e00b93          	li	s7,94
80002372:	02e00b13          	li	s6,46
80002376:	a031                	j	80002382 <geos_main+0x838>
80002378:	cc3fd0ef          	jal	8000003a <putchar>
8000237c:	0a85                	addi	s5,s5,1
8000237e:	014a8c63          	beq	s5,s4,80002396 <geos_main+0x84c>
80002382:	000ac503          	lbu	a0,0(s5)
80002386:	fe050793          	addi	a5,a0,-32
8000238a:	0ff7f793          	zext.b	a5,a5
8000238e:	fefbf5e3          	bgeu	s7,a5,80002378 <geos_main+0x82e>
80002392:	855a                	mv	a0,s6
80002394:	b7d5                	j	80002378 <geos_main+0x82e>
80002396:	4529                	li	a0,10
80002398:	ca3fd0ef          	jal	8000003a <putchar>
8000239c:	b1a9                	j	80001fe6 <geos_main+0x49c>
8000239e:	85d2                	mv	a1,s4
800023a0:	00004517          	auipc	a0,0x4
800023a4:	3e450513          	addi	a0,a0,996 # 80006784 <consoleinit+0x137a>
800023a8:	adefe0ef          	jal	80000686 <printf>
800023ac:	8526                	mv	a0,s1
800023ae:	5bf000ef          	jal	8000316c <iunlockput>
800023b2:	bc49                	j	80001e44 <geos_main+0x2fa>
800023b4:	85d2                	mv	a1,s4
800023b6:	00004517          	auipc	a0,0x4
800023ba:	3f250513          	addi	a0,a0,1010 # 800067a8 <consoleinit+0x139e>
800023be:	ac8fe0ef          	jal	80000686 <printf>
800023c2:	8526                	mv	a0,s1
800023c4:	5a9000ef          	jal	8000316c <iunlockput>
800023c8:	bcb5                	j	80001e44 <geos_main+0x2fa>
800023ca:	00004517          	auipc	a0,0x4
800023ce:	55250513          	addi	a0,a0,1362 # 8000691c <consoleinit+0x1512>
800023d2:	ab4fe0ef          	jal	80000686 <printf>
800023d6:	a039                	j	800023e4 <geos_main+0x89a>
800023d8:	00004517          	auipc	a0,0x4
800023dc:	56850513          	addi	a0,a0,1384 # 80006940 <consoleinit+0x1536>
800023e0:	aa6fe0ef          	jal	80000686 <printf>
800023e4:	f9842783          	lw	a5,-104(s0)
800023e8:	f4042703          	lw	a4,-192(s0)
800023ec:	00f70a33          	add	s4,a4,a5
800023f0:	f3442783          	lw	a5,-204(s0)
800023f4:	40fa0a33          	sub	s4,s4,a5
800023f8:	4a81                	li	s5,0
800023fa:	02000b13          	li	s6,32
800023fe:	4c7d                	li	s8,31
80002400:	4b85                	li	s7,1
80002402:	a011                	j	80002406 <geos_main+0x8bc>
80002404:	0c85                	addi	s9,s9,1
80002406:	fac45783          	lhu	a5,-84(s0)
8000240a:	04fcd463          	bge	s9,a5,80002452 <geos_main+0x908>
8000240e:	056c8263          	beq	s9,s6,80002452 <geos_main+0x908>
80002412:	343010ef          	jal	80003f54 <begin_op>
80002416:	005c9793          	slli	a5,s9,0x5
8000241a:	875a                	mv	a4,s6
8000241c:	f9c42683          	lw	a3,-100(s0)
80002420:	96be                	add	a3,a3,a5
80002422:	f6040613          	addi	a2,s0,-160
80002426:	4581                	li	a1,0
80002428:	8526                	mv	a0,s1
8000242a:	6af000ef          	jal	800032d8 <readi>
8000242e:	892a                	mv	s2,a0
80002430:	38d010ef          	jal	80003fbc <end_op>
80002434:	012c5f63          	bge	s8,s2,80002452 <geos_main+0x908>
80002438:	f6042783          	lw	a5,-160(s0)
8000243c:	fd7794e3          	bne	a5,s7,80002404 <geos_main+0x8ba>
80002440:	f6842783          	lw	a5,-152(s0)
80002444:	f7442703          	lw	a4,-140(s0)
80002448:	97ba                	add	a5,a5,a4
8000244a:	fafafde3          	bgeu	s5,a5,80002404 <geos_main+0x8ba>
8000244e:	8abe                	mv	s5,a5
80002450:	bf55                	j	80002404 <geos_main+0x8ba>
80002452:	6785                	lui	a5,0x1
80002454:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
80002456:	9abe                	add	s5,s5,a5
80002458:	77fd                	lui	a5,0xfffff
8000245a:	00fafab3          	and	s5,s5,a5
8000245e:	000a9363          	bnez	s5,80002464 <geos_main+0x91a>
80002462:	6a85                	lui	s5,0x1
80002464:	f9842b03          	lw	s6,-104(s0)
80002468:	8652                	mv	a2,s4
8000246a:	85da                	mv	a1,s6
8000246c:	00004517          	auipc	a0,0x4
80002470:	4fc50513          	addi	a0,a0,1276 # 80006968 <consoleinit+0x155e>
80002474:	a12fe0ef          	jal	80000686 <printf>
80002478:	f93fd0ef          	jal	8000040a <myproc>
8000247c:	892a                	mv	s2,a0
8000247e:	03352623          	sw	s3,44(a0)
80002482:	03552423          	sw	s5,40(a0)
80002486:	00004517          	auipc	a0,0x4
8000248a:	52650513          	addi	a0,a0,1318 # 800069ac <consoleinit+0x15a2>
8000248e:	9f8fe0ef          	jal	80000686 <printf>
80002492:	0009a783          	lw	a5,0(s3)
80002496:	0017f713          	andi	a4,a5,1
8000249a:	c719                	beqz	a4,800024a8 <geos_main+0x95e>
8000249c:	83a9                	srli	a5,a5,0xa
8000249e:	07b2                	slli	a5,a5,0xc
800024a0:	43dc                	lw	a5,4(a5)
800024a2:	0017f713          	andi	a4,a5,1
800024a6:	e371                	bnez	a4,8000256a <geos_main+0xa20>
800024a8:	00004517          	auipc	a0,0x4
800024ac:	53850513          	addi	a0,a0,1336 # 800069e0 <consoleinit+0x15d6>
800024b0:	9d6fe0ef          	jal	80000686 <printf>
800024b4:	86afe0ef          	jal	8000051e <kalloc>
800024b8:	02a92823          	sw	a0,48(s2) # fffff030 <_stack_top+0x7ffe6030>
800024bc:	c121                	beqz	a0,800024fc <geos_main+0x9b2>
800024be:	4781                	li	a5,0
800024c0:	6685                	lui	a3,0x1
800024c2:	03092703          	lw	a4,48(s2)
800024c6:	973e                	add	a4,a4,a5
800024c8:	00072023          	sw	zero,0(a4)
800024cc:	0791                	addi	a5,a5,4 # fffff004 <_stack_top+0x7ffe6004>
800024ce:	fed79ae3          	bne	a5,a3,800024c2 <geos_main+0x978>
800024d2:	03092783          	lw	a5,48(s2)
800024d6:	0167a623          	sw	s6,12(a5)
800024da:	03092783          	lw	a5,48(s2)
800024de:	7ffff737          	lui	a4,0x7ffff
800024e2:	cf98                	sw	a4,24(a5)
800024e4:	03092783          	lw	a5,48(s2)
800024e8:	0207ac23          	sw	zero,56(a5)
800024ec:	03092783          	lw	a5,48(s2)
800024f0:	0207ae23          	sw	zero,60(a5)
800024f4:	03092783          	lw	a5,48(s2)
800024f8:	577d                	li	a4,-1
800024fa:	cbd8                	sw	a4,20(a5)
800024fc:	00004517          	auipc	a0,0x4
80002500:	d3850513          	addi	a0,a0,-712 # 80006234 <consoleinit+0xe2a>
80002504:	1f8010ef          	jal	800036fc <namei>
80002508:	8aaa                	mv	s5,a0
8000250a:	c901                	beqz	a0,8000251a <geos_main+0x9d0>
8000250c:	265000ef          	jal	80002f70 <ilock>
80002510:	8556                	mv	a0,s5
80002512:	30b000ef          	jal	8000301c <iunlock>
80002516:	0b592623          	sw	s5,172(s2)
8000251a:	234010ef          	jal	8000374e <filealloc>
8000251e:	c171                	beqz	a0,800025e2 <geos_main+0xa98>
80002520:	468d                	li	a3,3
80002522:	c114                	sw	a3,0(a0)
80002524:	4705                	li	a4,1
80002526:	00e51c23          	sh	a4,24(a0)
8000252a:	00e50423          	sb	a4,8(a0)
8000252e:	00e504a3          	sb	a4,9(a0)
80002532:	06a92623          	sw	a0,108(s2)
80002536:	06a92823          	sw	a0,112(s2)
8000253a:	06a92a23          	sw	a0,116(s2)
8000253e:	c154                	sw	a3,4(a0)
80002540:	00004517          	auipc	a0,0x4
80002544:	4c050513          	addi	a0,a0,1216 # 80006a00 <consoleinit+0x15f6>
80002548:	93efe0ef          	jal	80000686 <printf>
8000254c:	8526                	mv	a0,s1
8000254e:	41f000ef          	jal	8000316c <iunlockput>
80002552:	8652                	mv	a2,s4
80002554:	85da                	mv	a1,s6
80002556:	00004517          	auipc	a0,0x4
8000255a:	51650513          	addi	a0,a0,1302 # 80006a6c <consoleinit+0x1662>
8000255e:	928fe0ef          	jal	80000686 <printf>
80002562:	85ce                	mv	a1,s3
80002564:	855a                	mv	a0,s6
80002566:	b15fd0ef          	jal	8000007a <exec_elf>
8000256a:	00a7da93          	srli	s5,a5,0xa
8000256e:	0ab2                	slli	s5,s5,0xc
80002570:	0b4a8b93          	addi	s7,s5,180 # 10b4 <_entry-0x7fffef4c>
80002574:	85de                	mv	a1,s7
80002576:	00004517          	auipc	a0,0x4
8000257a:	44a50513          	addi	a0,a0,1098 # 800069c0 <consoleinit+0x15b6>
8000257e:	908fe0ef          	jal	80000686 <printf>
80002582:	0bca8a93          	addi	s5,s5,188
80002586:	8c5e                	mv	s8,s7
80002588:	00004c97          	auipc	s9,0x4
8000258c:	450c8c93          	addi	s9,s9,1104 # 800069d8 <consoleinit+0x15ce>
80002590:	000c4583          	lbu	a1,0(s8)
80002594:	8566                	mv	a0,s9
80002596:	8f0fe0ef          	jal	80000686 <printf>
8000259a:	0c05                	addi	s8,s8,1
8000259c:	ff5c1ae3          	bne	s8,s5,80002590 <geos_main+0xa46>
800025a0:	00004517          	auipc	a0,0x4
800025a4:	43c50513          	addi	a0,a0,1084 # 800069dc <consoleinit+0x15d2>
800025a8:	8defe0ef          	jal	80000686 <printf>
800025ac:	05e00c93          	li	s9,94
800025b0:	02e00c13          	li	s8,46
800025b4:	a031                	j	800025c0 <geos_main+0xa76>
800025b6:	a85fd0ef          	jal	8000003a <putchar>
800025ba:	0b85                	addi	s7,s7,1
800025bc:	015b8c63          	beq	s7,s5,800025d4 <geos_main+0xa8a>
800025c0:	000bc503          	lbu	a0,0(s7)
800025c4:	fe050793          	addi	a5,a0,-32
800025c8:	0ff7f793          	zext.b	a5,a5
800025cc:	fefcf5e3          	bgeu	s9,a5,800025b6 <geos_main+0xa6c>
800025d0:	8562                	mv	a0,s8
800025d2:	b7d5                	j	800025b6 <geos_main+0xa6c>
800025d4:	00004517          	auipc	a0,0x4
800025d8:	ad850513          	addi	a0,a0,-1320 # 800060ac <consoleinit+0xca2>
800025dc:	8aafe0ef          	jal	80000686 <printf>
800025e0:	b5e1                	j	800024a8 <geos_main+0x95e>
800025e2:	00004517          	auipc	a0,0x4
800025e6:	45250513          	addi	a0,a0,1106 # 80006a34 <consoleinit+0x162a>
800025ea:	89cfe0ef          	jal	80000686 <printf>
800025ee:	bfb9                	j	8000254c <geos_main+0xa02>

800025f0 <swtch>:
800025f0:	00152023          	sw	ra,0(a0)
800025f4:	00252223          	sw	sp,4(a0)
800025f8:	c500                	sw	s0,8(a0)
800025fa:	c544                	sw	s1,12(a0)
800025fc:	01252823          	sw	s2,16(a0)
80002600:	01352a23          	sw	s3,20(a0)
80002604:	01452c23          	sw	s4,24(a0)
80002608:	01552e23          	sw	s5,28(a0)
8000260c:	03652023          	sw	s6,32(a0)
80002610:	03752223          	sw	s7,36(a0)
80002614:	03852423          	sw	s8,40(a0)
80002618:	03952623          	sw	s9,44(a0)
8000261c:	03a52823          	sw	s10,48(a0)
80002620:	03b52a23          	sw	s11,52(a0)
80002624:	0005a083          	lw	ra,0(a1)
80002628:	0045a103          	lw	sp,4(a1)
8000262c:	4580                	lw	s0,8(a1)
8000262e:	45c4                	lw	s1,12(a1)
80002630:	0105a903          	lw	s2,16(a1)
80002634:	0145a983          	lw	s3,20(a1)
80002638:	0185aa03          	lw	s4,24(a1)
8000263c:	01c5aa83          	lw	s5,28(a1)
80002640:	0205ab03          	lw	s6,32(a1)
80002644:	0245ab83          	lw	s7,36(a1)
80002648:	0285ac03          	lw	s8,40(a1)
8000264c:	02c5ac83          	lw	s9,44(a1)
80002650:	0305ad03          	lw	s10,48(a1)
80002654:	0345ad83          	lw	s11,52(a1)
80002658:	8082                	ret

8000265a <binit>:
8000265a:	1101                	addi	sp,sp,-32
8000265c:	ce06                	sw	ra,28(sp)
8000265e:	cc22                	sw	s0,24(sp)
80002660:	ca26                	sw	s1,20(sp)
80002662:	c84a                	sw	s2,16(sp)
80002664:	c64e                	sw	s3,12(sp)
80002666:	c452                	sw	s4,8(sp)
80002668:	1000                	addi	s0,sp,32
8000266a:	00004597          	auipc	a1,0x4
8000266e:	4aa58593          	addi	a1,a1,1194 # 80006b14 <consoleinit+0x170a>
80002672:	00008517          	auipc	a0,0x8
80002676:	ac650513          	addi	a0,a0,-1338 # 8000a138 <bcache>
8000267a:	2c2d                	jal	800028b4 <initlock>
8000267c:	00010797          	auipc	a5,0x10
80002680:	abc78793          	addi	a5,a5,-1348 # 80012138 <bcache+0x8000>
80002684:	00010717          	auipc	a4,0x10
80002688:	8d870713          	addi	a4,a4,-1832 # 80011f5c <bcache+0x7e24>
8000268c:	e4e7a823          	sw	a4,-432(a5)
80002690:	e4e7aa23          	sw	a4,-428(a5)
80002694:	00008497          	auipc	s1,0x8
80002698:	ab048493          	addi	s1,s1,-1360 # 8000a144 <bcache+0xc>
8000269c:	893e                	mv	s2,a5
8000269e:	89ba                	mv	s3,a4
800026a0:	00004a17          	auipc	s4,0x4
800026a4:	47ca0a13          	addi	s4,s4,1148 # 80006b1c <consoleinit+0x1712>
800026a8:	e5492783          	lw	a5,-428(s2)
800026ac:	d89c                	sw	a5,48(s1)
800026ae:	0334a623          	sw	s3,44(s1)
800026b2:	85d2                	mv	a1,s4
800026b4:	01048513          	addi	a0,s1,16
800026b8:	2e2d                	jal	800029f2 <initsleeplock>
800026ba:	e5492783          	lw	a5,-428(s2)
800026be:	d7c4                	sw	s1,44(a5)
800026c0:	e4992a23          	sw	s1,-428(s2)
800026c4:	43448493          	addi	s1,s1,1076
800026c8:	ff3490e3          	bne	s1,s3,800026a8 <binit+0x4e>
800026cc:	40f2                	lw	ra,28(sp)
800026ce:	4462                	lw	s0,24(sp)
800026d0:	44d2                	lw	s1,20(sp)
800026d2:	4942                	lw	s2,16(sp)
800026d4:	49b2                	lw	s3,12(sp)
800026d6:	4a22                	lw	s4,8(sp)
800026d8:	6105                	addi	sp,sp,32
800026da:	8082                	ret

800026dc <bread>:
800026dc:	1101                	addi	sp,sp,-32
800026de:	ce06                	sw	ra,28(sp)
800026e0:	cc22                	sw	s0,24(sp)
800026e2:	ca26                	sw	s1,20(sp)
800026e4:	c84a                	sw	s2,16(sp)
800026e6:	c64e                	sw	s3,12(sp)
800026e8:	1000                	addi	s0,sp,32
800026ea:	892a                	mv	s2,a0
800026ec:	89ae                	mv	s3,a1
800026ee:	00008517          	auipc	a0,0x8
800026f2:	a4a50513          	addi	a0,a0,-1462 # 8000a138 <bcache>
800026f6:	2c3d                	jal	80002934 <acquire>
800026f8:	00010497          	auipc	s1,0x10
800026fc:	8944a483          	lw	s1,-1900(s1) # 80011f8c <bcache+0x7e54>
80002700:	00010797          	auipc	a5,0x10
80002704:	85c78793          	addi	a5,a5,-1956 # 80011f5c <bcache+0x7e24>
80002708:	02f48963          	beq	s1,a5,8000273a <bread+0x5e>
8000270c:	873e                	mv	a4,a5
8000270e:	a021                	j	80002716 <bread+0x3a>
80002710:	5884                	lw	s1,48(s1)
80002712:	02e48463          	beq	s1,a4,8000273a <bread+0x5e>
80002716:	449c                	lw	a5,8(s1)
80002718:	fef91ce3          	bne	s2,a5,80002710 <bread+0x34>
8000271c:	44dc                	lw	a5,12(s1)
8000271e:	fef999e3          	bne	s3,a5,80002710 <bread+0x34>
80002722:	549c                	lw	a5,40(s1)
80002724:	0785                	addi	a5,a5,1
80002726:	d49c                	sw	a5,40(s1)
80002728:	00008517          	auipc	a0,0x8
8000272c:	a1050513          	addi	a0,a0,-1520 # 8000a138 <bcache>
80002730:	2479                	jal	800029be <release>
80002732:	01048513          	addi	a0,s1,16
80002736:	2cc5                	jal	80002a26 <acquiresleep>
80002738:	a0b9                	j	80002786 <bread+0xaa>
8000273a:	00010497          	auipc	s1,0x10
8000273e:	84e4a483          	lw	s1,-1970(s1) # 80011f88 <bcache+0x7e50>
80002742:	00010797          	auipc	a5,0x10
80002746:	81a78793          	addi	a5,a5,-2022 # 80011f5c <bcache+0x7e24>
8000274a:	00f48863          	beq	s1,a5,8000275a <bread+0x7e>
8000274e:	873e                	mv	a4,a5
80002750:	549c                	lw	a5,40(s1)
80002752:	cb91                	beqz	a5,80002766 <bread+0x8a>
80002754:	54c4                	lw	s1,44(s1)
80002756:	fee49de3          	bne	s1,a4,80002750 <bread+0x74>
8000275a:	00004517          	auipc	a0,0x4
8000275e:	3ca50513          	addi	a0,a0,970 # 80006b24 <consoleinit+0x171a>
80002762:	8c6fe0ef          	jal	80000828 <panic>
80002766:	0124a423          	sw	s2,8(s1)
8000276a:	0134a623          	sw	s3,12(s1)
8000276e:	0004a023          	sw	zero,0(s1)
80002772:	4785                	li	a5,1
80002774:	d49c                	sw	a5,40(s1)
80002776:	00008517          	auipc	a0,0x8
8000277a:	9c250513          	addi	a0,a0,-1598 # 8000a138 <bcache>
8000277e:	2481                	jal	800029be <release>
80002780:	01048513          	addi	a0,s1,16
80002784:	244d                	jal	80002a26 <acquiresleep>
80002786:	409c                	lw	a5,0(s1)
80002788:	cb89                	beqz	a5,8000279a <bread+0xbe>
8000278a:	8526                	mv	a0,s1
8000278c:	40f2                	lw	ra,28(sp)
8000278e:	4462                	lw	s0,24(sp)
80002790:	44d2                	lw	s1,20(sp)
80002792:	4942                	lw	s2,16(sp)
80002794:	49b2                	lw	s3,12(sp)
80002796:	6105                	addi	sp,sp,32
80002798:	8082                	ret
8000279a:	4581                	li	a1,0
8000279c:	8526                	mv	a0,s1
8000279e:	ea3fd0ef          	jal	80000640 <virtio_disk_rw>
800027a2:	4785                	li	a5,1
800027a4:	c09c                	sw	a5,0(s1)
800027a6:	b7d5                	j	8000278a <bread+0xae>

800027a8 <bwrite>:
800027a8:	1141                	addi	sp,sp,-16
800027aa:	c606                	sw	ra,12(sp)
800027ac:	c422                	sw	s0,8(sp)
800027ae:	c226                	sw	s1,4(sp)
800027b0:	0800                	addi	s0,sp,16
800027b2:	84aa                	mv	s1,a0
800027b4:	0541                	addi	a0,a0,16
800027b6:	24dd                	jal	80002a9c <holdingsleep>
800027b8:	c911                	beqz	a0,800027cc <bwrite+0x24>
800027ba:	4585                	li	a1,1
800027bc:	8526                	mv	a0,s1
800027be:	e83fd0ef          	jal	80000640 <virtio_disk_rw>
800027c2:	40b2                	lw	ra,12(sp)
800027c4:	4422                	lw	s0,8(sp)
800027c6:	4492                	lw	s1,4(sp)
800027c8:	0141                	addi	sp,sp,16
800027ca:	8082                	ret
800027cc:	00004517          	auipc	a0,0x4
800027d0:	36c50513          	addi	a0,a0,876 # 80006b38 <consoleinit+0x172e>
800027d4:	854fe0ef          	jal	80000828 <panic>

800027d8 <brelse>:
800027d8:	1141                	addi	sp,sp,-16
800027da:	c606                	sw	ra,12(sp)
800027dc:	c422                	sw	s0,8(sp)
800027de:	c226                	sw	s1,4(sp)
800027e0:	c04a                	sw	s2,0(sp)
800027e2:	0800                	addi	s0,sp,16
800027e4:	84aa                	mv	s1,a0
800027e6:	01050913          	addi	s2,a0,16
800027ea:	854a                	mv	a0,s2
800027ec:	2c45                	jal	80002a9c <holdingsleep>
800027ee:	cd29                	beqz	a0,80002848 <brelse+0x70>
800027f0:	854a                	mv	a0,s2
800027f2:	2c9d                	jal	80002a68 <releasesleep>
800027f4:	00008517          	auipc	a0,0x8
800027f8:	94450513          	addi	a0,a0,-1724 # 8000a138 <bcache>
800027fc:	2a25                	jal	80002934 <acquire>
800027fe:	549c                	lw	a5,40(s1)
80002800:	17fd                	addi	a5,a5,-1
80002802:	d49c                	sw	a5,40(s1)
80002804:	e79d                	bnez	a5,80002832 <brelse+0x5a>
80002806:	5898                	lw	a4,48(s1)
80002808:	54dc                	lw	a5,44(s1)
8000280a:	d75c                	sw	a5,44(a4)
8000280c:	5898                	lw	a4,48(s1)
8000280e:	db98                	sw	a4,48(a5)
80002810:	00010797          	auipc	a5,0x10
80002814:	92878793          	addi	a5,a5,-1752 # 80012138 <bcache+0x8000>
80002818:	e547a703          	lw	a4,-428(a5)
8000281c:	d898                	sw	a4,48(s1)
8000281e:	0000f717          	auipc	a4,0xf
80002822:	73e70713          	addi	a4,a4,1854 # 80011f5c <bcache+0x7e24>
80002826:	d4d8                	sw	a4,44(s1)
80002828:	e547a703          	lw	a4,-428(a5)
8000282c:	d744                	sw	s1,44(a4)
8000282e:	e497aa23          	sw	s1,-428(a5)
80002832:	00008517          	auipc	a0,0x8
80002836:	90650513          	addi	a0,a0,-1786 # 8000a138 <bcache>
8000283a:	2251                	jal	800029be <release>
8000283c:	40b2                	lw	ra,12(sp)
8000283e:	4422                	lw	s0,8(sp)
80002840:	4492                	lw	s1,4(sp)
80002842:	4902                	lw	s2,0(sp)
80002844:	0141                	addi	sp,sp,16
80002846:	8082                	ret
80002848:	00004517          	auipc	a0,0x4
8000284c:	2f850513          	addi	a0,a0,760 # 80006b40 <consoleinit+0x1736>
80002850:	fd9fd0ef          	jal	80000828 <panic>

80002854 <bpin>:
80002854:	1141                	addi	sp,sp,-16
80002856:	c606                	sw	ra,12(sp)
80002858:	c422                	sw	s0,8(sp)
8000285a:	c226                	sw	s1,4(sp)
8000285c:	0800                	addi	s0,sp,16
8000285e:	84aa                	mv	s1,a0
80002860:	00008517          	auipc	a0,0x8
80002864:	8d850513          	addi	a0,a0,-1832 # 8000a138 <bcache>
80002868:	20f1                	jal	80002934 <acquire>
8000286a:	549c                	lw	a5,40(s1)
8000286c:	0785                	addi	a5,a5,1
8000286e:	d49c                	sw	a5,40(s1)
80002870:	00008517          	auipc	a0,0x8
80002874:	8c850513          	addi	a0,a0,-1848 # 8000a138 <bcache>
80002878:	2299                	jal	800029be <release>
8000287a:	40b2                	lw	ra,12(sp)
8000287c:	4422                	lw	s0,8(sp)
8000287e:	4492                	lw	s1,4(sp)
80002880:	0141                	addi	sp,sp,16
80002882:	8082                	ret

80002884 <bunpin>:
80002884:	1141                	addi	sp,sp,-16
80002886:	c606                	sw	ra,12(sp)
80002888:	c422                	sw	s0,8(sp)
8000288a:	c226                	sw	s1,4(sp)
8000288c:	0800                	addi	s0,sp,16
8000288e:	84aa                	mv	s1,a0
80002890:	00008517          	auipc	a0,0x8
80002894:	8a850513          	addi	a0,a0,-1880 # 8000a138 <bcache>
80002898:	2871                	jal	80002934 <acquire>
8000289a:	549c                	lw	a5,40(s1)
8000289c:	17fd                	addi	a5,a5,-1
8000289e:	d49c                	sw	a5,40(s1)
800028a0:	00008517          	auipc	a0,0x8
800028a4:	89850513          	addi	a0,a0,-1896 # 8000a138 <bcache>
800028a8:	2a19                	jal	800029be <release>
800028aa:	40b2                	lw	ra,12(sp)
800028ac:	4422                	lw	s0,8(sp)
800028ae:	4492                	lw	s1,4(sp)
800028b0:	0141                	addi	sp,sp,16
800028b2:	8082                	ret

800028b4 <initlock>:
800028b4:	1141                	addi	sp,sp,-16
800028b6:	c622                	sw	s0,12(sp)
800028b8:	0800                	addi	s0,sp,16
800028ba:	c14c                	sw	a1,4(a0)
800028bc:	00052023          	sw	zero,0(a0)
800028c0:	00052423          	sw	zero,8(a0)
800028c4:	4432                	lw	s0,12(sp)
800028c6:	0141                	addi	sp,sp,16
800028c8:	8082                	ret

800028ca <holding>:
800028ca:	411c                	lw	a5,0(a0)
800028cc:	e399                	bnez	a5,800028d2 <holding+0x8>
800028ce:	4501                	li	a0,0
800028d0:	8082                	ret
800028d2:	1141                	addi	sp,sp,-16
800028d4:	c606                	sw	ra,12(sp)
800028d6:	c422                	sw	s0,8(sp)
800028d8:	c226                	sw	s1,4(sp)
800028da:	0800                	addi	s0,sp,16
800028dc:	4504                	lw	s1,8(a0)
800028de:	b19fd0ef          	jal	800003f6 <mycpu>
800028e2:	40a48533          	sub	a0,s1,a0
800028e6:	00153513          	seqz	a0,a0
800028ea:	40b2                	lw	ra,12(sp)
800028ec:	4422                	lw	s0,8(sp)
800028ee:	4492                	lw	s1,4(sp)
800028f0:	0141                	addi	sp,sp,16
800028f2:	8082                	ret

800028f4 <push_off>:
800028f4:	1141                	addi	sp,sp,-16
800028f6:	c606                	sw	ra,12(sp)
800028f8:	c422                	sw	s0,8(sp)
800028fa:	c226                	sw	s1,4(sp)
800028fc:	0800                	addi	s0,sp,16
800028fe:	100024f3          	csrr	s1,sstatus
80002902:	100027f3          	csrr	a5,sstatus
80002906:	9bf5                	andi	a5,a5,-3
80002908:	10079073          	csrw	sstatus,a5
8000290c:	aebfd0ef          	jal	800003f6 <mycpu>
80002910:	5d5c                	lw	a5,60(a0)
80002912:	cb99                	beqz	a5,80002928 <push_off+0x34>
80002914:	ae3fd0ef          	jal	800003f6 <mycpu>
80002918:	5d5c                	lw	a5,60(a0)
8000291a:	0785                	addi	a5,a5,1
8000291c:	dd5c                	sw	a5,60(a0)
8000291e:	40b2                	lw	ra,12(sp)
80002920:	4422                	lw	s0,8(sp)
80002922:	4492                	lw	s1,4(sp)
80002924:	0141                	addi	sp,sp,16
80002926:	8082                	ret
80002928:	acffd0ef          	jal	800003f6 <mycpu>
8000292c:	8085                	srli	s1,s1,0x1
8000292e:	8885                	andi	s1,s1,1
80002930:	c124                	sw	s1,64(a0)
80002932:	b7cd                	j	80002914 <push_off+0x20>

80002934 <acquire>:
80002934:	1141                	addi	sp,sp,-16
80002936:	c606                	sw	ra,12(sp)
80002938:	c422                	sw	s0,8(sp)
8000293a:	c226                	sw	s1,4(sp)
8000293c:	0800                	addi	s0,sp,16
8000293e:	84aa                	mv	s1,a0
80002940:	3f55                	jal	800028f4 <push_off>
80002942:	8526                	mv	a0,s1
80002944:	3759                	jal	800028ca <holding>
80002946:	4705                	li	a4,1
80002948:	ed09                	bnez	a0,80002962 <acquire+0x2e>
8000294a:	87ba                	mv	a5,a4
8000294c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
80002950:	ffed                	bnez	a5,8000294a <acquire+0x16>
80002952:	aa5fd0ef          	jal	800003f6 <mycpu>
80002956:	c488                	sw	a0,8(s1)
80002958:	40b2                	lw	ra,12(sp)
8000295a:	4422                	lw	s0,8(sp)
8000295c:	4492                	lw	s1,4(sp)
8000295e:	0141                	addi	sp,sp,16
80002960:	8082                	ret
80002962:	00004517          	auipc	a0,0x4
80002966:	1e650513          	addi	a0,a0,486 # 80006b48 <consoleinit+0x173e>
8000296a:	ebffd0ef          	jal	80000828 <panic>

8000296e <pop_off>:
8000296e:	1141                	addi	sp,sp,-16
80002970:	c606                	sw	ra,12(sp)
80002972:	c422                	sw	s0,8(sp)
80002974:	0800                	addi	s0,sp,16
80002976:	a81fd0ef          	jal	800003f6 <mycpu>
8000297a:	100027f3          	csrr	a5,sstatus
8000297e:	8b89                	andi	a5,a5,2
80002980:	e39d                	bnez	a5,800029a6 <pop_off+0x38>
80002982:	5d5c                	lw	a5,60(a0)
80002984:	02f05763          	blez	a5,800029b2 <pop_off+0x44>
80002988:	17fd                	addi	a5,a5,-1
8000298a:	dd5c                	sw	a5,60(a0)
8000298c:	eb89                	bnez	a5,8000299e <pop_off+0x30>
8000298e:	413c                	lw	a5,64(a0)
80002990:	c799                	beqz	a5,8000299e <pop_off+0x30>
80002992:	100027f3          	csrr	a5,sstatus
80002996:	0027e793          	ori	a5,a5,2
8000299a:	10079073          	csrw	sstatus,a5
8000299e:	40b2                	lw	ra,12(sp)
800029a0:	4422                	lw	s0,8(sp)
800029a2:	0141                	addi	sp,sp,16
800029a4:	8082                	ret
800029a6:	00004517          	auipc	a0,0x4
800029aa:	1aa50513          	addi	a0,a0,426 # 80006b50 <consoleinit+0x1746>
800029ae:	e7bfd0ef          	jal	80000828 <panic>
800029b2:	00004517          	auipc	a0,0x4
800029b6:	1b650513          	addi	a0,a0,438 # 80006b68 <consoleinit+0x175e>
800029ba:	e6ffd0ef          	jal	80000828 <panic>

800029be <release>:
800029be:	1141                	addi	sp,sp,-16
800029c0:	c606                	sw	ra,12(sp)
800029c2:	c422                	sw	s0,8(sp)
800029c4:	c226                	sw	s1,4(sp)
800029c6:	0800                	addi	s0,sp,16
800029c8:	84aa                	mv	s1,a0
800029ca:	3701                	jal	800028ca <holding>
800029cc:	cd09                	beqz	a0,800029e6 <release+0x28>
800029ce:	0004a423          	sw	zero,8(s1)
800029d2:	0f50000f          	fence	iorw,ow
800029d6:	0804a02f          	amoswap.w	zero,zero,(s1)
800029da:	3f51                	jal	8000296e <pop_off>
800029dc:	40b2                	lw	ra,12(sp)
800029de:	4422                	lw	s0,8(sp)
800029e0:	4492                	lw	s1,4(sp)
800029e2:	0141                	addi	sp,sp,16
800029e4:	8082                	ret
800029e6:	00004517          	auipc	a0,0x4
800029ea:	18a50513          	addi	a0,a0,394 # 80006b70 <consoleinit+0x1766>
800029ee:	e3bfd0ef          	jal	80000828 <panic>

800029f2 <initsleeplock>:
800029f2:	1141                	addi	sp,sp,-16
800029f4:	c606                	sw	ra,12(sp)
800029f6:	c422                	sw	s0,8(sp)
800029f8:	c226                	sw	s1,4(sp)
800029fa:	c04a                	sw	s2,0(sp)
800029fc:	0800                	addi	s0,sp,16
800029fe:	84aa                	mv	s1,a0
80002a00:	892e                	mv	s2,a1
80002a02:	00004597          	auipc	a1,0x4
80002a06:	17658593          	addi	a1,a1,374 # 80006b78 <consoleinit+0x176e>
80002a0a:	0511                	addi	a0,a0,4
80002a0c:	3565                	jal	800028b4 <initlock>
80002a0e:	0124a823          	sw	s2,16(s1)
80002a12:	0004a023          	sw	zero,0(s1)
80002a16:	0004aa23          	sw	zero,20(s1)
80002a1a:	40b2                	lw	ra,12(sp)
80002a1c:	4422                	lw	s0,8(sp)
80002a1e:	4492                	lw	s1,4(sp)
80002a20:	4902                	lw	s2,0(sp)
80002a22:	0141                	addi	sp,sp,16
80002a24:	8082                	ret

80002a26 <acquiresleep>:
80002a26:	1141                	addi	sp,sp,-16
80002a28:	c606                	sw	ra,12(sp)
80002a2a:	c422                	sw	s0,8(sp)
80002a2c:	c226                	sw	s1,4(sp)
80002a2e:	c04a                	sw	s2,0(sp)
80002a30:	0800                	addi	s0,sp,16
80002a32:	84aa                	mv	s1,a0
80002a34:	00450913          	addi	s2,a0,4
80002a38:	854a                	mv	a0,s2
80002a3a:	3ded                	jal	80002934 <acquire>
80002a3c:	409c                	lw	a5,0(s1)
80002a3e:	c799                	beqz	a5,80002a4c <acquiresleep+0x26>
80002a40:	85ca                	mv	a1,s2
80002a42:	8526                	mv	a0,s1
80002a44:	960fe0ef          	jal	80000ba4 <sleep>
80002a48:	409c                	lw	a5,0(s1)
80002a4a:	fbfd                	bnez	a5,80002a40 <acquiresleep+0x1a>
80002a4c:	4785                	li	a5,1
80002a4e:	c09c                	sw	a5,0(s1)
80002a50:	9bbfd0ef          	jal	8000040a <myproc>
80002a54:	4d5c                	lw	a5,28(a0)
80002a56:	c8dc                	sw	a5,20(s1)
80002a58:	854a                	mv	a0,s2
80002a5a:	3795                	jal	800029be <release>
80002a5c:	40b2                	lw	ra,12(sp)
80002a5e:	4422                	lw	s0,8(sp)
80002a60:	4492                	lw	s1,4(sp)
80002a62:	4902                	lw	s2,0(sp)
80002a64:	0141                	addi	sp,sp,16
80002a66:	8082                	ret

80002a68 <releasesleep>:
80002a68:	1141                	addi	sp,sp,-16
80002a6a:	c606                	sw	ra,12(sp)
80002a6c:	c422                	sw	s0,8(sp)
80002a6e:	c226                	sw	s1,4(sp)
80002a70:	c04a                	sw	s2,0(sp)
80002a72:	0800                	addi	s0,sp,16
80002a74:	84aa                	mv	s1,a0
80002a76:	00450913          	addi	s2,a0,4
80002a7a:	854a                	mv	a0,s2
80002a7c:	3d65                	jal	80002934 <acquire>
80002a7e:	0004a023          	sw	zero,0(s1)
80002a82:	0004aa23          	sw	zero,20(s1)
80002a86:	8526                	mv	a0,s1
80002a88:	a12fe0ef          	jal	80000c9a <wakeup>
80002a8c:	854a                	mv	a0,s2
80002a8e:	3f05                	jal	800029be <release>
80002a90:	40b2                	lw	ra,12(sp)
80002a92:	4422                	lw	s0,8(sp)
80002a94:	4492                	lw	s1,4(sp)
80002a96:	4902                	lw	s2,0(sp)
80002a98:	0141                	addi	sp,sp,16
80002a9a:	8082                	ret

80002a9c <holdingsleep>:
80002a9c:	1101                	addi	sp,sp,-32
80002a9e:	ce06                	sw	ra,28(sp)
80002aa0:	cc22                	sw	s0,24(sp)
80002aa2:	ca26                	sw	s1,20(sp)
80002aa4:	c84a                	sw	s2,16(sp)
80002aa6:	1000                	addi	s0,sp,32
80002aa8:	84aa                	mv	s1,a0
80002aaa:	00450913          	addi	s2,a0,4
80002aae:	854a                	mv	a0,s2
80002ab0:	3551                	jal	80002934 <acquire>
80002ab2:	409c                	lw	a5,0(s1)
80002ab4:	eb99                	bnez	a5,80002aca <holdingsleep+0x2e>
80002ab6:	4481                	li	s1,0
80002ab8:	854a                	mv	a0,s2
80002aba:	3711                	jal	800029be <release>
80002abc:	8526                	mv	a0,s1
80002abe:	40f2                	lw	ra,28(sp)
80002ac0:	4462                	lw	s0,24(sp)
80002ac2:	44d2                	lw	s1,20(sp)
80002ac4:	4942                	lw	s2,16(sp)
80002ac6:	6105                	addi	sp,sp,32
80002ac8:	8082                	ret
80002aca:	c64e                	sw	s3,12(sp)
80002acc:	0144a983          	lw	s3,20(s1)
80002ad0:	93bfd0ef          	jal	8000040a <myproc>
80002ad4:	4d44                	lw	s1,28(a0)
80002ad6:	413484b3          	sub	s1,s1,s3
80002ada:	0014b493          	seqz	s1,s1
80002ade:	49b2                	lw	s3,12(sp)
80002ae0:	bfe1                	j	80002ab8 <holdingsleep+0x1c>

80002ae2 <bfree>:
80002ae2:	1141                	addi	sp,sp,-16
80002ae4:	c606                	sw	ra,12(sp)
80002ae6:	c422                	sw	s0,8(sp)
80002ae8:	c226                	sw	s1,4(sp)
80002aea:	c04a                	sw	s2,0(sp)
80002aec:	0800                	addi	s0,sp,16
80002aee:	84ae                	mv	s1,a1
80002af0:	81b5                	srli	a1,a1,0xd
80002af2:	00010797          	auipc	a5,0x10
80002af6:	8ba7a783          	lw	a5,-1862(a5) # 800123ac <sb+0x1c>
80002afa:	95be                	add	a1,a1,a5
80002afc:	be1ff0ef          	jal	800026dc <bread>
80002b00:	0074f713          	andi	a4,s1,7
80002b04:	4785                	li	a5,1
80002b06:	00e797b3          	sll	a5,a5,a4
80002b0a:	04ce                	slli	s1,s1,0x13
80002b0c:	80d9                	srli	s1,s1,0x16
80002b0e:	00950733          	add	a4,a0,s1
80002b12:	03474703          	lbu	a4,52(a4)
80002b16:	00f776b3          	and	a3,a4,a5
80002b1a:	c29d                	beqz	a3,80002b40 <bfree+0x5e>
80002b1c:	892a                	mv	s2,a0
80002b1e:	94aa                	add	s1,s1,a0
80002b20:	fff7c793          	not	a5,a5
80002b24:	8f7d                	and	a4,a4,a5
80002b26:	02e48a23          	sb	a4,52(s1)
80002b2a:	5a6010ef          	jal	800040d0 <log_write>
80002b2e:	854a                	mv	a0,s2
80002b30:	ca9ff0ef          	jal	800027d8 <brelse>
80002b34:	40b2                	lw	ra,12(sp)
80002b36:	4422                	lw	s0,8(sp)
80002b38:	4492                	lw	s1,4(sp)
80002b3a:	4902                	lw	s2,0(sp)
80002b3c:	0141                	addi	sp,sp,16
80002b3e:	8082                	ret
80002b40:	00004517          	auipc	a0,0x4
80002b44:	04450513          	addi	a0,a0,68 # 80006b84 <consoleinit+0x177a>
80002b48:	ce1fd0ef          	jal	80000828 <panic>

80002b4c <balloc>:
80002b4c:	7179                	addi	sp,sp,-48
80002b4e:	d606                	sw	ra,44(sp)
80002b50:	d422                	sw	s0,40(sp)
80002b52:	d226                	sw	s1,36(sp)
80002b54:	1800                	addi	s0,sp,48
80002b56:	00010797          	auipc	a5,0x10
80002b5a:	83e7a783          	lw	a5,-1986(a5) # 80012394 <sb+0x4>
80002b5e:	0e078463          	beqz	a5,80002c46 <balloc+0xfa>
80002b62:	d04a                	sw	s2,32(sp)
80002b64:	ce4e                	sw	s3,28(sp)
80002b66:	cc52                	sw	s4,24(sp)
80002b68:	ca56                	sw	s5,20(sp)
80002b6a:	c85a                	sw	s6,16(sp)
80002b6c:	c65e                	sw	s7,12(sp)
80002b6e:	c462                	sw	s8,8(sp)
80002b70:	8baa                	mv	s7,a0
80002b72:	4a81                	li	s5,0
80002b74:	6989                	lui	s3,0x2
80002b76:	fff98c13          	addi	s8,s3,-1 # 1fff <_entry-0x7fffe001>
80002b7a:	00010b17          	auipc	s6,0x10
80002b7e:	816b0b13          	addi	s6,s6,-2026 # 80012390 <sb>
80002b82:	4a05                	li	s4,1
80002b84:	a095                	j	80002be8 <balloc+0x9c>
80002b86:	97ca                	add	a5,a5,s2
80002b88:	8e55                	or	a2,a2,a3
80002b8a:	02c78a23          	sb	a2,52(a5)
80002b8e:	854a                	mv	a0,s2
80002b90:	540010ef          	jal	800040d0 <log_write>
80002b94:	854a                	mv	a0,s2
80002b96:	c43ff0ef          	jal	800027d8 <brelse>
80002b9a:	85a6                	mv	a1,s1
80002b9c:	855e                	mv	a0,s7
80002b9e:	b3fff0ef          	jal	800026dc <bread>
80002ba2:	892a                	mv	s2,a0
80002ba4:	40000613          	li	a2,1024
80002ba8:	4581                	li	a1,0
80002baa:	03450513          	addi	a0,a0,52
80002bae:	5e4010ef          	jal	80004192 <memset>
80002bb2:	854a                	mv	a0,s2
80002bb4:	51c010ef          	jal	800040d0 <log_write>
80002bb8:	854a                	mv	a0,s2
80002bba:	c1fff0ef          	jal	800027d8 <brelse>
80002bbe:	5902                	lw	s2,32(sp)
80002bc0:	49f2                	lw	s3,28(sp)
80002bc2:	4a62                	lw	s4,24(sp)
80002bc4:	4ad2                	lw	s5,20(sp)
80002bc6:	4b42                	lw	s6,16(sp)
80002bc8:	4bb2                	lw	s7,12(sp)
80002bca:	4c22                	lw	s8,8(sp)
80002bcc:	8526                	mv	a0,s1
80002bce:	50b2                	lw	ra,44(sp)
80002bd0:	5422                	lw	s0,40(sp)
80002bd2:	5492                	lw	s1,36(sp)
80002bd4:	6145                	addi	sp,sp,48
80002bd6:	8082                	ret
80002bd8:	854a                	mv	a0,s2
80002bda:	bffff0ef          	jal	800027d8 <brelse>
80002bde:	9ace                	add	s5,s5,s3
80002be0:	004b2783          	lw	a5,4(s6)
80002be4:	04fafa63          	bgeu	s5,a5,80002c38 <balloc+0xec>
80002be8:	41fad793          	srai	a5,s5,0x1f
80002bec:	0187f7b3          	and	a5,a5,s8
80002bf0:	97d6                	add	a5,a5,s5
80002bf2:	87b5                	srai	a5,a5,0xd
80002bf4:	01cb2583          	lw	a1,28(s6)
80002bf8:	95be                	add	a1,a1,a5
80002bfa:	855e                	mv	a0,s7
80002bfc:	ae1ff0ef          	jal	800026dc <bread>
80002c00:	892a                	mv	s2,a0
80002c02:	004b2503          	lw	a0,4(s6)
80002c06:	84d6                	mv	s1,s5
80002c08:	4701                	li	a4,0
80002c0a:	fca4f7e3          	bgeu	s1,a0,80002bd8 <balloc+0x8c>
80002c0e:	00777693          	andi	a3,a4,7
80002c12:	00da16b3          	sll	a3,s4,a3
80002c16:	41f75793          	srai	a5,a4,0x1f
80002c1a:	8b9d                	andi	a5,a5,7
80002c1c:	97ba                	add	a5,a5,a4
80002c1e:	878d                	srai	a5,a5,0x3
80002c20:	00f90633          	add	a2,s2,a5
80002c24:	03464603          	lbu	a2,52(a2) # 7fff0034 <_entry-0xffcc>
80002c28:	00d675b3          	and	a1,a2,a3
80002c2c:	dda9                	beqz	a1,80002b86 <balloc+0x3a>
80002c2e:	0705                	addi	a4,a4,1
80002c30:	0485                	addi	s1,s1,1
80002c32:	fd371ce3          	bne	a4,s3,80002c0a <balloc+0xbe>
80002c36:	b74d                	j	80002bd8 <balloc+0x8c>
80002c38:	5902                	lw	s2,32(sp)
80002c3a:	49f2                	lw	s3,28(sp)
80002c3c:	4a62                	lw	s4,24(sp)
80002c3e:	4ad2                	lw	s5,20(sp)
80002c40:	4b42                	lw	s6,16(sp)
80002c42:	4bb2                	lw	s7,12(sp)
80002c44:	4c22                	lw	s8,8(sp)
80002c46:	00004517          	auipc	a0,0x4
80002c4a:	f5250513          	addi	a0,a0,-174 # 80006b98 <consoleinit+0x178e>
80002c4e:	a39fd0ef          	jal	80000686 <printf>
80002c52:	4481                	li	s1,0
80002c54:	bfa5                	j	80002bcc <balloc+0x80>

80002c56 <bmap>:
80002c56:	1101                	addi	sp,sp,-32
80002c58:	ce06                	sw	ra,28(sp)
80002c5a:	cc22                	sw	s0,24(sp)
80002c5c:	ca26                	sw	s1,20(sp)
80002c5e:	c84a                	sw	s2,16(sp)
80002c60:	c64e                	sw	s3,12(sp)
80002c62:	1000                	addi	s0,sp,32
80002c64:	89aa                	mv	s3,a0
80002c66:	47ad                	li	a5,11
80002c68:	00b7ef63          	bltu	a5,a1,80002c86 <bmap+0x30>
80002c6c:	058a                	slli	a1,a1,0x2
80002c6e:	00b504b3          	add	s1,a0,a1
80002c72:	0344a903          	lw	s2,52(s1)
80002c76:	04091f63          	bnez	s2,80002cd4 <bmap+0x7e>
80002c7a:	4108                	lw	a0,0(a0)
80002c7c:	3dc1                	jal	80002b4c <balloc>
80002c7e:	892a                	mv	s2,a0
80002c80:	c931                	beqz	a0,80002cd4 <bmap+0x7e>
80002c82:	d8c8                	sw	a0,52(s1)
80002c84:	a881                	j	80002cd4 <bmap+0x7e>
80002c86:	ff458493          	addi	s1,a1,-12
80002c8a:	0ff00793          	li	a5,255
80002c8e:	0697e563          	bltu	a5,s1,80002cf8 <bmap+0xa2>
80002c92:	06452903          	lw	s2,100(a0)
80002c96:	00091a63          	bnez	s2,80002caa <bmap+0x54>
80002c9a:	4108                	lw	a0,0(a0)
80002c9c:	3d45                	jal	80002b4c <balloc>
80002c9e:	892a                	mv	s2,a0
80002ca0:	c915                	beqz	a0,80002cd4 <bmap+0x7e>
80002ca2:	c452                	sw	s4,8(sp)
80002ca4:	06a9a223          	sw	a0,100(s3)
80002ca8:	a011                	j	80002cac <bmap+0x56>
80002caa:	c452                	sw	s4,8(sp)
80002cac:	85ca                	mv	a1,s2
80002cae:	0009a503          	lw	a0,0(s3)
80002cb2:	a2bff0ef          	jal	800026dc <bread>
80002cb6:	8a2a                	mv	s4,a0
80002cb8:	03450793          	addi	a5,a0,52
80002cbc:	00249593          	slli	a1,s1,0x2
80002cc0:	00b784b3          	add	s1,a5,a1
80002cc4:	0004a903          	lw	s2,0(s1)
80002cc8:	00090e63          	beqz	s2,80002ce4 <bmap+0x8e>
80002ccc:	8552                	mv	a0,s4
80002cce:	b0bff0ef          	jal	800027d8 <brelse>
80002cd2:	4a22                	lw	s4,8(sp)
80002cd4:	854a                	mv	a0,s2
80002cd6:	40f2                	lw	ra,28(sp)
80002cd8:	4462                	lw	s0,24(sp)
80002cda:	44d2                	lw	s1,20(sp)
80002cdc:	4942                	lw	s2,16(sp)
80002cde:	49b2                	lw	s3,12(sp)
80002ce0:	6105                	addi	sp,sp,32
80002ce2:	8082                	ret
80002ce4:	0009a503          	lw	a0,0(s3)
80002ce8:	3595                	jal	80002b4c <balloc>
80002cea:	892a                	mv	s2,a0
80002cec:	d165                	beqz	a0,80002ccc <bmap+0x76>
80002cee:	c088                	sw	a0,0(s1)
80002cf0:	8552                	mv	a0,s4
80002cf2:	3de010ef          	jal	800040d0 <log_write>
80002cf6:	bfd9                	j	80002ccc <bmap+0x76>
80002cf8:	c452                	sw	s4,8(sp)
80002cfa:	00004517          	auipc	a0,0x4
80002cfe:	eb650513          	addi	a0,a0,-330 # 80006bb0 <consoleinit+0x17a6>
80002d02:	b27fd0ef          	jal	80000828 <panic>

80002d06 <iget>:
80002d06:	1101                	addi	sp,sp,-32
80002d08:	ce06                	sw	ra,28(sp)
80002d0a:	cc22                	sw	s0,24(sp)
80002d0c:	ca26                	sw	s1,20(sp)
80002d0e:	c84a                	sw	s2,16(sp)
80002d10:	c64e                	sw	s3,12(sp)
80002d12:	c452                	sw	s4,8(sp)
80002d14:	1000                	addi	s0,sp,32
80002d16:	89aa                	mv	s3,a0
80002d18:	8a2e                	mv	s4,a1
80002d1a:	0000f517          	auipc	a0,0xf
80002d1e:	69650513          	addi	a0,a0,1686 # 800123b0 <itable>
80002d22:	c13ff0ef          	jal	80002934 <acquire>
80002d26:	4901                	li	s2,0
80002d28:	0000f497          	auipc	s1,0xf
80002d2c:	69448493          	addi	s1,s1,1684 # 800123bc <itable+0xc>
80002d30:	00011697          	auipc	a3,0x11
80002d34:	adc68693          	addi	a3,a3,-1316 # 8001380c <devsw>
80002d38:	a039                	j	80002d46 <iget+0x40>
80002d3a:	02090963          	beqz	s2,80002d6c <iget+0x66>
80002d3e:	06848493          	addi	s1,s1,104
80002d42:	02d48863          	beq	s1,a3,80002d72 <iget+0x6c>
80002d46:	449c                	lw	a5,8(s1)
80002d48:	fef059e3          	blez	a5,80002d3a <iget+0x34>
80002d4c:	4098                	lw	a4,0(s1)
80002d4e:	ff3716e3          	bne	a4,s3,80002d3a <iget+0x34>
80002d52:	40d8                	lw	a4,4(s1)
80002d54:	ff4713e3          	bne	a4,s4,80002d3a <iget+0x34>
80002d58:	0785                	addi	a5,a5,1
80002d5a:	c49c                	sw	a5,8(s1)
80002d5c:	0000f517          	auipc	a0,0xf
80002d60:	65450513          	addi	a0,a0,1620 # 800123b0 <itable>
80002d64:	c5bff0ef          	jal	800029be <release>
80002d68:	8926                	mv	s2,s1
80002d6a:	a02d                	j	80002d94 <iget+0x8e>
80002d6c:	fbe9                	bnez	a5,80002d3e <iget+0x38>
80002d6e:	8926                	mv	s2,s1
80002d70:	b7f9                	j	80002d3e <iget+0x38>
80002d72:	02090a63          	beqz	s2,80002da6 <iget+0xa0>
80002d76:	01392023          	sw	s3,0(s2)
80002d7a:	01492223          	sw	s4,4(s2)
80002d7e:	4785                	li	a5,1
80002d80:	00f92423          	sw	a5,8(s2)
80002d84:	02092223          	sw	zero,36(s2)
80002d88:	0000f517          	auipc	a0,0xf
80002d8c:	62850513          	addi	a0,a0,1576 # 800123b0 <itable>
80002d90:	c2fff0ef          	jal	800029be <release>
80002d94:	854a                	mv	a0,s2
80002d96:	40f2                	lw	ra,28(sp)
80002d98:	4462                	lw	s0,24(sp)
80002d9a:	44d2                	lw	s1,20(sp)
80002d9c:	4942                	lw	s2,16(sp)
80002d9e:	49b2                	lw	s3,12(sp)
80002da0:	4a22                	lw	s4,8(sp)
80002da2:	6105                	addi	sp,sp,32
80002da4:	8082                	ret
80002da6:	00004517          	auipc	a0,0x4
80002daa:	e1e50513          	addi	a0,a0,-482 # 80006bc4 <consoleinit+0x17ba>
80002dae:	a7bfd0ef          	jal	80000828 <panic>

80002db2 <iinit>:
80002db2:	1101                	addi	sp,sp,-32
80002db4:	ce06                	sw	ra,28(sp)
80002db6:	cc22                	sw	s0,24(sp)
80002db8:	ca26                	sw	s1,20(sp)
80002dba:	c84a                	sw	s2,16(sp)
80002dbc:	c64e                	sw	s3,12(sp)
80002dbe:	1000                	addi	s0,sp,32
80002dc0:	00004597          	auipc	a1,0x4
80002dc4:	e1458593          	addi	a1,a1,-492 # 80006bd4 <consoleinit+0x17ca>
80002dc8:	0000f517          	auipc	a0,0xf
80002dcc:	5e850513          	addi	a0,a0,1512 # 800123b0 <itable>
80002dd0:	ae5ff0ef          	jal	800028b4 <initlock>
80002dd4:	0000f497          	auipc	s1,0xf
80002dd8:	5f448493          	addi	s1,s1,1524 # 800123c8 <itable+0x18>
80002ddc:	00011997          	auipc	s3,0x11
80002de0:	a3c98993          	addi	s3,s3,-1476 # 80013818 <devsw+0xc>
80002de4:	00004917          	auipc	s2,0x4
80002de8:	df890913          	addi	s2,s2,-520 # 80006bdc <consoleinit+0x17d2>
80002dec:	85ca                	mv	a1,s2
80002dee:	8526                	mv	a0,s1
80002df0:	c03ff0ef          	jal	800029f2 <initsleeplock>
80002df4:	06848493          	addi	s1,s1,104
80002df8:	ff349ae3          	bne	s1,s3,80002dec <iinit+0x3a>
80002dfc:	40f2                	lw	ra,28(sp)
80002dfe:	4462                	lw	s0,24(sp)
80002e00:	44d2                	lw	s1,20(sp)
80002e02:	4942                	lw	s2,16(sp)
80002e04:	49b2                	lw	s3,12(sp)
80002e06:	6105                	addi	sp,sp,32
80002e08:	8082                	ret

80002e0a <ialloc>:
80002e0a:	1101                	addi	sp,sp,-32
80002e0c:	ce06                	sw	ra,28(sp)
80002e0e:	cc22                	sw	s0,24(sp)
80002e10:	1000                	addi	s0,sp,32
80002e12:	0000f717          	auipc	a4,0xf
80002e16:	58a72703          	lw	a4,1418(a4) # 8001239c <sb+0xc>
80002e1a:	4785                	li	a5,1
80002e1c:	04e7fe63          	bgeu	a5,a4,80002e78 <ialloc+0x6e>
80002e20:	ca26                	sw	s1,20(sp)
80002e22:	c84a                	sw	s2,16(sp)
80002e24:	c64e                	sw	s3,12(sp)
80002e26:	c452                	sw	s4,8(sp)
80002e28:	c256                	sw	s5,4(sp)
80002e2a:	c05a                	sw	s6,0(sp)
80002e2c:	8aaa                	mv	s5,a0
80002e2e:	8b2e                	mv	s6,a1
80002e30:	4905                	li	s2,1
80002e32:	0000fa17          	auipc	s4,0xf
80002e36:	55ea0a13          	addi	s4,s4,1374 # 80012390 <sb>
80002e3a:	00495593          	srli	a1,s2,0x4
80002e3e:	018a2783          	lw	a5,24(s4)
80002e42:	95be                	add	a1,a1,a5
80002e44:	8556                	mv	a0,s5
80002e46:	897ff0ef          	jal	800026dc <bread>
80002e4a:	84aa                	mv	s1,a0
80002e4c:	03450993          	addi	s3,a0,52
80002e50:	00f97793          	andi	a5,s2,15
80002e54:	079a                	slli	a5,a5,0x6
80002e56:	99be                	add	s3,s3,a5
80002e58:	00099783          	lh	a5,0(s3)
80002e5c:	cb8d                	beqz	a5,80002e8e <ialloc+0x84>
80002e5e:	97bff0ef          	jal	800027d8 <brelse>
80002e62:	0905                	addi	s2,s2,1
80002e64:	00ca2783          	lw	a5,12(s4)
80002e68:	fcf969e3          	bltu	s2,a5,80002e3a <ialloc+0x30>
80002e6c:	44d2                	lw	s1,20(sp)
80002e6e:	4942                	lw	s2,16(sp)
80002e70:	49b2                	lw	s3,12(sp)
80002e72:	4a22                	lw	s4,8(sp)
80002e74:	4a92                	lw	s5,4(sp)
80002e76:	4b02                	lw	s6,0(sp)
80002e78:	00004517          	auipc	a0,0x4
80002e7c:	d6c50513          	addi	a0,a0,-660 # 80006be4 <consoleinit+0x17da>
80002e80:	807fd0ef          	jal	80000686 <printf>
80002e84:	4501                	li	a0,0
80002e86:	40f2                	lw	ra,28(sp)
80002e88:	4462                	lw	s0,24(sp)
80002e8a:	6105                	addi	sp,sp,32
80002e8c:	8082                	ret
80002e8e:	04000613          	li	a2,64
80002e92:	4581                	li	a1,0
80002e94:	854e                	mv	a0,s3
80002e96:	2fc010ef          	jal	80004192 <memset>
80002e9a:	01699023          	sh	s6,0(s3)
80002e9e:	8526                	mv	a0,s1
80002ea0:	230010ef          	jal	800040d0 <log_write>
80002ea4:	8526                	mv	a0,s1
80002ea6:	933ff0ef          	jal	800027d8 <brelse>
80002eaa:	85ca                	mv	a1,s2
80002eac:	8556                	mv	a0,s5
80002eae:	3da1                	jal	80002d06 <iget>
80002eb0:	44d2                	lw	s1,20(sp)
80002eb2:	4942                	lw	s2,16(sp)
80002eb4:	49b2                	lw	s3,12(sp)
80002eb6:	4a22                	lw	s4,8(sp)
80002eb8:	4a92                	lw	s5,4(sp)
80002eba:	4b02                	lw	s6,0(sp)
80002ebc:	b7e9                	j	80002e86 <ialloc+0x7c>

80002ebe <iupdate>:
80002ebe:	1141                	addi	sp,sp,-16
80002ec0:	c606                	sw	ra,12(sp)
80002ec2:	c422                	sw	s0,8(sp)
80002ec4:	c226                	sw	s1,4(sp)
80002ec6:	c04a                	sw	s2,0(sp)
80002ec8:	0800                	addi	s0,sp,16
80002eca:	84aa                	mv	s1,a0
80002ecc:	415c                	lw	a5,4(a0)
80002ece:	8391                	srli	a5,a5,0x4
80002ed0:	0000f597          	auipc	a1,0xf
80002ed4:	4d85a583          	lw	a1,1240(a1) # 800123a8 <sb+0x18>
80002ed8:	95be                	add	a1,a1,a5
80002eda:	4108                	lw	a0,0(a0)
80002edc:	801ff0ef          	jal	800026dc <bread>
80002ee0:	892a                	mv	s2,a0
80002ee2:	03450793          	addi	a5,a0,52
80002ee6:	40d8                	lw	a4,4(s1)
80002ee8:	8b3d                	andi	a4,a4,15
80002eea:	071a                	slli	a4,a4,0x6
80002eec:	97ba                	add	a5,a5,a4
80002eee:	02849703          	lh	a4,40(s1)
80002ef2:	00e79023          	sh	a4,0(a5)
80002ef6:	02a49703          	lh	a4,42(s1)
80002efa:	00e79123          	sh	a4,2(a5)
80002efe:	02c49703          	lh	a4,44(s1)
80002f02:	00e79223          	sh	a4,4(a5)
80002f06:	02e49703          	lh	a4,46(s1)
80002f0a:	00e79323          	sh	a4,6(a5)
80002f0e:	5898                	lw	a4,48(s1)
80002f10:	c798                	sw	a4,8(a5)
80002f12:	03400613          	li	a2,52
80002f16:	03448593          	addi	a1,s1,52
80002f1a:	00c78513          	addi	a0,a5,12
80002f1e:	2c0010ef          	jal	800041de <memmove>
80002f22:	854a                	mv	a0,s2
80002f24:	1ac010ef          	jal	800040d0 <log_write>
80002f28:	854a                	mv	a0,s2
80002f2a:	8afff0ef          	jal	800027d8 <brelse>
80002f2e:	40b2                	lw	ra,12(sp)
80002f30:	4422                	lw	s0,8(sp)
80002f32:	4492                	lw	s1,4(sp)
80002f34:	4902                	lw	s2,0(sp)
80002f36:	0141                	addi	sp,sp,16
80002f38:	8082                	ret

80002f3a <idup>:
80002f3a:	1141                	addi	sp,sp,-16
80002f3c:	c606                	sw	ra,12(sp)
80002f3e:	c422                	sw	s0,8(sp)
80002f40:	c226                	sw	s1,4(sp)
80002f42:	0800                	addi	s0,sp,16
80002f44:	84aa                	mv	s1,a0
80002f46:	0000f517          	auipc	a0,0xf
80002f4a:	46a50513          	addi	a0,a0,1130 # 800123b0 <itable>
80002f4e:	9e7ff0ef          	jal	80002934 <acquire>
80002f52:	449c                	lw	a5,8(s1)
80002f54:	0785                	addi	a5,a5,1
80002f56:	c49c                	sw	a5,8(s1)
80002f58:	0000f517          	auipc	a0,0xf
80002f5c:	45850513          	addi	a0,a0,1112 # 800123b0 <itable>
80002f60:	a5fff0ef          	jal	800029be <release>
80002f64:	8526                	mv	a0,s1
80002f66:	40b2                	lw	ra,12(sp)
80002f68:	4422                	lw	s0,8(sp)
80002f6a:	4492                	lw	s1,4(sp)
80002f6c:	0141                	addi	sp,sp,16
80002f6e:	8082                	ret

80002f70 <ilock>:
80002f70:	1141                	addi	sp,sp,-16
80002f72:	c606                	sw	ra,12(sp)
80002f74:	c422                	sw	s0,8(sp)
80002f76:	c226                	sw	s1,4(sp)
80002f78:	0800                	addi	s0,sp,16
80002f7a:	cd19                	beqz	a0,80002f98 <ilock+0x28>
80002f7c:	84aa                	mv	s1,a0
80002f7e:	451c                	lw	a5,8(a0)
80002f80:	00f05c63          	blez	a5,80002f98 <ilock+0x28>
80002f84:	0531                	addi	a0,a0,12
80002f86:	aa1ff0ef          	jal	80002a26 <acquiresleep>
80002f8a:	50dc                	lw	a5,36(s1)
80002f8c:	cf89                	beqz	a5,80002fa6 <ilock+0x36>
80002f8e:	40b2                	lw	ra,12(sp)
80002f90:	4422                	lw	s0,8(sp)
80002f92:	4492                	lw	s1,4(sp)
80002f94:	0141                	addi	sp,sp,16
80002f96:	8082                	ret
80002f98:	c04a                	sw	s2,0(sp)
80002f9a:	00004517          	auipc	a0,0x4
80002f9e:	c5e50513          	addi	a0,a0,-930 # 80006bf8 <consoleinit+0x17ee>
80002fa2:	887fd0ef          	jal	80000828 <panic>
80002fa6:	c04a                	sw	s2,0(sp)
80002fa8:	40dc                	lw	a5,4(s1)
80002faa:	8391                	srli	a5,a5,0x4
80002fac:	0000f597          	auipc	a1,0xf
80002fb0:	3fc5a583          	lw	a1,1020(a1) # 800123a8 <sb+0x18>
80002fb4:	95be                	add	a1,a1,a5
80002fb6:	4088                	lw	a0,0(s1)
80002fb8:	f24ff0ef          	jal	800026dc <bread>
80002fbc:	892a                	mv	s2,a0
80002fbe:	03450593          	addi	a1,a0,52
80002fc2:	40dc                	lw	a5,4(s1)
80002fc4:	8bbd                	andi	a5,a5,15
80002fc6:	079a                	slli	a5,a5,0x6
80002fc8:	95be                	add	a1,a1,a5
80002fca:	00059783          	lh	a5,0(a1)
80002fce:	02f49423          	sh	a5,40(s1)
80002fd2:	00259783          	lh	a5,2(a1)
80002fd6:	02f49523          	sh	a5,42(s1)
80002fda:	00459783          	lh	a5,4(a1)
80002fde:	02f49623          	sh	a5,44(s1)
80002fe2:	00659783          	lh	a5,6(a1)
80002fe6:	02f49723          	sh	a5,46(s1)
80002fea:	459c                	lw	a5,8(a1)
80002fec:	d89c                	sw	a5,48(s1)
80002fee:	03400613          	li	a2,52
80002ff2:	05b1                	addi	a1,a1,12
80002ff4:	03448513          	addi	a0,s1,52
80002ff8:	1e6010ef          	jal	800041de <memmove>
80002ffc:	854a                	mv	a0,s2
80002ffe:	fdaff0ef          	jal	800027d8 <brelse>
80003002:	4785                	li	a5,1
80003004:	d0dc                	sw	a5,36(s1)
80003006:	02849783          	lh	a5,40(s1)
8000300a:	c399                	beqz	a5,80003010 <ilock+0xa0>
8000300c:	4902                	lw	s2,0(sp)
8000300e:	b741                	j	80002f8e <ilock+0x1e>
80003010:	00004517          	auipc	a0,0x4
80003014:	bf050513          	addi	a0,a0,-1040 # 80006c00 <consoleinit+0x17f6>
80003018:	811fd0ef          	jal	80000828 <panic>

8000301c <iunlock>:
8000301c:	1141                	addi	sp,sp,-16
8000301e:	c606                	sw	ra,12(sp)
80003020:	c422                	sw	s0,8(sp)
80003022:	c226                	sw	s1,4(sp)
80003024:	c04a                	sw	s2,0(sp)
80003026:	0800                	addi	s0,sp,16
80003028:	c505                	beqz	a0,80003050 <iunlock+0x34>
8000302a:	84aa                	mv	s1,a0
8000302c:	00c50913          	addi	s2,a0,12
80003030:	854a                	mv	a0,s2
80003032:	a6bff0ef          	jal	80002a9c <holdingsleep>
80003036:	cd09                	beqz	a0,80003050 <iunlock+0x34>
80003038:	449c                	lw	a5,8(s1)
8000303a:	00f05b63          	blez	a5,80003050 <iunlock+0x34>
8000303e:	854a                	mv	a0,s2
80003040:	a29ff0ef          	jal	80002a68 <releasesleep>
80003044:	40b2                	lw	ra,12(sp)
80003046:	4422                	lw	s0,8(sp)
80003048:	4492                	lw	s1,4(sp)
8000304a:	4902                	lw	s2,0(sp)
8000304c:	0141                	addi	sp,sp,16
8000304e:	8082                	ret
80003050:	00004517          	auipc	a0,0x4
80003054:	bc050513          	addi	a0,a0,-1088 # 80006c10 <consoleinit+0x1806>
80003058:	fd0fd0ef          	jal	80000828 <panic>

8000305c <itrunc>:
8000305c:	1101                	addi	sp,sp,-32
8000305e:	ce06                	sw	ra,28(sp)
80003060:	cc22                	sw	s0,24(sp)
80003062:	ca26                	sw	s1,20(sp)
80003064:	c84a                	sw	s2,16(sp)
80003066:	c64e                	sw	s3,12(sp)
80003068:	1000                	addi	s0,sp,32
8000306a:	89aa                	mv	s3,a0
8000306c:	03450493          	addi	s1,a0,52
80003070:	06450913          	addi	s2,a0,100
80003074:	a021                	j	8000307c <itrunc+0x20>
80003076:	0491                	addi	s1,s1,4
80003078:	01248a63          	beq	s1,s2,8000308c <itrunc+0x30>
8000307c:	408c                	lw	a1,0(s1)
8000307e:	dde5                	beqz	a1,80003076 <itrunc+0x1a>
80003080:	0009a503          	lw	a0,0(s3)
80003084:	3cb9                	jal	80002ae2 <bfree>
80003086:	0004a023          	sw	zero,0(s1)
8000308a:	b7f5                	j	80003076 <itrunc+0x1a>
8000308c:	0649a583          	lw	a1,100(s3)
80003090:	ed81                	bnez	a1,800030a8 <itrunc+0x4c>
80003092:	0209a823          	sw	zero,48(s3)
80003096:	854e                	mv	a0,s3
80003098:	351d                	jal	80002ebe <iupdate>
8000309a:	40f2                	lw	ra,28(sp)
8000309c:	4462                	lw	s0,24(sp)
8000309e:	44d2                	lw	s1,20(sp)
800030a0:	4942                	lw	s2,16(sp)
800030a2:	49b2                	lw	s3,12(sp)
800030a4:	6105                	addi	sp,sp,32
800030a6:	8082                	ret
800030a8:	c452                	sw	s4,8(sp)
800030aa:	0009a503          	lw	a0,0(s3)
800030ae:	e2eff0ef          	jal	800026dc <bread>
800030b2:	8a2a                	mv	s4,a0
800030b4:	03450493          	addi	s1,a0,52
800030b8:	43450913          	addi	s2,a0,1076
800030bc:	a021                	j	800030c4 <itrunc+0x68>
800030be:	0491                	addi	s1,s1,4
800030c0:	01248863          	beq	s1,s2,800030d0 <itrunc+0x74>
800030c4:	408c                	lw	a1,0(s1)
800030c6:	dde5                	beqz	a1,800030be <itrunc+0x62>
800030c8:	0009a503          	lw	a0,0(s3)
800030cc:	3c19                	jal	80002ae2 <bfree>
800030ce:	bfc5                	j	800030be <itrunc+0x62>
800030d0:	8552                	mv	a0,s4
800030d2:	f06ff0ef          	jal	800027d8 <brelse>
800030d6:	0649a583          	lw	a1,100(s3)
800030da:	0009a503          	lw	a0,0(s3)
800030de:	3411                	jal	80002ae2 <bfree>
800030e0:	0609a223          	sw	zero,100(s3)
800030e4:	4a22                	lw	s4,8(sp)
800030e6:	b775                	j	80003092 <itrunc+0x36>

800030e8 <iput>:
800030e8:	1141                	addi	sp,sp,-16
800030ea:	c606                	sw	ra,12(sp)
800030ec:	c422                	sw	s0,8(sp)
800030ee:	c226                	sw	s1,4(sp)
800030f0:	0800                	addi	s0,sp,16
800030f2:	84aa                	mv	s1,a0
800030f4:	0000f517          	auipc	a0,0xf
800030f8:	2bc50513          	addi	a0,a0,700 # 800123b0 <itable>
800030fc:	839ff0ef          	jal	80002934 <acquire>
80003100:	4498                	lw	a4,8(s1)
80003102:	4785                	li	a5,1
80003104:	02f70063          	beq	a4,a5,80003124 <iput+0x3c>
80003108:	449c                	lw	a5,8(s1)
8000310a:	17fd                	addi	a5,a5,-1
8000310c:	c49c                	sw	a5,8(s1)
8000310e:	0000f517          	auipc	a0,0xf
80003112:	2a250513          	addi	a0,a0,674 # 800123b0 <itable>
80003116:	8a9ff0ef          	jal	800029be <release>
8000311a:	40b2                	lw	ra,12(sp)
8000311c:	4422                	lw	s0,8(sp)
8000311e:	4492                	lw	s1,4(sp)
80003120:	0141                	addi	sp,sp,16
80003122:	8082                	ret
80003124:	50dc                	lw	a5,36(s1)
80003126:	d3ed                	beqz	a5,80003108 <iput+0x20>
80003128:	02e49783          	lh	a5,46(s1)
8000312c:	fff1                	bnez	a5,80003108 <iput+0x20>
8000312e:	c04a                	sw	s2,0(sp)
80003130:	00c48913          	addi	s2,s1,12
80003134:	854a                	mv	a0,s2
80003136:	8f1ff0ef          	jal	80002a26 <acquiresleep>
8000313a:	0000f517          	auipc	a0,0xf
8000313e:	27650513          	addi	a0,a0,630 # 800123b0 <itable>
80003142:	87dff0ef          	jal	800029be <release>
80003146:	8526                	mv	a0,s1
80003148:	3f11                	jal	8000305c <itrunc>
8000314a:	02049423          	sh	zero,40(s1)
8000314e:	8526                	mv	a0,s1
80003150:	33bd                	jal	80002ebe <iupdate>
80003152:	0204a223          	sw	zero,36(s1)
80003156:	854a                	mv	a0,s2
80003158:	911ff0ef          	jal	80002a68 <releasesleep>
8000315c:	0000f517          	auipc	a0,0xf
80003160:	25450513          	addi	a0,a0,596 # 800123b0 <itable>
80003164:	fd0ff0ef          	jal	80002934 <acquire>
80003168:	4902                	lw	s2,0(sp)
8000316a:	bf79                	j	80003108 <iput+0x20>

8000316c <iunlockput>:
8000316c:	1141                	addi	sp,sp,-16
8000316e:	c606                	sw	ra,12(sp)
80003170:	c422                	sw	s0,8(sp)
80003172:	c226                	sw	s1,4(sp)
80003174:	0800                	addi	s0,sp,16
80003176:	84aa                	mv	s1,a0
80003178:	3555                	jal	8000301c <iunlock>
8000317a:	8526                	mv	a0,s1
8000317c:	37b5                	jal	800030e8 <iput>
8000317e:	40b2                	lw	ra,12(sp)
80003180:	4422                	lw	s0,8(sp)
80003182:	4492                	lw	s1,4(sp)
80003184:	0141                	addi	sp,sp,16
80003186:	8082                	ret

80003188 <ireclaim>:
80003188:	0000f717          	auipc	a4,0xf
8000318c:	21472703          	lw	a4,532(a4) # 8001239c <sb+0xc>
80003190:	4785                	li	a5,1
80003192:	0ae7f663          	bgeu	a5,a4,8000323e <ireclaim+0xb6>
80003196:	1101                	addi	sp,sp,-32
80003198:	ce06                	sw	ra,28(sp)
8000319a:	cc22                	sw	s0,24(sp)
8000319c:	ca26                	sw	s1,20(sp)
8000319e:	c84a                	sw	s2,16(sp)
800031a0:	c64e                	sw	s3,12(sp)
800031a2:	c452                	sw	s4,8(sp)
800031a4:	c256                	sw	s5,4(sp)
800031a6:	c05a                	sw	s6,0(sp)
800031a8:	1000                	addi	s0,sp,32
800031aa:	8a2a                	mv	s4,a0
800031ac:	4485                	li	s1,1
800031ae:	0000f997          	auipc	s3,0xf
800031b2:	1e298993          	addi	s3,s3,482 # 80012390 <sb>
800031b6:	00004b17          	auipc	s6,0x4
800031ba:	a62b0b13          	addi	s6,s6,-1438 # 80006c18 <consoleinit+0x180e>
800031be:	a82d                	j	800031f8 <ireclaim+0x70>
800031c0:	85a6                	mv	a1,s1
800031c2:	855a                	mv	a0,s6
800031c4:	cc2fd0ef          	jal	80000686 <printf>
800031c8:	85a6                	mv	a1,s1
800031ca:	8552                	mv	a0,s4
800031cc:	3e2d                	jal	80002d06 <iget>
800031ce:	8aaa                	mv	s5,a0
800031d0:	854a                	mv	a0,s2
800031d2:	e06ff0ef          	jal	800027d8 <brelse>
800031d6:	000a8c63          	beqz	s5,800031ee <ireclaim+0x66>
800031da:	57b000ef          	jal	80003f54 <begin_op>
800031de:	8556                	mv	a0,s5
800031e0:	3b41                	jal	80002f70 <ilock>
800031e2:	8556                	mv	a0,s5
800031e4:	3d25                	jal	8000301c <iunlock>
800031e6:	8556                	mv	a0,s5
800031e8:	3701                	jal	800030e8 <iput>
800031ea:	5d3000ef          	jal	80003fbc <end_op>
800031ee:	0485                	addi	s1,s1,1
800031f0:	00c9a783          	lw	a5,12(s3)
800031f4:	02f4fb63          	bgeu	s1,a5,8000322a <ireclaim+0xa2>
800031f8:	0044d593          	srli	a1,s1,0x4
800031fc:	0189a783          	lw	a5,24(s3)
80003200:	95be                	add	a1,a1,a5
80003202:	8552                	mv	a0,s4
80003204:	cd8ff0ef          	jal	800026dc <bread>
80003208:	892a                	mv	s2,a0
8000320a:	03450793          	addi	a5,a0,52
8000320e:	00f4f713          	andi	a4,s1,15
80003212:	071a                	slli	a4,a4,0x6
80003214:	97ba                	add	a5,a5,a4
80003216:	00079703          	lh	a4,0(a5)
8000321a:	c701                	beqz	a4,80003222 <ireclaim+0x9a>
8000321c:	00679783          	lh	a5,6(a5)
80003220:	d3c5                	beqz	a5,800031c0 <ireclaim+0x38>
80003222:	854a                	mv	a0,s2
80003224:	db4ff0ef          	jal	800027d8 <brelse>
80003228:	b7d9                	j	800031ee <ireclaim+0x66>
8000322a:	40f2                	lw	ra,28(sp)
8000322c:	4462                	lw	s0,24(sp)
8000322e:	44d2                	lw	s1,20(sp)
80003230:	4942                	lw	s2,16(sp)
80003232:	49b2                	lw	s3,12(sp)
80003234:	4a22                	lw	s4,8(sp)
80003236:	4a92                	lw	s5,4(sp)
80003238:	4b02                	lw	s6,0(sp)
8000323a:	6105                	addi	sp,sp,32
8000323c:	8082                	ret
8000323e:	8082                	ret

80003240 <fsinit>:
80003240:	1101                	addi	sp,sp,-32
80003242:	ce06                	sw	ra,28(sp)
80003244:	cc22                	sw	s0,24(sp)
80003246:	ca26                	sw	s1,20(sp)
80003248:	c84a                	sw	s2,16(sp)
8000324a:	c64e                	sw	s3,12(sp)
8000324c:	1000                	addi	s0,sp,32
8000324e:	892a                	mv	s2,a0
80003250:	4585                	li	a1,1
80003252:	c8aff0ef          	jal	800026dc <bread>
80003256:	84aa                	mv	s1,a0
80003258:	0000f997          	auipc	s3,0xf
8000325c:	13898993          	addi	s3,s3,312 # 80012390 <sb>
80003260:	02000613          	li	a2,32
80003264:	03450593          	addi	a1,a0,52
80003268:	854e                	mv	a0,s3
8000326a:	775000ef          	jal	800041de <memmove>
8000326e:	8526                	mv	a0,s1
80003270:	d68ff0ef          	jal	800027d8 <brelse>
80003274:	0009a703          	lw	a4,0(s3)
80003278:	102037b7          	lui	a5,0x10203
8000327c:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
80003280:	02f71263          	bne	a4,a5,800032a4 <fsinit+0x64>
80003284:	0000f597          	auipc	a1,0xf
80003288:	10c58593          	addi	a1,a1,268 # 80012390 <sb>
8000328c:	854a                	mv	a0,s2
8000328e:	44d000ef          	jal	80003eda <initlog>
80003292:	854a                	mv	a0,s2
80003294:	3dd5                	jal	80003188 <ireclaim>
80003296:	40f2                	lw	ra,28(sp)
80003298:	4462                	lw	s0,24(sp)
8000329a:	44d2                	lw	s1,20(sp)
8000329c:	4942                	lw	s2,16(sp)
8000329e:	49b2                	lw	s3,12(sp)
800032a0:	6105                	addi	sp,sp,32
800032a2:	8082                	ret
800032a4:	00004517          	auipc	a0,0x4
800032a8:	99450513          	addi	a0,a0,-1644 # 80006c38 <consoleinit+0x182e>
800032ac:	d7cfd0ef          	jal	80000828 <panic>

800032b0 <stati>:
800032b0:	1141                	addi	sp,sp,-16
800032b2:	c622                	sw	s0,12(sp)
800032b4:	0800                	addi	s0,sp,16
800032b6:	411c                	lw	a5,0(a0)
800032b8:	c19c                	sw	a5,0(a1)
800032ba:	415c                	lw	a5,4(a0)
800032bc:	c1dc                	sw	a5,4(a1)
800032be:	02851783          	lh	a5,40(a0)
800032c2:	00f59423          	sh	a5,8(a1)
800032c6:	02e51783          	lh	a5,46(a0)
800032ca:	00f59523          	sh	a5,10(a1)
800032ce:	591c                	lw	a5,48(a0)
800032d0:	c5dc                	sw	a5,12(a1)
800032d2:	4432                	lw	s0,12(sp)
800032d4:	0141                	addi	sp,sp,16
800032d6:	8082                	ret

800032d8 <readi>:
800032d8:	591c                	lw	a5,48(a0)
800032da:	0cd7eb63          	bltu	a5,a3,800033b0 <readi+0xd8>
800032de:	7179                	addi	sp,sp,-48
800032e0:	d606                	sw	ra,44(sp)
800032e2:	d422                	sw	s0,40(sp)
800032e4:	d04a                	sw	s2,32(sp)
800032e6:	cc52                	sw	s4,24(sp)
800032e8:	ca56                	sw	s5,20(sp)
800032ea:	c85a                	sw	s6,16(sp)
800032ec:	c65e                	sw	s7,12(sp)
800032ee:	1800                	addi	s0,sp,48
800032f0:	8b2a                	mv	s6,a0
800032f2:	8bae                	mv	s7,a1
800032f4:	8a32                	mv	s4,a2
800032f6:	8936                	mv	s2,a3
800032f8:	8aba                	mv	s5,a4
800032fa:	9736                	add	a4,a4,a3
800032fc:	4501                	li	a0,0
800032fe:	0ad76063          	bltu	a4,a3,8000339e <readi+0xc6>
80003302:	ce4e                	sw	s3,28(sp)
80003304:	00e7f463          	bgeu	a5,a4,8000330c <readi+0x34>
80003308:	40d78ab3          	sub	s5,a5,a3
8000330c:	080a8163          	beqz	s5,8000338e <readi+0xb6>
80003310:	d226                	sw	s1,36(sp)
80003312:	c462                	sw	s8,8(sp)
80003314:	c266                	sw	s9,4(sp)
80003316:	c06a                	sw	s10,0(sp)
80003318:	4981                	li	s3,0
8000331a:	40000c93          	li	s9,1024
8000331e:	5c7d                	li	s8,-1
80003320:	a01d                	j	80003346 <readi+0x6e>
80003322:	034d0613          	addi	a2,s10,52
80003326:	86a6                	mv	a3,s1
80003328:	963e                	add	a2,a2,a5
8000332a:	85d2                	mv	a1,s4
8000332c:	855e                	mv	a0,s7
8000332e:	e62fd0ef          	jal	80000990 <either_copyout>
80003332:	05850063          	beq	a0,s8,80003372 <readi+0x9a>
80003336:	856a                	mv	a0,s10
80003338:	ca0ff0ef          	jal	800027d8 <brelse>
8000333c:	99a6                	add	s3,s3,s1
8000333e:	9926                	add	s2,s2,s1
80003340:	9a26                	add	s4,s4,s1
80003342:	0559f163          	bgeu	s3,s5,80003384 <readi+0xac>
80003346:	00a95593          	srli	a1,s2,0xa
8000334a:	855a                	mv	a0,s6
8000334c:	90bff0ef          	jal	80002c56 <bmap>
80003350:	85aa                	mv	a1,a0
80003352:	c121                	beqz	a0,80003392 <readi+0xba>
80003354:	000b2503          	lw	a0,0(s6)
80003358:	b84ff0ef          	jal	800026dc <bread>
8000335c:	8d2a                	mv	s10,a0
8000335e:	3ff97793          	andi	a5,s2,1023
80003362:	413a8733          	sub	a4,s5,s3
80003366:	40fc84b3          	sub	s1,s9,a5
8000336a:	fa977ce3          	bgeu	a4,s1,80003322 <readi+0x4a>
8000336e:	84ba                	mv	s1,a4
80003370:	bf4d                	j	80003322 <readi+0x4a>
80003372:	856a                	mv	a0,s10
80003374:	c64ff0ef          	jal	800027d8 <brelse>
80003378:	59fd                	li	s3,-1
8000337a:	5492                	lw	s1,36(sp)
8000337c:	4c22                	lw	s8,8(sp)
8000337e:	4c92                	lw	s9,4(sp)
80003380:	4d02                	lw	s10,0(sp)
80003382:	a821                	j	8000339a <readi+0xc2>
80003384:	5492                	lw	s1,36(sp)
80003386:	4c22                	lw	s8,8(sp)
80003388:	4c92                	lw	s9,4(sp)
8000338a:	4d02                	lw	s10,0(sp)
8000338c:	a039                	j	8000339a <readi+0xc2>
8000338e:	89d6                	mv	s3,s5
80003390:	a029                	j	8000339a <readi+0xc2>
80003392:	5492                	lw	s1,36(sp)
80003394:	4c22                	lw	s8,8(sp)
80003396:	4c92                	lw	s9,4(sp)
80003398:	4d02                	lw	s10,0(sp)
8000339a:	854e                	mv	a0,s3
8000339c:	49f2                	lw	s3,28(sp)
8000339e:	50b2                	lw	ra,44(sp)
800033a0:	5422                	lw	s0,40(sp)
800033a2:	5902                	lw	s2,32(sp)
800033a4:	4a62                	lw	s4,24(sp)
800033a6:	4ad2                	lw	s5,20(sp)
800033a8:	4b42                	lw	s6,16(sp)
800033aa:	4bb2                	lw	s7,12(sp)
800033ac:	6145                	addi	sp,sp,48
800033ae:	8082                	ret
800033b0:	4501                	li	a0,0
800033b2:	8082                	ret

800033b4 <writei>:
800033b4:	591c                	lw	a5,48(a0)
800033b6:	0ed7e063          	bltu	a5,a3,80003496 <writei+0xe2>
800033ba:	7179                	addi	sp,sp,-48
800033bc:	d606                	sw	ra,44(sp)
800033be:	d422                	sw	s0,40(sp)
800033c0:	ce4e                	sw	s3,28(sp)
800033c2:	ca56                	sw	s5,20(sp)
800033c4:	c85a                	sw	s6,16(sp)
800033c6:	c65e                	sw	s7,12(sp)
800033c8:	c462                	sw	s8,8(sp)
800033ca:	1800                	addi	s0,sp,48
800033cc:	8b2a                	mv	s6,a0
800033ce:	8c2e                	mv	s8,a1
800033d0:	8ab2                	mv	s5,a2
800033d2:	89b6                	mv	s3,a3
800033d4:	8bba                	mv	s7,a4
800033d6:	00e687b3          	add	a5,a3,a4
800033da:	0cd7e063          	bltu	a5,a3,8000349a <writei+0xe6>
800033de:	00043737          	lui	a4,0x43
800033e2:	0af76e63          	bltu	a4,a5,8000349e <writei+0xea>
800033e6:	cc52                	sw	s4,24(sp)
800033e8:	0a0b8063          	beqz	s7,80003488 <writei+0xd4>
800033ec:	d226                	sw	s1,36(sp)
800033ee:	d04a                	sw	s2,32(sp)
800033f0:	c266                	sw	s9,4(sp)
800033f2:	c06a                	sw	s10,0(sp)
800033f4:	4a01                	li	s4,0
800033f6:	40000d13          	li	s10,1024
800033fa:	5cfd                	li	s9,-1
800033fc:	a035                	j	80003428 <writei+0x74>
800033fe:	03490513          	addi	a0,s2,52
80003402:	86a6                	mv	a3,s1
80003404:	8656                	mv	a2,s5
80003406:	85e2                	mv	a1,s8
80003408:	953e                	add	a0,a0,a5
8000340a:	955fd0ef          	jal	80000d5e <either_copyin>
8000340e:	05950363          	beq	a0,s9,80003454 <writei+0xa0>
80003412:	854a                	mv	a0,s2
80003414:	4bd000ef          	jal	800040d0 <log_write>
80003418:	854a                	mv	a0,s2
8000341a:	bbeff0ef          	jal	800027d8 <brelse>
8000341e:	9a26                	add	s4,s4,s1
80003420:	99a6                	add	s3,s3,s1
80003422:	9aa6                	add	s5,s5,s1
80003424:	037a7b63          	bgeu	s4,s7,8000345a <writei+0xa6>
80003428:	00a9d593          	srli	a1,s3,0xa
8000342c:	855a                	mv	a0,s6
8000342e:	829ff0ef          	jal	80002c56 <bmap>
80003432:	85aa                	mv	a1,a0
80003434:	c11d                	beqz	a0,8000345a <writei+0xa6>
80003436:	000b2503          	lw	a0,0(s6)
8000343a:	aa2ff0ef          	jal	800026dc <bread>
8000343e:	892a                	mv	s2,a0
80003440:	3ff9f793          	andi	a5,s3,1023
80003444:	414b8733          	sub	a4,s7,s4
80003448:	40fd04b3          	sub	s1,s10,a5
8000344c:	fa9779e3          	bgeu	a4,s1,800033fe <writei+0x4a>
80003450:	84ba                	mv	s1,a4
80003452:	b775                	j	800033fe <writei+0x4a>
80003454:	854a                	mv	a0,s2
80003456:	b82ff0ef          	jal	800027d8 <brelse>
8000345a:	030b2783          	lw	a5,48(s6)
8000345e:	0337f763          	bgeu	a5,s3,8000348c <writei+0xd8>
80003462:	033b2823          	sw	s3,48(s6)
80003466:	5492                	lw	s1,36(sp)
80003468:	5902                	lw	s2,32(sp)
8000346a:	4c92                	lw	s9,4(sp)
8000346c:	4d02                	lw	s10,0(sp)
8000346e:	855a                	mv	a0,s6
80003470:	34b9                	jal	80002ebe <iupdate>
80003472:	8552                	mv	a0,s4
80003474:	4a62                	lw	s4,24(sp)
80003476:	50b2                	lw	ra,44(sp)
80003478:	5422                	lw	s0,40(sp)
8000347a:	49f2                	lw	s3,28(sp)
8000347c:	4ad2                	lw	s5,20(sp)
8000347e:	4b42                	lw	s6,16(sp)
80003480:	4bb2                	lw	s7,12(sp)
80003482:	4c22                	lw	s8,8(sp)
80003484:	6145                	addi	sp,sp,48
80003486:	8082                	ret
80003488:	8a5e                	mv	s4,s7
8000348a:	b7d5                	j	8000346e <writei+0xba>
8000348c:	5492                	lw	s1,36(sp)
8000348e:	5902                	lw	s2,32(sp)
80003490:	4c92                	lw	s9,4(sp)
80003492:	4d02                	lw	s10,0(sp)
80003494:	bfe9                	j	8000346e <writei+0xba>
80003496:	557d                	li	a0,-1
80003498:	8082                	ret
8000349a:	557d                	li	a0,-1
8000349c:	bfe9                	j	80003476 <writei+0xc2>
8000349e:	557d                	li	a0,-1
800034a0:	bfd9                	j	80003476 <writei+0xc2>

800034a2 <namecmp>:
800034a2:	1141                	addi	sp,sp,-16
800034a4:	c606                	sw	ra,12(sp)
800034a6:	c422                	sw	s0,8(sp)
800034a8:	0800                	addi	s0,sp,16
800034aa:	4639                	li	a2,14
800034ac:	587000ef          	jal	80004232 <strncmp>
800034b0:	40b2                	lw	ra,12(sp)
800034b2:	4422                	lw	s0,8(sp)
800034b4:	0141                	addi	sp,sp,16
800034b6:	8082                	ret

800034b8 <dirlookup>:
800034b8:	7179                	addi	sp,sp,-48
800034ba:	d606                	sw	ra,44(sp)
800034bc:	d422                	sw	s0,40(sp)
800034be:	d226                	sw	s1,36(sp)
800034c0:	d04a                	sw	s2,32(sp)
800034c2:	ce4e                	sw	s3,28(sp)
800034c4:	cc52                	sw	s4,24(sp)
800034c6:	1800                	addi	s0,sp,48
800034c8:	02851703          	lh	a4,40(a0)
800034cc:	4785                	li	a5,1
800034ce:	00f71a63          	bne	a4,a5,800034e2 <dirlookup+0x2a>
800034d2:	892a                	mv	s2,a0
800034d4:	89ae                	mv	s3,a1
800034d6:	8a32                	mv	s4,a2
800034d8:	591c                	lw	a5,48(a0)
800034da:	4481                	li	s1,0
800034dc:	4501                	li	a0,0
800034de:	e39d                	bnez	a5,80003504 <dirlookup+0x4c>
800034e0:	a085                	j	80003540 <dirlookup+0x88>
800034e2:	00003517          	auipc	a0,0x3
800034e6:	76a50513          	addi	a0,a0,1898 # 80006c4c <consoleinit+0x1842>
800034ea:	b3efd0ef          	jal	80000828 <panic>
800034ee:	00003517          	auipc	a0,0x3
800034f2:	77250513          	addi	a0,a0,1906 # 80006c60 <consoleinit+0x1856>
800034f6:	b32fd0ef          	jal	80000828 <panic>
800034fa:	04c1                	addi	s1,s1,16
800034fc:	03092783          	lw	a5,48(s2)
80003500:	02f4ff63          	bgeu	s1,a5,8000353e <dirlookup+0x86>
80003504:	4741                	li	a4,16
80003506:	86a6                	mv	a3,s1
80003508:	fd040613          	addi	a2,s0,-48
8000350c:	4581                	li	a1,0
8000350e:	854a                	mv	a0,s2
80003510:	33e1                	jal	800032d8 <readi>
80003512:	47c1                	li	a5,16
80003514:	fcf51de3          	bne	a0,a5,800034ee <dirlookup+0x36>
80003518:	fd045783          	lhu	a5,-48(s0)
8000351c:	dff9                	beqz	a5,800034fa <dirlookup+0x42>
8000351e:	fd240593          	addi	a1,s0,-46
80003522:	854e                	mv	a0,s3
80003524:	3fbd                	jal	800034a2 <namecmp>
80003526:	f971                	bnez	a0,800034fa <dirlookup+0x42>
80003528:	000a0463          	beqz	s4,80003530 <dirlookup+0x78>
8000352c:	009a2023          	sw	s1,0(s4)
80003530:	fd045583          	lhu	a1,-48(s0)
80003534:	00092503          	lw	a0,0(s2)
80003538:	fceff0ef          	jal	80002d06 <iget>
8000353c:	a011                	j	80003540 <dirlookup+0x88>
8000353e:	4501                	li	a0,0
80003540:	50b2                	lw	ra,44(sp)
80003542:	5422                	lw	s0,40(sp)
80003544:	5492                	lw	s1,36(sp)
80003546:	5902                	lw	s2,32(sp)
80003548:	49f2                	lw	s3,28(sp)
8000354a:	4a62                	lw	s4,24(sp)
8000354c:	6145                	addi	sp,sp,48
8000354e:	8082                	ret

80003550 <namex>:
80003550:	7179                	addi	sp,sp,-48
80003552:	d606                	sw	ra,44(sp)
80003554:	d422                	sw	s0,40(sp)
80003556:	d226                	sw	s1,36(sp)
80003558:	d04a                	sw	s2,32(sp)
8000355a:	ce4e                	sw	s3,28(sp)
8000355c:	cc52                	sw	s4,24(sp)
8000355e:	ca56                	sw	s5,20(sp)
80003560:	c85a                	sw	s6,16(sp)
80003562:	c65e                	sw	s7,12(sp)
80003564:	c462                	sw	s8,8(sp)
80003566:	c266                	sw	s9,4(sp)
80003568:	1800                	addi	s0,sp,48
8000356a:	84aa                	mv	s1,a0
8000356c:	8b2e                	mv	s6,a1
8000356e:	8ab2                	mv	s5,a2
80003570:	00054703          	lbu	a4,0(a0)
80003574:	02f00793          	li	a5,47
80003578:	00f70d63          	beq	a4,a5,80003592 <namex+0x42>
8000357c:	e8ffc0ef          	jal	8000040a <myproc>
80003580:	0ac52503          	lw	a0,172(a0)
80003584:	3a5d                	jal	80002f3a <idup>
80003586:	8a2a                	mv	s4,a0
80003588:	02f00913          	li	s2,47
8000358c:	4c35                	li	s8,13
8000358e:	4b85                	li	s7,1
80003590:	a071                	j	8000361c <namex+0xcc>
80003592:	4585                	li	a1,1
80003594:	4505                	li	a0,1
80003596:	f70ff0ef          	jal	80002d06 <iget>
8000359a:	8a2a                	mv	s4,a0
8000359c:	b7f5                	j	80003588 <namex+0x38>
8000359e:	8552                	mv	a0,s4
800035a0:	36f1                	jal	8000316c <iunlockput>
800035a2:	4a01                	li	s4,0
800035a4:	8552                	mv	a0,s4
800035a6:	50b2                	lw	ra,44(sp)
800035a8:	5422                	lw	s0,40(sp)
800035aa:	5492                	lw	s1,36(sp)
800035ac:	5902                	lw	s2,32(sp)
800035ae:	49f2                	lw	s3,28(sp)
800035b0:	4a62                	lw	s4,24(sp)
800035b2:	4ad2                	lw	s5,20(sp)
800035b4:	4b42                	lw	s6,16(sp)
800035b6:	4bb2                	lw	s7,12(sp)
800035b8:	4c22                	lw	s8,8(sp)
800035ba:	4c92                	lw	s9,4(sp)
800035bc:	6145                	addi	sp,sp,48
800035be:	8082                	ret
800035c0:	8552                	mv	a0,s4
800035c2:	3ca9                	jal	8000301c <iunlock>
800035c4:	b7c5                	j	800035a4 <namex+0x54>
800035c6:	8552                	mv	a0,s4
800035c8:	3655                	jal	8000316c <iunlockput>
800035ca:	8a4e                	mv	s4,s3
800035cc:	bfe1                	j	800035a4 <namex+0x54>
800035ce:	40998cb3          	sub	s9,s3,s1
800035d2:	079c5c63          	bge	s8,s9,8000364a <namex+0xfa>
800035d6:	4639                	li	a2,14
800035d8:	85a6                	mv	a1,s1
800035da:	8556                	mv	a0,s5
800035dc:	403000ef          	jal	800041de <memmove>
800035e0:	84ce                	mv	s1,s3
800035e2:	0004c783          	lbu	a5,0(s1)
800035e6:	01279763          	bne	a5,s2,800035f4 <namex+0xa4>
800035ea:	0485                	addi	s1,s1,1
800035ec:	0004c783          	lbu	a5,0(s1)
800035f0:	ff278de3          	beq	a5,s2,800035ea <namex+0x9a>
800035f4:	8552                	mv	a0,s4
800035f6:	3aad                	jal	80002f70 <ilock>
800035f8:	028a1783          	lh	a5,40(s4)
800035fc:	fb7791e3          	bne	a5,s7,8000359e <namex+0x4e>
80003600:	000b0563          	beqz	s6,8000360a <namex+0xba>
80003604:	0004c783          	lbu	a5,0(s1)
80003608:	dfc5                	beqz	a5,800035c0 <namex+0x70>
8000360a:	4601                	li	a2,0
8000360c:	85d6                	mv	a1,s5
8000360e:	8552                	mv	a0,s4
80003610:	3565                	jal	800034b8 <dirlookup>
80003612:	89aa                	mv	s3,a0
80003614:	d94d                	beqz	a0,800035c6 <namex+0x76>
80003616:	8552                	mv	a0,s4
80003618:	3e91                	jal	8000316c <iunlockput>
8000361a:	8a4e                	mv	s4,s3
8000361c:	0004c783          	lbu	a5,0(s1)
80003620:	01279763          	bne	a5,s2,8000362e <namex+0xde>
80003624:	0485                	addi	s1,s1,1
80003626:	0004c783          	lbu	a5,0(s1)
8000362a:	ff278de3          	beq	a5,s2,80003624 <namex+0xd4>
8000362e:	cb85                	beqz	a5,8000365e <namex+0x10e>
80003630:	0004c783          	lbu	a5,0(s1)
80003634:	89a6                	mv	s3,s1
80003636:	4c81                	li	s9,0
80003638:	01278963          	beq	a5,s2,8000364a <namex+0xfa>
8000363c:	dbc9                	beqz	a5,800035ce <namex+0x7e>
8000363e:	0985                	addi	s3,s3,1
80003640:	0009c783          	lbu	a5,0(s3)
80003644:	ff279ce3          	bne	a5,s2,8000363c <namex+0xec>
80003648:	b759                	j	800035ce <namex+0x7e>
8000364a:	8666                	mv	a2,s9
8000364c:	85a6                	mv	a1,s1
8000364e:	8556                	mv	a0,s5
80003650:	38f000ef          	jal	800041de <memmove>
80003654:	9cd6                	add	s9,s9,s5
80003656:	000c8023          	sb	zero,0(s9)
8000365a:	84ce                	mv	s1,s3
8000365c:	b759                	j	800035e2 <namex+0x92>
8000365e:	f40b03e3          	beqz	s6,800035a4 <namex+0x54>
80003662:	8552                	mv	a0,s4
80003664:	3451                	jal	800030e8 <iput>
80003666:	4a01                	li	s4,0
80003668:	bf35                	j	800035a4 <namex+0x54>

8000366a <dirlink>:
8000366a:	7179                	addi	sp,sp,-48
8000366c:	d606                	sw	ra,44(sp)
8000366e:	d422                	sw	s0,40(sp)
80003670:	d04a                	sw	s2,32(sp)
80003672:	ce4e                	sw	s3,28(sp)
80003674:	cc52                	sw	s4,24(sp)
80003676:	1800                	addi	s0,sp,48
80003678:	892a                	mv	s2,a0
8000367a:	8a2e                	mv	s4,a1
8000367c:	89b2                	mv	s3,a2
8000367e:	4601                	li	a2,0
80003680:	3d25                	jal	800034b8 <dirlookup>
80003682:	e525                	bnez	a0,800036ea <dirlink+0x80>
80003684:	d226                	sw	s1,36(sp)
80003686:	03092483          	lw	s1,48(s2)
8000368a:	c485                	beqz	s1,800036b2 <dirlink+0x48>
8000368c:	4481                	li	s1,0
8000368e:	4741                	li	a4,16
80003690:	86a6                	mv	a3,s1
80003692:	fd040613          	addi	a2,s0,-48
80003696:	4581                	li	a1,0
80003698:	854a                	mv	a0,s2
8000369a:	393d                	jal	800032d8 <readi>
8000369c:	47c1                	li	a5,16
8000369e:	04f51963          	bne	a0,a5,800036f0 <dirlink+0x86>
800036a2:	fd045783          	lhu	a5,-48(s0)
800036a6:	c791                	beqz	a5,800036b2 <dirlink+0x48>
800036a8:	04c1                	addi	s1,s1,16
800036aa:	03092783          	lw	a5,48(s2)
800036ae:	fef4e0e3          	bltu	s1,a5,8000368e <dirlink+0x24>
800036b2:	4639                	li	a2,14
800036b4:	85d2                	mv	a1,s4
800036b6:	fd240513          	addi	a0,s0,-46
800036ba:	3af000ef          	jal	80004268 <strncpy>
800036be:	fd341823          	sh	s3,-48(s0)
800036c2:	4741                	li	a4,16
800036c4:	86a6                	mv	a3,s1
800036c6:	fd040613          	addi	a2,s0,-48
800036ca:	4581                	li	a1,0
800036cc:	854a                	mv	a0,s2
800036ce:	31dd                	jal	800033b4 <writei>
800036d0:	1541                	addi	a0,a0,-16
800036d2:	00a03533          	snez	a0,a0
800036d6:	40a00533          	neg	a0,a0
800036da:	5492                	lw	s1,36(sp)
800036dc:	50b2                	lw	ra,44(sp)
800036de:	5422                	lw	s0,40(sp)
800036e0:	5902                	lw	s2,32(sp)
800036e2:	49f2                	lw	s3,28(sp)
800036e4:	4a62                	lw	s4,24(sp)
800036e6:	6145                	addi	sp,sp,48
800036e8:	8082                	ret
800036ea:	3afd                	jal	800030e8 <iput>
800036ec:	557d                	li	a0,-1
800036ee:	b7fd                	j	800036dc <dirlink+0x72>
800036f0:	00003517          	auipc	a0,0x3
800036f4:	58050513          	addi	a0,a0,1408 # 80006c70 <consoleinit+0x1866>
800036f8:	930fd0ef          	jal	80000828 <panic>

800036fc <namei>:
800036fc:	1101                	addi	sp,sp,-32
800036fe:	ce06                	sw	ra,28(sp)
80003700:	cc22                	sw	s0,24(sp)
80003702:	1000                	addi	s0,sp,32
80003704:	fe040613          	addi	a2,s0,-32
80003708:	4581                	li	a1,0
8000370a:	3599                	jal	80003550 <namex>
8000370c:	40f2                	lw	ra,28(sp)
8000370e:	4462                	lw	s0,24(sp)
80003710:	6105                	addi	sp,sp,32
80003712:	8082                	ret

80003714 <nameiparent>:
80003714:	1141                	addi	sp,sp,-16
80003716:	c606                	sw	ra,12(sp)
80003718:	c422                	sw	s0,8(sp)
8000371a:	0800                	addi	s0,sp,16
8000371c:	862e                	mv	a2,a1
8000371e:	4585                	li	a1,1
80003720:	3d05                	jal	80003550 <namex>
80003722:	40b2                	lw	ra,12(sp)
80003724:	4422                	lw	s0,8(sp)
80003726:	0141                	addi	sp,sp,16
80003728:	8082                	ret

8000372a <fileinit>:
8000372a:	1141                	addi	sp,sp,-16
8000372c:	c606                	sw	ra,12(sp)
8000372e:	c422                	sw	s0,8(sp)
80003730:	0800                	addi	s0,sp,16
80003732:	00003597          	auipc	a1,0x3
80003736:	54e58593          	addi	a1,a1,1358 # 80006c80 <consoleinit+0x1876>
8000373a:	00010517          	auipc	a0,0x10
8000373e:	12250513          	addi	a0,a0,290 # 8001385c <ftable>
80003742:	972ff0ef          	jal	800028b4 <initlock>
80003746:	40b2                	lw	ra,12(sp)
80003748:	4422                	lw	s0,8(sp)
8000374a:	0141                	addi	sp,sp,16
8000374c:	8082                	ret

8000374e <filealloc>:
8000374e:	1141                	addi	sp,sp,-16
80003750:	c606                	sw	ra,12(sp)
80003752:	c422                	sw	s0,8(sp)
80003754:	c226                	sw	s1,4(sp)
80003756:	0800                	addi	s0,sp,16
80003758:	00010517          	auipc	a0,0x10
8000375c:	10450513          	addi	a0,a0,260 # 8001385c <ftable>
80003760:	9d4ff0ef          	jal	80002934 <acquire>
80003764:	00010497          	auipc	s1,0x10
80003768:	10448493          	addi	s1,s1,260 # 80013868 <ftable+0xc>
8000376c:	00011717          	auipc	a4,0x11
80003770:	bec70713          	addi	a4,a4,-1044 # 80014358 <log>
80003774:	40dc                	lw	a5,4(s1)
80003776:	cf81                	beqz	a5,8000378e <filealloc+0x40>
80003778:	04f1                	addi	s1,s1,28
8000377a:	fee49de3          	bne	s1,a4,80003774 <filealloc+0x26>
8000377e:	00010517          	auipc	a0,0x10
80003782:	0de50513          	addi	a0,a0,222 # 8001385c <ftable>
80003786:	a38ff0ef          	jal	800029be <release>
8000378a:	4481                	li	s1,0
8000378c:	a809                	j	8000379e <filealloc+0x50>
8000378e:	4785                	li	a5,1
80003790:	c0dc                	sw	a5,4(s1)
80003792:	00010517          	auipc	a0,0x10
80003796:	0ca50513          	addi	a0,a0,202 # 8001385c <ftable>
8000379a:	a24ff0ef          	jal	800029be <release>
8000379e:	8526                	mv	a0,s1
800037a0:	40b2                	lw	ra,12(sp)
800037a2:	4422                	lw	s0,8(sp)
800037a4:	4492                	lw	s1,4(sp)
800037a6:	0141                	addi	sp,sp,16
800037a8:	8082                	ret

800037aa <filedup>:
800037aa:	1141                	addi	sp,sp,-16
800037ac:	c606                	sw	ra,12(sp)
800037ae:	c422                	sw	s0,8(sp)
800037b0:	c226                	sw	s1,4(sp)
800037b2:	0800                	addi	s0,sp,16
800037b4:	84aa                	mv	s1,a0
800037b6:	00010517          	auipc	a0,0x10
800037ba:	0a650513          	addi	a0,a0,166 # 8001385c <ftable>
800037be:	976ff0ef          	jal	80002934 <acquire>
800037c2:	40dc                	lw	a5,4(s1)
800037c4:	02f05063          	blez	a5,800037e4 <filedup+0x3a>
800037c8:	0785                	addi	a5,a5,1
800037ca:	c0dc                	sw	a5,4(s1)
800037cc:	00010517          	auipc	a0,0x10
800037d0:	09050513          	addi	a0,a0,144 # 8001385c <ftable>
800037d4:	9eaff0ef          	jal	800029be <release>
800037d8:	8526                	mv	a0,s1
800037da:	40b2                	lw	ra,12(sp)
800037dc:	4422                	lw	s0,8(sp)
800037de:	4492                	lw	s1,4(sp)
800037e0:	0141                	addi	sp,sp,16
800037e2:	8082                	ret
800037e4:	00003517          	auipc	a0,0x3
800037e8:	4a450513          	addi	a0,a0,1188 # 80006c88 <consoleinit+0x187e>
800037ec:	83cfd0ef          	jal	80000828 <panic>

800037f0 <fileclose>:
800037f0:	1101                	addi	sp,sp,-32
800037f2:	ce06                	sw	ra,28(sp)
800037f4:	cc22                	sw	s0,24(sp)
800037f6:	ca26                	sw	s1,20(sp)
800037f8:	1000                	addi	s0,sp,32
800037fa:	84aa                	mv	s1,a0
800037fc:	00010517          	auipc	a0,0x10
80003800:	06050513          	addi	a0,a0,96 # 8001385c <ftable>
80003804:	930ff0ef          	jal	80002934 <acquire>
80003808:	40dc                	lw	a5,4(s1)
8000380a:	04f05863          	blez	a5,8000385a <fileclose+0x6a>
8000380e:	17fd                	addi	a5,a5,-1
80003810:	c0dc                	sw	a5,4(s1)
80003812:	04f04e63          	bgtz	a5,8000386e <fileclose+0x7e>
80003816:	c84a                	sw	s2,16(sp)
80003818:	c64e                	sw	s3,12(sp)
8000381a:	c452                	sw	s4,8(sp)
8000381c:	c256                	sw	s5,4(sp)
8000381e:	0004a903          	lw	s2,0(s1)
80003822:	0094ca83          	lbu	s5,9(s1)
80003826:	00c4aa03          	lw	s4,12(s1)
8000382a:	0104a983          	lw	s3,16(s1)
8000382e:	0004a223          	sw	zero,4(s1)
80003832:	0004a023          	sw	zero,0(s1)
80003836:	00010517          	auipc	a0,0x10
8000383a:	02650513          	addi	a0,a0,38 # 8001385c <ftable>
8000383e:	980ff0ef          	jal	800029be <release>
80003842:	4785                	li	a5,1
80003844:	04f90063          	beq	s2,a5,80003884 <fileclose+0x94>
80003848:	1979                	addi	s2,s2,-2
8000384a:	4785                	li	a5,1
8000384c:	0527f463          	bgeu	a5,s2,80003894 <fileclose+0xa4>
80003850:	4942                	lw	s2,16(sp)
80003852:	49b2                	lw	s3,12(sp)
80003854:	4a22                	lw	s4,8(sp)
80003856:	4a92                	lw	s5,4(sp)
80003858:	a00d                	j	8000387a <fileclose+0x8a>
8000385a:	c84a                	sw	s2,16(sp)
8000385c:	c64e                	sw	s3,12(sp)
8000385e:	c452                	sw	s4,8(sp)
80003860:	c256                	sw	s5,4(sp)
80003862:	00003517          	auipc	a0,0x3
80003866:	42e50513          	addi	a0,a0,1070 # 80006c90 <consoleinit+0x1886>
8000386a:	fbffc0ef          	jal	80000828 <panic>
8000386e:	00010517          	auipc	a0,0x10
80003872:	fee50513          	addi	a0,a0,-18 # 8001385c <ftable>
80003876:	948ff0ef          	jal	800029be <release>
8000387a:	40f2                	lw	ra,28(sp)
8000387c:	4462                	lw	s0,24(sp)
8000387e:	44d2                	lw	s1,20(sp)
80003880:	6105                	addi	sp,sp,32
80003882:	8082                	ret
80003884:	85d6                	mv	a1,s5
80003886:	8552                	mv	a0,s4
80003888:	2e01                	jal	80003b98 <pipeclose>
8000388a:	4942                	lw	s2,16(sp)
8000388c:	49b2                	lw	s3,12(sp)
8000388e:	4a22                	lw	s4,8(sp)
80003890:	4a92                	lw	s5,4(sp)
80003892:	b7e5                	j	8000387a <fileclose+0x8a>
80003894:	25c1                	jal	80003f54 <begin_op>
80003896:	854e                	mv	a0,s3
80003898:	851ff0ef          	jal	800030e8 <iput>
8000389c:	720000ef          	jal	80003fbc <end_op>
800038a0:	4942                	lw	s2,16(sp)
800038a2:	49b2                	lw	s3,12(sp)
800038a4:	4a22                	lw	s4,8(sp)
800038a6:	4a92                	lw	s5,4(sp)
800038a8:	bfc9                	j	8000387a <fileclose+0x8a>

800038aa <filestat>:
800038aa:	7179                	addi	sp,sp,-48
800038ac:	d606                	sw	ra,44(sp)
800038ae:	d422                	sw	s0,40(sp)
800038b0:	d226                	sw	s1,36(sp)
800038b2:	ce4e                	sw	s3,28(sp)
800038b4:	1800                	addi	s0,sp,48
800038b6:	84aa                	mv	s1,a0
800038b8:	89ae                	mv	s3,a1
800038ba:	b51fc0ef          	jal	8000040a <myproc>
800038be:	409c                	lw	a5,0(s1)
800038c0:	17f9                	addi	a5,a5,-2
800038c2:	4705                	li	a4,1
800038c4:	02f76f63          	bltu	a4,a5,80003902 <filestat+0x58>
800038c8:	d04a                	sw	s2,32(sp)
800038ca:	892a                	mv	s2,a0
800038cc:	4888                	lw	a0,16(s1)
800038ce:	ea2ff0ef          	jal	80002f70 <ilock>
800038d2:	fd040593          	addi	a1,s0,-48
800038d6:	4888                	lw	a0,16(s1)
800038d8:	9d9ff0ef          	jal	800032b0 <stati>
800038dc:	4888                	lw	a0,16(s1)
800038de:	f3eff0ef          	jal	8000301c <iunlock>
800038e2:	46c1                	li	a3,16
800038e4:	fd040613          	addi	a2,s0,-48
800038e8:	85ce                	mv	a1,s3
800038ea:	02c92503          	lw	a0,44(s2)
800038ee:	f53fc0ef          	jal	80000840 <copyout>
800038f2:	857d                	srai	a0,a0,0x1f
800038f4:	5902                	lw	s2,32(sp)
800038f6:	50b2                	lw	ra,44(sp)
800038f8:	5422                	lw	s0,40(sp)
800038fa:	5492                	lw	s1,36(sp)
800038fc:	49f2                	lw	s3,28(sp)
800038fe:	6145                	addi	sp,sp,48
80003900:	8082                	ret
80003902:	557d                	li	a0,-1
80003904:	bfcd                	j	800038f6 <filestat+0x4c>

80003906 <fileread>:
80003906:	1101                	addi	sp,sp,-32
80003908:	ce06                	sw	ra,28(sp)
8000390a:	cc22                	sw	s0,24(sp)
8000390c:	c84a                	sw	s2,16(sp)
8000390e:	1000                	addi	s0,sp,32
80003910:	00854783          	lbu	a5,8(a0)
80003914:	cfc9                	beqz	a5,800039ae <fileread+0xa8>
80003916:	ca26                	sw	s1,20(sp)
80003918:	c64e                	sw	s3,12(sp)
8000391a:	84aa                	mv	s1,a0
8000391c:	89ae                	mv	s3,a1
8000391e:	8932                	mv	s2,a2
80003920:	411c                	lw	a5,0(a0)
80003922:	4705                	li	a4,1
80003924:	04e78363          	beq	a5,a4,8000396a <fileread+0x64>
80003928:	470d                	li	a4,3
8000392a:	04e78663          	beq	a5,a4,80003976 <fileread+0x70>
8000392e:	4709                	li	a4,2
80003930:	06e79963          	bne	a5,a4,800039a2 <fileread+0x9c>
80003934:	4908                	lw	a0,16(a0)
80003936:	e3aff0ef          	jal	80002f70 <ilock>
8000393a:	874a                	mv	a4,s2
8000393c:	48d4                	lw	a3,20(s1)
8000393e:	864e                	mv	a2,s3
80003940:	4585                	li	a1,1
80003942:	4888                	lw	a0,16(s1)
80003944:	995ff0ef          	jal	800032d8 <readi>
80003948:	892a                	mv	s2,a0
8000394a:	00a05563          	blez	a0,80003954 <fileread+0x4e>
8000394e:	48dc                	lw	a5,20(s1)
80003950:	97aa                	add	a5,a5,a0
80003952:	c8dc                	sw	a5,20(s1)
80003954:	4888                	lw	a0,16(s1)
80003956:	ec6ff0ef          	jal	8000301c <iunlock>
8000395a:	44d2                	lw	s1,20(sp)
8000395c:	49b2                	lw	s3,12(sp)
8000395e:	854a                	mv	a0,s2
80003960:	40f2                	lw	ra,28(sp)
80003962:	4462                	lw	s0,24(sp)
80003964:	4942                	lw	s2,16(sp)
80003966:	6105                	addi	sp,sp,32
80003968:	8082                	ret
8000396a:	4548                	lw	a0,12(a0)
8000396c:	26bd                	jal	80003cda <piperead>
8000396e:	892a                	mv	s2,a0
80003970:	44d2                	lw	s1,20(sp)
80003972:	49b2                	lw	s3,12(sp)
80003974:	b7ed                	j	8000395e <fileread+0x58>
80003976:	01851783          	lh	a5,24(a0)
8000397a:	01079693          	slli	a3,a5,0x10
8000397e:	82c1                	srli	a3,a3,0x10
80003980:	4725                	li	a4,9
80003982:	02d76863          	bltu	a4,a3,800039b2 <fileread+0xac>
80003986:	078e                	slli	a5,a5,0x3
80003988:	00010717          	auipc	a4,0x10
8000398c:	e8470713          	addi	a4,a4,-380 # 8001380c <devsw>
80003990:	97ba                	add	a5,a5,a4
80003992:	439c                	lw	a5,0(a5)
80003994:	c39d                	beqz	a5,800039ba <fileread+0xb4>
80003996:	4505                	li	a0,1
80003998:	9782                	jalr	a5
8000399a:	892a                	mv	s2,a0
8000399c:	44d2                	lw	s1,20(sp)
8000399e:	49b2                	lw	s3,12(sp)
800039a0:	bf7d                	j	8000395e <fileread+0x58>
800039a2:	00003517          	auipc	a0,0x3
800039a6:	2fa50513          	addi	a0,a0,762 # 80006c9c <consoleinit+0x1892>
800039aa:	e7ffc0ef          	jal	80000828 <panic>
800039ae:	597d                	li	s2,-1
800039b0:	b77d                	j	8000395e <fileread+0x58>
800039b2:	597d                	li	s2,-1
800039b4:	44d2                	lw	s1,20(sp)
800039b6:	49b2                	lw	s3,12(sp)
800039b8:	b75d                	j	8000395e <fileread+0x58>
800039ba:	597d                	li	s2,-1
800039bc:	44d2                	lw	s1,20(sp)
800039be:	49b2                	lw	s3,12(sp)
800039c0:	bf79                	j	8000395e <fileread+0x58>

800039c2 <filewrite>:
800039c2:	00954783          	lbu	a5,9(a0)
800039c6:	0e078c63          	beqz	a5,80003abe <filewrite+0xfc>
800039ca:	7179                	addi	sp,sp,-48
800039cc:	d606                	sw	ra,44(sp)
800039ce:	d422                	sw	s0,40(sp)
800039d0:	d04a                	sw	s2,32(sp)
800039d2:	ca56                	sw	s5,20(sp)
800039d4:	c65e                	sw	s7,12(sp)
800039d6:	1800                	addi	s0,sp,48
800039d8:	892a                	mv	s2,a0
800039da:	8bae                	mv	s7,a1
800039dc:	8ab2                	mv	s5,a2
800039de:	411c                	lw	a5,0(a0)
800039e0:	4705                	li	a4,1
800039e2:	02e78363          	beq	a5,a4,80003a08 <filewrite+0x46>
800039e6:	470d                	li	a4,3
800039e8:	02e78363          	beq	a5,a4,80003a0e <filewrite+0x4c>
800039ec:	4709                	li	a4,2
800039ee:	0ae79e63          	bne	a5,a4,80003aaa <filewrite+0xe8>
800039f2:	ce4e                	sw	s3,28(sp)
800039f4:	08c05b63          	blez	a2,80003a8a <filewrite+0xc8>
800039f8:	d226                	sw	s1,36(sp)
800039fa:	cc52                	sw	s4,24(sp)
800039fc:	c85a                	sw	s6,16(sp)
800039fe:	4981                	li	s3,0
80003a00:	6b05                	lui	s6,0x1
80003a02:	c00b0b13          	addi	s6,s6,-1024 # c00 <_entry-0x7ffff400>
80003a06:	a885                	j	80003a76 <filewrite+0xb4>
80003a08:	4548                	lw	a0,12(a0)
80003a0a:	22f5                	jal	80003bf6 <pipewrite>
80003a0c:	a841                	j	80003a9c <filewrite+0xda>
80003a0e:	01851783          	lh	a5,24(a0)
80003a12:	01079693          	slli	a3,a5,0x10
80003a16:	82c1                	srli	a3,a3,0x10
80003a18:	4725                	li	a4,9
80003a1a:	0ad76463          	bltu	a4,a3,80003ac2 <filewrite+0x100>
80003a1e:	078e                	slli	a5,a5,0x3
80003a20:	00010717          	auipc	a4,0x10
80003a24:	dec70713          	addi	a4,a4,-532 # 8001380c <devsw>
80003a28:	97ba                	add	a5,a5,a4
80003a2a:	43dc                	lw	a5,4(a5)
80003a2c:	cfc9                	beqz	a5,80003ac6 <filewrite+0x104>
80003a2e:	4505                	li	a0,1
80003a30:	9782                	jalr	a5
80003a32:	a0ad                	j	80003a9c <filewrite+0xda>
80003a34:	2305                	jal	80003f54 <begin_op>
80003a36:	01092503          	lw	a0,16(s2)
80003a3a:	d36ff0ef          	jal	80002f70 <ilock>
80003a3e:	8752                	mv	a4,s4
80003a40:	01492683          	lw	a3,20(s2)
80003a44:	01798633          	add	a2,s3,s7
80003a48:	4585                	li	a1,1
80003a4a:	01092503          	lw	a0,16(s2)
80003a4e:	967ff0ef          	jal	800033b4 <writei>
80003a52:	84aa                	mv	s1,a0
80003a54:	00a05763          	blez	a0,80003a62 <filewrite+0xa0>
80003a58:	01492783          	lw	a5,20(s2)
80003a5c:	97aa                	add	a5,a5,a0
80003a5e:	00f92a23          	sw	a5,20(s2)
80003a62:	01092503          	lw	a0,16(s2)
80003a66:	db6ff0ef          	jal	8000301c <iunlock>
80003a6a:	2b89                	jal	80003fbc <end_op>
80003a6c:	029a1163          	bne	s4,s1,80003a8e <filewrite+0xcc>
80003a70:	99a6                	add	s3,s3,s1
80003a72:	0159d863          	bge	s3,s5,80003a82 <filewrite+0xc0>
80003a76:	413a8a33          	sub	s4,s5,s3
80003a7a:	fb4b5de3          	bge	s6,s4,80003a34 <filewrite+0x72>
80003a7e:	8a5a                	mv	s4,s6
80003a80:	bf55                	j	80003a34 <filewrite+0x72>
80003a82:	5492                	lw	s1,36(sp)
80003a84:	4a62                	lw	s4,24(sp)
80003a86:	4b42                	lw	s6,16(sp)
80003a88:	a031                	j	80003a94 <filewrite+0xd2>
80003a8a:	4981                	li	s3,0
80003a8c:	a021                	j	80003a94 <filewrite+0xd2>
80003a8e:	5492                	lw	s1,36(sp)
80003a90:	4a62                	lw	s4,24(sp)
80003a92:	4b42                	lw	s6,16(sp)
80003a94:	033a9b63          	bne	s5,s3,80003aca <filewrite+0x108>
80003a98:	8556                	mv	a0,s5
80003a9a:	49f2                	lw	s3,28(sp)
80003a9c:	50b2                	lw	ra,44(sp)
80003a9e:	5422                	lw	s0,40(sp)
80003aa0:	5902                	lw	s2,32(sp)
80003aa2:	4ad2                	lw	s5,20(sp)
80003aa4:	4bb2                	lw	s7,12(sp)
80003aa6:	6145                	addi	sp,sp,48
80003aa8:	8082                	ret
80003aaa:	d226                	sw	s1,36(sp)
80003aac:	ce4e                	sw	s3,28(sp)
80003aae:	cc52                	sw	s4,24(sp)
80003ab0:	c85a                	sw	s6,16(sp)
80003ab2:	00003517          	auipc	a0,0x3
80003ab6:	1f650513          	addi	a0,a0,502 # 80006ca8 <consoleinit+0x189e>
80003aba:	d6ffc0ef          	jal	80000828 <panic>
80003abe:	557d                	li	a0,-1
80003ac0:	8082                	ret
80003ac2:	557d                	li	a0,-1
80003ac4:	bfe1                	j	80003a9c <filewrite+0xda>
80003ac6:	557d                	li	a0,-1
80003ac8:	bfd1                	j	80003a9c <filewrite+0xda>
80003aca:	557d                	li	a0,-1
80003acc:	49f2                	lw	s3,28(sp)
80003ace:	b7f9                	j	80003a9c <filewrite+0xda>

80003ad0 <pipealloc>:
80003ad0:	1101                	addi	sp,sp,-32
80003ad2:	ce06                	sw	ra,28(sp)
80003ad4:	cc22                	sw	s0,24(sp)
80003ad6:	ca26                	sw	s1,20(sp)
80003ad8:	c452                	sw	s4,8(sp)
80003ada:	1000                	addi	s0,sp,32
80003adc:	84aa                	mv	s1,a0
80003ade:	8a2e                	mv	s4,a1
80003ae0:	0005a023          	sw	zero,0(a1)
80003ae4:	00052023          	sw	zero,0(a0)
80003ae8:	c67ff0ef          	jal	8000374e <filealloc>
80003aec:	c088                	sw	a0,0(s1)
80003aee:	c549                	beqz	a0,80003b78 <pipealloc+0xa8>
80003af0:	c5fff0ef          	jal	8000374e <filealloc>
80003af4:	00aa2023          	sw	a0,0(s4)
80003af8:	cd25                	beqz	a0,80003b70 <pipealloc+0xa0>
80003afa:	c84a                	sw	s2,16(sp)
80003afc:	a23fc0ef          	jal	8000051e <kalloc>
80003b00:	892a                	mv	s2,a0
80003b02:	c12d                	beqz	a0,80003b64 <pipealloc+0x94>
80003b04:	c64e                	sw	s3,12(sp)
80003b06:	4985                	li	s3,1
80003b08:	21352a23          	sw	s3,532(a0)
80003b0c:	21352c23          	sw	s3,536(a0)
80003b10:	20052823          	sw	zero,528(a0)
80003b14:	20052623          	sw	zero,524(a0)
80003b18:	00003597          	auipc	a1,0x3
80003b1c:	19c58593          	addi	a1,a1,412 # 80006cb4 <consoleinit+0x18aa>
80003b20:	d95fe0ef          	jal	800028b4 <initlock>
80003b24:	409c                	lw	a5,0(s1)
80003b26:	0137a023          	sw	s3,0(a5)
80003b2a:	409c                	lw	a5,0(s1)
80003b2c:	01378423          	sb	s3,8(a5)
80003b30:	409c                	lw	a5,0(s1)
80003b32:	000784a3          	sb	zero,9(a5)
80003b36:	409c                	lw	a5,0(s1)
80003b38:	0127a623          	sw	s2,12(a5)
80003b3c:	000a2783          	lw	a5,0(s4)
80003b40:	0137a023          	sw	s3,0(a5)
80003b44:	000a2783          	lw	a5,0(s4)
80003b48:	00078423          	sb	zero,8(a5)
80003b4c:	000a2783          	lw	a5,0(s4)
80003b50:	013784a3          	sb	s3,9(a5)
80003b54:	000a2783          	lw	a5,0(s4)
80003b58:	0127a623          	sw	s2,12(a5)
80003b5c:	4501                	li	a0,0
80003b5e:	4942                	lw	s2,16(sp)
80003b60:	49b2                	lw	s3,12(sp)
80003b62:	a01d                	j	80003b88 <pipealloc+0xb8>
80003b64:	4088                	lw	a0,0(s1)
80003b66:	c119                	beqz	a0,80003b6c <pipealloc+0x9c>
80003b68:	4942                	lw	s2,16(sp)
80003b6a:	a029                	j	80003b74 <pipealloc+0xa4>
80003b6c:	4942                	lw	s2,16(sp)
80003b6e:	a029                	j	80003b78 <pipealloc+0xa8>
80003b70:	4088                	lw	a0,0(s1)
80003b72:	c10d                	beqz	a0,80003b94 <pipealloc+0xc4>
80003b74:	c7dff0ef          	jal	800037f0 <fileclose>
80003b78:	000a2783          	lw	a5,0(s4)
80003b7c:	557d                	li	a0,-1
80003b7e:	c789                	beqz	a5,80003b88 <pipealloc+0xb8>
80003b80:	853e                	mv	a0,a5
80003b82:	c6fff0ef          	jal	800037f0 <fileclose>
80003b86:	557d                	li	a0,-1
80003b88:	40f2                	lw	ra,28(sp)
80003b8a:	4462                	lw	s0,24(sp)
80003b8c:	44d2                	lw	s1,20(sp)
80003b8e:	4a22                	lw	s4,8(sp)
80003b90:	6105                	addi	sp,sp,32
80003b92:	8082                	ret
80003b94:	557d                	li	a0,-1
80003b96:	bfcd                	j	80003b88 <pipealloc+0xb8>

80003b98 <pipeclose>:
80003b98:	1141                	addi	sp,sp,-16
80003b9a:	c606                	sw	ra,12(sp)
80003b9c:	c422                	sw	s0,8(sp)
80003b9e:	c226                	sw	s1,4(sp)
80003ba0:	c04a                	sw	s2,0(sp)
80003ba2:	0800                	addi	s0,sp,16
80003ba4:	84aa                	mv	s1,a0
80003ba6:	892e                	mv	s2,a1
80003ba8:	d8dfe0ef          	jal	80002934 <acquire>
80003bac:	02090763          	beqz	s2,80003bda <pipeclose+0x42>
80003bb0:	2004ac23          	sw	zero,536(s1)
80003bb4:	20c48513          	addi	a0,s1,524
80003bb8:	8e2fd0ef          	jal	80000c9a <wakeup>
80003bbc:	2144a783          	lw	a5,532(s1)
80003bc0:	e781                	bnez	a5,80003bc8 <pipeclose+0x30>
80003bc2:	2184a783          	lw	a5,536(s1)
80003bc6:	c38d                	beqz	a5,80003be8 <pipeclose+0x50>
80003bc8:	8526                	mv	a0,s1
80003bca:	df5fe0ef          	jal	800029be <release>
80003bce:	40b2                	lw	ra,12(sp)
80003bd0:	4422                	lw	s0,8(sp)
80003bd2:	4492                	lw	s1,4(sp)
80003bd4:	4902                	lw	s2,0(sp)
80003bd6:	0141                	addi	sp,sp,16
80003bd8:	8082                	ret
80003bda:	2004aa23          	sw	zero,532(s1)
80003bde:	21048513          	addi	a0,s1,528
80003be2:	8b8fd0ef          	jal	80000c9a <wakeup>
80003be6:	bfd9                	j	80003bbc <pipeclose+0x24>
80003be8:	8526                	mv	a0,s1
80003bea:	dd5fe0ef          	jal	800029be <release>
80003bee:	8526                	mv	a0,s1
80003bf0:	941fc0ef          	jal	80000530 <kfree>
80003bf4:	bfe9                	j	80003bce <pipeclose+0x36>

80003bf6 <pipewrite>:
80003bf6:	7139                	addi	sp,sp,-64
80003bf8:	de06                	sw	ra,60(sp)
80003bfa:	dc22                	sw	s0,56(sp)
80003bfc:	da26                	sw	s1,52(sp)
80003bfe:	d84a                	sw	s2,48(sp)
80003c00:	d64e                	sw	s3,44(sp)
80003c02:	d452                	sw	s4,40(sp)
80003c04:	d256                	sw	s5,36(sp)
80003c06:	0080                	addi	s0,sp,64
80003c08:	84aa                	mv	s1,a0
80003c0a:	8aae                	mv	s5,a1
80003c0c:	8a32                	mv	s4,a2
80003c0e:	ffcfc0ef          	jal	8000040a <myproc>
80003c12:	89aa                	mv	s3,a0
80003c14:	8526                	mv	a0,s1
80003c16:	d1ffe0ef          	jal	80002934 <acquire>
80003c1a:	0b405a63          	blez	s4,80003cce <pipewrite+0xd8>
80003c1e:	d05a                	sw	s6,32(sp)
80003c20:	ce5e                	sw	s7,28(sp)
80003c22:	cc62                	sw	s8,24(sp)
80003c24:	4901                	li	s2,0
80003c26:	5b7d                	li	s6,-1
80003c28:	20c48c13          	addi	s8,s1,524
80003c2c:	21048b93          	addi	s7,s1,528
80003c30:	a81d                	j	80003c66 <pipewrite+0x70>
80003c32:	8526                	mv	a0,s1
80003c34:	d8bfe0ef          	jal	800029be <release>
80003c38:	597d                	li	s2,-1
80003c3a:	5b02                	lw	s6,32(sp)
80003c3c:	4bf2                	lw	s7,28(sp)
80003c3e:	4c62                	lw	s8,24(sp)
80003c40:	854a                	mv	a0,s2
80003c42:	50f2                	lw	ra,60(sp)
80003c44:	5462                	lw	s0,56(sp)
80003c46:	54d2                	lw	s1,52(sp)
80003c48:	5942                	lw	s2,48(sp)
80003c4a:	59b2                	lw	s3,44(sp)
80003c4c:	5a22                	lw	s4,40(sp)
80003c4e:	5a92                	lw	s5,36(sp)
80003c50:	6121                	addi	sp,sp,64
80003c52:	8082                	ret
80003c54:	8562                	mv	a0,s8
80003c56:	844fd0ef          	jal	80000c9a <wakeup>
80003c5a:	85a6                	mv	a1,s1
80003c5c:	855e                	mv	a0,s7
80003c5e:	f47fc0ef          	jal	80000ba4 <sleep>
80003c62:	05495b63          	bge	s2,s4,80003cb8 <pipewrite+0xc2>
80003c66:	2144a783          	lw	a5,532(s1)
80003c6a:	d7e1                	beqz	a5,80003c32 <pipewrite+0x3c>
80003c6c:	854e                	mv	a0,s3
80003c6e:	9cafd0ef          	jal	80000e38 <killed>
80003c72:	f161                	bnez	a0,80003c32 <pipewrite+0x3c>
80003c74:	20c4a783          	lw	a5,524(s1)
80003c78:	20078793          	addi	a5,a5,512
80003c7c:	2104a703          	lw	a4,528(s1)
80003c80:	fcf70ae3          	beq	a4,a5,80003c54 <pipewrite+0x5e>
80003c84:	4685                	li	a3,1
80003c86:	01590633          	add	a2,s2,s5
80003c8a:	fcf40593          	addi	a1,s0,-49
80003c8e:	02c9a503          	lw	a0,44(s3)
80003c92:	c5bfc0ef          	jal	800008ec <copyin>
80003c96:	03650e63          	beq	a0,s6,80003cd2 <pipewrite+0xdc>
80003c9a:	2104a783          	lw	a5,528(s1)
80003c9e:	00178713          	addi	a4,a5,1
80003ca2:	20e4a823          	sw	a4,528(s1)
80003ca6:	1ff7f793          	andi	a5,a5,511
80003caa:	97a6                	add	a5,a5,s1
80003cac:	fcf44703          	lbu	a4,-49(s0)
80003cb0:	00e78623          	sb	a4,12(a5)
80003cb4:	0905                	addi	s2,s2,1
80003cb6:	b775                	j	80003c62 <pipewrite+0x6c>
80003cb8:	5b02                	lw	s6,32(sp)
80003cba:	4bf2                	lw	s7,28(sp)
80003cbc:	4c62                	lw	s8,24(sp)
80003cbe:	20c48513          	addi	a0,s1,524
80003cc2:	fd9fc0ef          	jal	80000c9a <wakeup>
80003cc6:	8526                	mv	a0,s1
80003cc8:	cf7fe0ef          	jal	800029be <release>
80003ccc:	bf95                	j	80003c40 <pipewrite+0x4a>
80003cce:	4901                	li	s2,0
80003cd0:	b7fd                	j	80003cbe <pipewrite+0xc8>
80003cd2:	5b02                	lw	s6,32(sp)
80003cd4:	4bf2                	lw	s7,28(sp)
80003cd6:	4c62                	lw	s8,24(sp)
80003cd8:	b7dd                	j	80003cbe <pipewrite+0xc8>

80003cda <piperead>:
80003cda:	7179                	addi	sp,sp,-48
80003cdc:	d606                	sw	ra,44(sp)
80003cde:	d422                	sw	s0,40(sp)
80003ce0:	d226                	sw	s1,36(sp)
80003ce2:	d04a                	sw	s2,32(sp)
80003ce4:	ce4e                	sw	s3,28(sp)
80003ce6:	cc52                	sw	s4,24(sp)
80003ce8:	ca56                	sw	s5,20(sp)
80003cea:	1800                	addi	s0,sp,48
80003cec:	84aa                	mv	s1,a0
80003cee:	8aae                	mv	s5,a1
80003cf0:	8a32                	mv	s4,a2
80003cf2:	f18fc0ef          	jal	8000040a <myproc>
80003cf6:	89aa                	mv	s3,a0
80003cf8:	8526                	mv	a0,s1
80003cfa:	c3bfe0ef          	jal	80002934 <acquire>
80003cfe:	20c4a703          	lw	a4,524(s1)
80003d02:	2104a783          	lw	a5,528(s1)
80003d06:	20c48913          	addi	s2,s1,524
80003d0a:	02f71563          	bne	a4,a5,80003d34 <piperead+0x5a>
80003d0e:	2184a783          	lw	a5,536(s1)
80003d12:	cb85                	beqz	a5,80003d42 <piperead+0x68>
80003d14:	854e                	mv	a0,s3
80003d16:	922fd0ef          	jal	80000e38 <killed>
80003d1a:	ed19                	bnez	a0,80003d38 <piperead+0x5e>
80003d1c:	85a6                	mv	a1,s1
80003d1e:	854a                	mv	a0,s2
80003d20:	e85fc0ef          	jal	80000ba4 <sleep>
80003d24:	20c4a703          	lw	a4,524(s1)
80003d28:	2104a783          	lw	a5,528(s1)
80003d2c:	fef701e3          	beq	a4,a5,80003d0e <piperead+0x34>
80003d30:	c85a                	sw	s6,16(sp)
80003d32:	a809                	j	80003d44 <piperead+0x6a>
80003d34:	c85a                	sw	s6,16(sp)
80003d36:	a039                	j	80003d44 <piperead+0x6a>
80003d38:	8526                	mv	a0,s1
80003d3a:	c85fe0ef          	jal	800029be <release>
80003d3e:	597d                	li	s2,-1
80003d40:	a8b9                	j	80003d9e <piperead+0xc4>
80003d42:	c85a                	sw	s6,16(sp)
80003d44:	4901                	li	s2,0
80003d46:	5b7d                	li	s6,-1
80003d48:	05405363          	blez	s4,80003d8e <piperead+0xb4>
80003d4c:	20c4a783          	lw	a5,524(s1)
80003d50:	2104a703          	lw	a4,528(s1)
80003d54:	02e78d63          	beq	a5,a4,80003d8e <piperead+0xb4>
80003d58:	1ff7f793          	andi	a5,a5,511
80003d5c:	97a6                	add	a5,a5,s1
80003d5e:	00c7c783          	lbu	a5,12(a5)
80003d62:	fcf40fa3          	sb	a5,-33(s0)
80003d66:	4685                	li	a3,1
80003d68:	fdf40613          	addi	a2,s0,-33
80003d6c:	015905b3          	add	a1,s2,s5
80003d70:	02c9a503          	lw	a0,44(s3)
80003d74:	acdfc0ef          	jal	80000840 <copyout>
80003d78:	03650d63          	beq	a0,s6,80003db2 <piperead+0xd8>
80003d7c:	20c4a783          	lw	a5,524(s1)
80003d80:	0785                	addi	a5,a5,1
80003d82:	20f4a623          	sw	a5,524(s1)
80003d86:	0905                	addi	s2,s2,1
80003d88:	fd2a12e3          	bne	s4,s2,80003d4c <piperead+0x72>
80003d8c:	8952                	mv	s2,s4
80003d8e:	21048513          	addi	a0,s1,528
80003d92:	f09fc0ef          	jal	80000c9a <wakeup>
80003d96:	8526                	mv	a0,s1
80003d98:	c27fe0ef          	jal	800029be <release>
80003d9c:	4b42                	lw	s6,16(sp)
80003d9e:	854a                	mv	a0,s2
80003da0:	50b2                	lw	ra,44(sp)
80003da2:	5422                	lw	s0,40(sp)
80003da4:	5492                	lw	s1,36(sp)
80003da6:	5902                	lw	s2,32(sp)
80003da8:	49f2                	lw	s3,28(sp)
80003daa:	4a62                	lw	s4,24(sp)
80003dac:	4ad2                	lw	s5,20(sp)
80003dae:	6145                	addi	sp,sp,48
80003db0:	8082                	ret
80003db2:	fc091ee3          	bnez	s2,80003d8e <piperead+0xb4>
80003db6:	892a                	mv	s2,a0
80003db8:	bfd9                	j	80003d8e <piperead+0xb4>

80003dba <write_head>:
80003dba:	1141                	addi	sp,sp,-16
80003dbc:	c606                	sw	ra,12(sp)
80003dbe:	c422                	sw	s0,8(sp)
80003dc0:	c226                	sw	s1,4(sp)
80003dc2:	c04a                	sw	s2,0(sp)
80003dc4:	0800                	addi	s0,sp,16
80003dc6:	00010917          	auipc	s2,0x10
80003dca:	59290913          	addi	s2,s2,1426 # 80014358 <log>
80003dce:	00c92583          	lw	a1,12(s2)
80003dd2:	01892503          	lw	a0,24(s2)
80003dd6:	907fe0ef          	jal	800026dc <bread>
80003dda:	84aa                	mv	s1,a0
80003ddc:	01c92603          	lw	a2,28(s2)
80003de0:	d950                	sw	a2,52(a0)
80003de2:	00c05f63          	blez	a2,80003e00 <write_head+0x46>
80003de6:	00010717          	auipc	a4,0x10
80003dea:	59270713          	addi	a4,a4,1426 # 80014378 <log+0x20>
80003dee:	87aa                	mv	a5,a0
80003df0:	060a                	slli	a2,a2,0x2
80003df2:	962a                	add	a2,a2,a0
80003df4:	4314                	lw	a3,0(a4)
80003df6:	df94                	sw	a3,56(a5)
80003df8:	0711                	addi	a4,a4,4
80003dfa:	0791                	addi	a5,a5,4
80003dfc:	fec79ce3          	bne	a5,a2,80003df4 <write_head+0x3a>
80003e00:	8526                	mv	a0,s1
80003e02:	9a7fe0ef          	jal	800027a8 <bwrite>
80003e06:	8526                	mv	a0,s1
80003e08:	9d1fe0ef          	jal	800027d8 <brelse>
80003e0c:	40b2                	lw	ra,12(sp)
80003e0e:	4422                	lw	s0,8(sp)
80003e10:	4492                	lw	s1,4(sp)
80003e12:	4902                	lw	s2,0(sp)
80003e14:	0141                	addi	sp,sp,16
80003e16:	8082                	ret

80003e18 <install_trans>:
80003e18:	00010797          	auipc	a5,0x10
80003e1c:	55c7a783          	lw	a5,1372(a5) # 80014374 <log+0x1c>
80003e20:	0af05c63          	blez	a5,80003ed8 <install_trans+0xc0>
80003e24:	7179                	addi	sp,sp,-48
80003e26:	d606                	sw	ra,44(sp)
80003e28:	d422                	sw	s0,40(sp)
80003e2a:	d226                	sw	s1,36(sp)
80003e2c:	d04a                	sw	s2,32(sp)
80003e2e:	ce4e                	sw	s3,28(sp)
80003e30:	cc52                	sw	s4,24(sp)
80003e32:	ca56                	sw	s5,20(sp)
80003e34:	c85a                	sw	s6,16(sp)
80003e36:	c65e                	sw	s7,12(sp)
80003e38:	1800                	addi	s0,sp,48
80003e3a:	8b2a                	mv	s6,a0
80003e3c:	00010a97          	auipc	s5,0x10
80003e40:	53ca8a93          	addi	s5,s5,1340 # 80014378 <log+0x20>
80003e44:	4981                	li	s3,0
80003e46:	00003b97          	auipc	s7,0x3
80003e4a:	e76b8b93          	addi	s7,s7,-394 # 80006cbc <consoleinit+0x18b2>
80003e4e:	00010a17          	auipc	s4,0x10
80003e52:	50aa0a13          	addi	s4,s4,1290 # 80014358 <log>
80003e56:	a025                	j	80003e7e <install_trans+0x66>
80003e58:	000aa603          	lw	a2,0(s5)
80003e5c:	85ce                	mv	a1,s3
80003e5e:	855e                	mv	a0,s7
80003e60:	827fc0ef          	jal	80000686 <printf>
80003e64:	a839                	j	80003e82 <install_trans+0x6a>
80003e66:	854a                	mv	a0,s2
80003e68:	971fe0ef          	jal	800027d8 <brelse>
80003e6c:	8526                	mv	a0,s1
80003e6e:	96bfe0ef          	jal	800027d8 <brelse>
80003e72:	0985                	addi	s3,s3,1
80003e74:	0a91                	addi	s5,s5,4
80003e76:	01ca2783          	lw	a5,28(s4)
80003e7a:	04f9d463          	bge	s3,a5,80003ec2 <install_trans+0xaa>
80003e7e:	fc0b1de3          	bnez	s6,80003e58 <install_trans+0x40>
80003e82:	00ca2583          	lw	a1,12(s4)
80003e86:	95ce                	add	a1,a1,s3
80003e88:	0585                	addi	a1,a1,1
80003e8a:	018a2503          	lw	a0,24(s4)
80003e8e:	84ffe0ef          	jal	800026dc <bread>
80003e92:	892a                	mv	s2,a0
80003e94:	000aa583          	lw	a1,0(s5)
80003e98:	018a2503          	lw	a0,24(s4)
80003e9c:	841fe0ef          	jal	800026dc <bread>
80003ea0:	84aa                	mv	s1,a0
80003ea2:	40000613          	li	a2,1024
80003ea6:	03490593          	addi	a1,s2,52
80003eaa:	03450513          	addi	a0,a0,52
80003eae:	2e05                	jal	800041de <memmove>
80003eb0:	8526                	mv	a0,s1
80003eb2:	8f7fe0ef          	jal	800027a8 <bwrite>
80003eb6:	fa0b18e3          	bnez	s6,80003e66 <install_trans+0x4e>
80003eba:	8526                	mv	a0,s1
80003ebc:	9c9fe0ef          	jal	80002884 <bunpin>
80003ec0:	b75d                	j	80003e66 <install_trans+0x4e>
80003ec2:	50b2                	lw	ra,44(sp)
80003ec4:	5422                	lw	s0,40(sp)
80003ec6:	5492                	lw	s1,36(sp)
80003ec8:	5902                	lw	s2,32(sp)
80003eca:	49f2                	lw	s3,28(sp)
80003ecc:	4a62                	lw	s4,24(sp)
80003ece:	4ad2                	lw	s5,20(sp)
80003ed0:	4b42                	lw	s6,16(sp)
80003ed2:	4bb2                	lw	s7,12(sp)
80003ed4:	6145                	addi	sp,sp,48
80003ed6:	8082                	ret
80003ed8:	8082                	ret

80003eda <initlog>:
80003eda:	1101                	addi	sp,sp,-32
80003edc:	ce06                	sw	ra,28(sp)
80003ede:	cc22                	sw	s0,24(sp)
80003ee0:	ca26                	sw	s1,20(sp)
80003ee2:	c84a                	sw	s2,16(sp)
80003ee4:	c64e                	sw	s3,12(sp)
80003ee6:	1000                	addi	s0,sp,32
80003ee8:	892a                	mv	s2,a0
80003eea:	89ae                	mv	s3,a1
80003eec:	00010497          	auipc	s1,0x10
80003ef0:	46c48493          	addi	s1,s1,1132 # 80014358 <log>
80003ef4:	00003597          	auipc	a1,0x3
80003ef8:	de458593          	addi	a1,a1,-540 # 80006cd8 <consoleinit+0x18ce>
80003efc:	8526                	mv	a0,s1
80003efe:	9b7fe0ef          	jal	800028b4 <initlock>
80003f02:	0149a583          	lw	a1,20(s3)
80003f06:	c4cc                	sw	a1,12(s1)
80003f08:	0124ac23          	sw	s2,24(s1)
80003f0c:	854a                	mv	a0,s2
80003f0e:	fcefe0ef          	jal	800026dc <bread>
80003f12:	5950                	lw	a2,52(a0)
80003f14:	ccd0                	sw	a2,28(s1)
80003f16:	00c05f63          	blez	a2,80003f34 <initlog+0x5a>
80003f1a:	87aa                	mv	a5,a0
80003f1c:	00010717          	auipc	a4,0x10
80003f20:	45c70713          	addi	a4,a4,1116 # 80014378 <log+0x20>
80003f24:	060a                	slli	a2,a2,0x2
80003f26:	962a                	add	a2,a2,a0
80003f28:	5f94                	lw	a3,56(a5)
80003f2a:	c314                	sw	a3,0(a4)
80003f2c:	0791                	addi	a5,a5,4
80003f2e:	0711                	addi	a4,a4,4
80003f30:	fec79ce3          	bne	a5,a2,80003f28 <initlog+0x4e>
80003f34:	8a5fe0ef          	jal	800027d8 <brelse>
80003f38:	4505                	li	a0,1
80003f3a:	3df9                	jal	80003e18 <install_trans>
80003f3c:	00010797          	auipc	a5,0x10
80003f40:	4207ac23          	sw	zero,1080(a5) # 80014374 <log+0x1c>
80003f44:	3d9d                	jal	80003dba <write_head>
80003f46:	40f2                	lw	ra,28(sp)
80003f48:	4462                	lw	s0,24(sp)
80003f4a:	44d2                	lw	s1,20(sp)
80003f4c:	4942                	lw	s2,16(sp)
80003f4e:	49b2                	lw	s3,12(sp)
80003f50:	6105                	addi	sp,sp,32
80003f52:	8082                	ret

80003f54 <begin_op>:
80003f54:	1141                	addi	sp,sp,-16
80003f56:	c606                	sw	ra,12(sp)
80003f58:	c422                	sw	s0,8(sp)
80003f5a:	c226                	sw	s1,4(sp)
80003f5c:	c04a                	sw	s2,0(sp)
80003f5e:	0800                	addi	s0,sp,16
80003f60:	00010517          	auipc	a0,0x10
80003f64:	3f850513          	addi	a0,a0,1016 # 80014358 <log>
80003f68:	9cdfe0ef          	jal	80002934 <acquire>
80003f6c:	00010497          	auipc	s1,0x10
80003f70:	3ec48493          	addi	s1,s1,1004 # 80014358 <log>
80003f74:	4979                	li	s2,30
80003f76:	a029                	j	80003f80 <begin_op+0x2c>
80003f78:	85a6                	mv	a1,s1
80003f7a:	8526                	mv	a0,s1
80003f7c:	c29fc0ef          	jal	80000ba4 <sleep>
80003f80:	48dc                	lw	a5,20(s1)
80003f82:	fbfd                	bnez	a5,80003f78 <begin_op+0x24>
80003f84:	4898                	lw	a4,16(s1)
80003f86:	0705                	addi	a4,a4,1
80003f88:	00271793          	slli	a5,a4,0x2
80003f8c:	97ba                	add	a5,a5,a4
80003f8e:	0786                	slli	a5,a5,0x1
80003f90:	4cd4                	lw	a3,28(s1)
80003f92:	97b6                	add	a5,a5,a3
80003f94:	00f95763          	bge	s2,a5,80003fa2 <begin_op+0x4e>
80003f98:	85a6                	mv	a1,s1
80003f9a:	8526                	mv	a0,s1
80003f9c:	c09fc0ef          	jal	80000ba4 <sleep>
80003fa0:	b7c5                	j	80003f80 <begin_op+0x2c>
80003fa2:	00010517          	auipc	a0,0x10
80003fa6:	3b650513          	addi	a0,a0,950 # 80014358 <log>
80003faa:	c918                	sw	a4,16(a0)
80003fac:	a13fe0ef          	jal	800029be <release>
80003fb0:	40b2                	lw	ra,12(sp)
80003fb2:	4422                	lw	s0,8(sp)
80003fb4:	4492                	lw	s1,4(sp)
80003fb6:	4902                	lw	s2,0(sp)
80003fb8:	0141                	addi	sp,sp,16
80003fba:	8082                	ret

80003fbc <end_op>:
80003fbc:	1101                	addi	sp,sp,-32
80003fbe:	ce06                	sw	ra,28(sp)
80003fc0:	cc22                	sw	s0,24(sp)
80003fc2:	ca26                	sw	s1,20(sp)
80003fc4:	c84a                	sw	s2,16(sp)
80003fc6:	1000                	addi	s0,sp,32
80003fc8:	00010917          	auipc	s2,0x10
80003fcc:	39090913          	addi	s2,s2,912 # 80014358 <log>
80003fd0:	854a                	mv	a0,s2
80003fd2:	963fe0ef          	jal	80002934 <acquire>
80003fd6:	01092483          	lw	s1,16(s2)
80003fda:	14fd                	addi	s1,s1,-1
80003fdc:	00992823          	sw	s1,16(s2)
80003fe0:	01492783          	lw	a5,20(s2)
80003fe4:	e3a1                	bnez	a5,80004024 <end_op+0x68>
80003fe6:	e8a1                	bnez	s1,80004036 <end_op+0x7a>
80003fe8:	00010917          	auipc	s2,0x10
80003fec:	37090913          	addi	s2,s2,880 # 80014358 <log>
80003ff0:	4785                	li	a5,1
80003ff2:	00f92a23          	sw	a5,20(s2)
80003ff6:	854a                	mv	a0,s2
80003ff8:	9c7fe0ef          	jal	800029be <release>
80003ffc:	01c92783          	lw	a5,28(s2)
80004000:	04f04b63          	bgtz	a5,80004056 <end_op+0x9a>
80004004:	00010497          	auipc	s1,0x10
80004008:	35448493          	addi	s1,s1,852 # 80014358 <log>
8000400c:	8526                	mv	a0,s1
8000400e:	927fe0ef          	jal	80002934 <acquire>
80004012:	0004aa23          	sw	zero,20(s1)
80004016:	8526                	mv	a0,s1
80004018:	c83fc0ef          	jal	80000c9a <wakeup>
8000401c:	8526                	mv	a0,s1
8000401e:	9a1fe0ef          	jal	800029be <release>
80004022:	a025                	j	8000404a <end_op+0x8e>
80004024:	c64e                	sw	s3,12(sp)
80004026:	c452                	sw	s4,8(sp)
80004028:	c256                	sw	s5,4(sp)
8000402a:	00003517          	auipc	a0,0x3
8000402e:	cb250513          	addi	a0,a0,-846 # 80006cdc <consoleinit+0x18d2>
80004032:	ff6fc0ef          	jal	80000828 <panic>
80004036:	00010497          	auipc	s1,0x10
8000403a:	32248493          	addi	s1,s1,802 # 80014358 <log>
8000403e:	8526                	mv	a0,s1
80004040:	c5bfc0ef          	jal	80000c9a <wakeup>
80004044:	8526                	mv	a0,s1
80004046:	979fe0ef          	jal	800029be <release>
8000404a:	40f2                	lw	ra,28(sp)
8000404c:	4462                	lw	s0,24(sp)
8000404e:	44d2                	lw	s1,20(sp)
80004050:	4942                	lw	s2,16(sp)
80004052:	6105                	addi	sp,sp,32
80004054:	8082                	ret
80004056:	c64e                	sw	s3,12(sp)
80004058:	c452                	sw	s4,8(sp)
8000405a:	c256                	sw	s5,4(sp)
8000405c:	00010a97          	auipc	s5,0x10
80004060:	31ca8a93          	addi	s5,s5,796 # 80014378 <log+0x20>
80004064:	00010a17          	auipc	s4,0x10
80004068:	2f4a0a13          	addi	s4,s4,756 # 80014358 <log>
8000406c:	00ca2583          	lw	a1,12(s4)
80004070:	95a6                	add	a1,a1,s1
80004072:	0585                	addi	a1,a1,1
80004074:	018a2503          	lw	a0,24(s4)
80004078:	e64fe0ef          	jal	800026dc <bread>
8000407c:	892a                	mv	s2,a0
8000407e:	000aa583          	lw	a1,0(s5)
80004082:	018a2503          	lw	a0,24(s4)
80004086:	e56fe0ef          	jal	800026dc <bread>
8000408a:	89aa                	mv	s3,a0
8000408c:	40000613          	li	a2,1024
80004090:	03450593          	addi	a1,a0,52
80004094:	03490513          	addi	a0,s2,52
80004098:	2299                	jal	800041de <memmove>
8000409a:	854a                	mv	a0,s2
8000409c:	f0cfe0ef          	jal	800027a8 <bwrite>
800040a0:	854e                	mv	a0,s3
800040a2:	f36fe0ef          	jal	800027d8 <brelse>
800040a6:	854a                	mv	a0,s2
800040a8:	f30fe0ef          	jal	800027d8 <brelse>
800040ac:	0485                	addi	s1,s1,1
800040ae:	0a91                	addi	s5,s5,4
800040b0:	01ca2783          	lw	a5,28(s4)
800040b4:	faf4cce3          	blt	s1,a5,8000406c <end_op+0xb0>
800040b8:	3309                	jal	80003dba <write_head>
800040ba:	4501                	li	a0,0
800040bc:	3bb1                	jal	80003e18 <install_trans>
800040be:	00010797          	auipc	a5,0x10
800040c2:	2a07ab23          	sw	zero,694(a5) # 80014374 <log+0x1c>
800040c6:	39d5                	jal	80003dba <write_head>
800040c8:	49b2                	lw	s3,12(sp)
800040ca:	4a22                	lw	s4,8(sp)
800040cc:	4a92                	lw	s5,4(sp)
800040ce:	bf1d                	j	80004004 <end_op+0x48>

800040d0 <log_write>:
800040d0:	1141                	addi	sp,sp,-16
800040d2:	c606                	sw	ra,12(sp)
800040d4:	c422                	sw	s0,8(sp)
800040d6:	c226                	sw	s1,4(sp)
800040d8:	c04a                	sw	s2,0(sp)
800040da:	0800                	addi	s0,sp,16
800040dc:	84aa                	mv	s1,a0
800040de:	00010917          	auipc	s2,0x10
800040e2:	27a90913          	addi	s2,s2,634 # 80014358 <log>
800040e6:	854a                	mv	a0,s2
800040e8:	84dfe0ef          	jal	80002934 <acquire>
800040ec:	01c92603          	lw	a2,28(s2)
800040f0:	47f5                	li	a5,29
800040f2:	04c7cc63          	blt	a5,a2,8000414a <log_write+0x7a>
800040f6:	00010797          	auipc	a5,0x10
800040fa:	2727a783          	lw	a5,626(a5) # 80014368 <log+0x10>
800040fe:	04f05c63          	blez	a5,80004156 <log_write+0x86>
80004102:	4781                	li	a5,0
80004104:	04c05f63          	blez	a2,80004162 <log_write+0x92>
80004108:	44cc                	lw	a1,12(s1)
8000410a:	00010717          	auipc	a4,0x10
8000410e:	26e70713          	addi	a4,a4,622 # 80014378 <log+0x20>
80004112:	4781                	li	a5,0
80004114:	4314                	lw	a3,0(a4)
80004116:	04b68663          	beq	a3,a1,80004162 <log_write+0x92>
8000411a:	0785                	addi	a5,a5,1
8000411c:	0711                	addi	a4,a4,4
8000411e:	fef61be3          	bne	a2,a5,80004114 <log_write+0x44>
80004122:	0611                	addi	a2,a2,4
80004124:	060a                	slli	a2,a2,0x2
80004126:	00010797          	auipc	a5,0x10
8000412a:	23278793          	addi	a5,a5,562 # 80014358 <log>
8000412e:	97b2                	add	a5,a5,a2
80004130:	44d8                	lw	a4,12(s1)
80004132:	cb98                	sw	a4,16(a5)
80004134:	8526                	mv	a0,s1
80004136:	f1efe0ef          	jal	80002854 <bpin>
8000413a:	00010717          	auipc	a4,0x10
8000413e:	21e70713          	addi	a4,a4,542 # 80014358 <log>
80004142:	4f5c                	lw	a5,28(a4)
80004144:	0785                	addi	a5,a5,1
80004146:	cf5c                	sw	a5,28(a4)
80004148:	a80d                	j	8000417a <log_write+0xaa>
8000414a:	00003517          	auipc	a0,0x3
8000414e:	ba250513          	addi	a0,a0,-1118 # 80006cec <consoleinit+0x18e2>
80004152:	ed6fc0ef          	jal	80000828 <panic>
80004156:	00003517          	auipc	a0,0x3
8000415a:	bae50513          	addi	a0,a0,-1106 # 80006d04 <consoleinit+0x18fa>
8000415e:	ecafc0ef          	jal	80000828 <panic>
80004162:	00478693          	addi	a3,a5,4
80004166:	068a                	slli	a3,a3,0x2
80004168:	00010717          	auipc	a4,0x10
8000416c:	1f070713          	addi	a4,a4,496 # 80014358 <log>
80004170:	9736                	add	a4,a4,a3
80004172:	44d4                	lw	a3,12(s1)
80004174:	cb14                	sw	a3,16(a4)
80004176:	faf60fe3          	beq	a2,a5,80004134 <log_write+0x64>
8000417a:	00010517          	auipc	a0,0x10
8000417e:	1de50513          	addi	a0,a0,478 # 80014358 <log>
80004182:	83dfe0ef          	jal	800029be <release>
80004186:	40b2                	lw	ra,12(sp)
80004188:	4422                	lw	s0,8(sp)
8000418a:	4492                	lw	s1,4(sp)
8000418c:	4902                	lw	s2,0(sp)
8000418e:	0141                	addi	sp,sp,16
80004190:	8082                	ret

80004192 <memset>:
80004192:	1141                	addi	sp,sp,-16
80004194:	c622                	sw	s0,12(sp)
80004196:	0800                	addi	s0,sp,16
80004198:	ca01                	beqz	a2,800041a8 <memset+0x16>
8000419a:	87aa                	mv	a5,a0
8000419c:	962a                	add	a2,a2,a0
8000419e:	00b78023          	sb	a1,0(a5)
800041a2:	0785                	addi	a5,a5,1
800041a4:	fec79de3          	bne	a5,a2,8000419e <memset+0xc>
800041a8:	4432                	lw	s0,12(sp)
800041aa:	0141                	addi	sp,sp,16
800041ac:	8082                	ret

800041ae <memcmp>:
800041ae:	1141                	addi	sp,sp,-16
800041b0:	c622                	sw	s0,12(sp)
800041b2:	0800                	addi	s0,sp,16
800041b4:	c21d                	beqz	a2,800041da <memcmp+0x2c>
800041b6:	962a                	add	a2,a2,a0
800041b8:	00054783          	lbu	a5,0(a0)
800041bc:	0005c703          	lbu	a4,0(a1)
800041c0:	00e79863          	bne	a5,a4,800041d0 <memcmp+0x22>
800041c4:	0505                	addi	a0,a0,1
800041c6:	0585                	addi	a1,a1,1
800041c8:	fea618e3          	bne	a2,a0,800041b8 <memcmp+0xa>
800041cc:	4501                	li	a0,0
800041ce:	a019                	j	800041d4 <memcmp+0x26>
800041d0:	40e78533          	sub	a0,a5,a4
800041d4:	4432                	lw	s0,12(sp)
800041d6:	0141                	addi	sp,sp,16
800041d8:	8082                	ret
800041da:	4501                	li	a0,0
800041dc:	bfe5                	j	800041d4 <memcmp+0x26>

800041de <memmove>:
800041de:	1141                	addi	sp,sp,-16
800041e0:	c622                	sw	s0,12(sp)
800041e2:	0800                	addi	s0,sp,16
800041e4:	ce09                	beqz	a2,800041fe <memmove+0x20>
800041e6:	00a5ef63          	bltu	a1,a0,80004204 <memmove+0x26>
800041ea:	962e                	add	a2,a2,a1
800041ec:	87aa                	mv	a5,a0
800041ee:	0585                	addi	a1,a1,1
800041f0:	0785                	addi	a5,a5,1
800041f2:	fff5c703          	lbu	a4,-1(a1)
800041f6:	fee78fa3          	sb	a4,-1(a5)
800041fa:	fec59ae3          	bne	a1,a2,800041ee <memmove+0x10>
800041fe:	4432                	lw	s0,12(sp)
80004200:	0141                	addi	sp,sp,16
80004202:	8082                	ret
80004204:	00c587b3          	add	a5,a1,a2
80004208:	fef571e3          	bgeu	a0,a5,800041ea <memmove+0xc>
8000420c:	962a                	add	a2,a2,a0
8000420e:	17fd                	addi	a5,a5,-1
80004210:	167d                	addi	a2,a2,-1
80004212:	0007c703          	lbu	a4,0(a5)
80004216:	00e60023          	sb	a4,0(a2)
8000421a:	fef59ae3          	bne	a1,a5,8000420e <memmove+0x30>
8000421e:	b7c5                	j	800041fe <memmove+0x20>

80004220 <memcpy>:
80004220:	1141                	addi	sp,sp,-16
80004222:	c606                	sw	ra,12(sp)
80004224:	c422                	sw	s0,8(sp)
80004226:	0800                	addi	s0,sp,16
80004228:	3f5d                	jal	800041de <memmove>
8000422a:	40b2                	lw	ra,12(sp)
8000422c:	4422                	lw	s0,8(sp)
8000422e:	0141                	addi	sp,sp,16
80004230:	8082                	ret

80004232 <strncmp>:
80004232:	1141                	addi	sp,sp,-16
80004234:	c622                	sw	s0,12(sp)
80004236:	0800                	addi	s0,sp,16
80004238:	ce11                	beqz	a2,80004254 <strncmp+0x22>
8000423a:	00054783          	lbu	a5,0(a0)
8000423e:	cf89                	beqz	a5,80004258 <strncmp+0x26>
80004240:	0005c703          	lbu	a4,0(a1)
80004244:	00f71a63          	bne	a4,a5,80004258 <strncmp+0x26>
80004248:	167d                	addi	a2,a2,-1
8000424a:	0505                	addi	a0,a0,1
8000424c:	0585                	addi	a1,a1,1
8000424e:	f675                	bnez	a2,8000423a <strncmp+0x8>
80004250:	4501                	li	a0,0
80004252:	a801                	j	80004262 <strncmp+0x30>
80004254:	4501                	li	a0,0
80004256:	a031                	j	80004262 <strncmp+0x30>
80004258:	00054503          	lbu	a0,0(a0)
8000425c:	0005c783          	lbu	a5,0(a1)
80004260:	8d1d                	sub	a0,a0,a5
80004262:	4432                	lw	s0,12(sp)
80004264:	0141                	addi	sp,sp,16
80004266:	8082                	ret

80004268 <strncpy>:
80004268:	1141                	addi	sp,sp,-16
8000426a:	c622                	sw	s0,12(sp)
8000426c:	0800                	addi	s0,sp,16
8000426e:	87aa                	mv	a5,a0
80004270:	86b2                	mv	a3,a2
80004272:	167d                	addi	a2,a2,-1
80004274:	02d05563          	blez	a3,8000429e <strncpy+0x36>
80004278:	0585                	addi	a1,a1,1
8000427a:	0785                	addi	a5,a5,1
8000427c:	fff5c703          	lbu	a4,-1(a1)
80004280:	fee78fa3          	sb	a4,-1(a5)
80004284:	f775                	bnez	a4,80004270 <strncpy+0x8>
80004286:	873e                	mv	a4,a5
80004288:	97b6                	add	a5,a5,a3
8000428a:	17fd                	addi	a5,a5,-1
8000428c:	00c05963          	blez	a2,8000429e <strncpy+0x36>
80004290:	0705                	addi	a4,a4,1
80004292:	fe070fa3          	sb	zero,-1(a4)
80004296:	40e786b3          	sub	a3,a5,a4
8000429a:	fed04be3          	bgtz	a3,80004290 <strncpy+0x28>
8000429e:	4432                	lw	s0,12(sp)
800042a0:	0141                	addi	sp,sp,16
800042a2:	8082                	ret

800042a4 <safestrcpy>:
800042a4:	1141                	addi	sp,sp,-16
800042a6:	c622                	sw	s0,12(sp)
800042a8:	0800                	addi	s0,sp,16
800042aa:	02c05163          	blez	a2,800042cc <safestrcpy+0x28>
800042ae:	167d                	addi	a2,a2,-1
800042b0:	00c586b3          	add	a3,a1,a2
800042b4:	87aa                	mv	a5,a0
800042b6:	00d58963          	beq	a1,a3,800042c8 <safestrcpy+0x24>
800042ba:	0585                	addi	a1,a1,1
800042bc:	0785                	addi	a5,a5,1
800042be:	fff5c703          	lbu	a4,-1(a1)
800042c2:	fee78fa3          	sb	a4,-1(a5)
800042c6:	fb65                	bnez	a4,800042b6 <safestrcpy+0x12>
800042c8:	00078023          	sb	zero,0(a5)
800042cc:	4432                	lw	s0,12(sp)
800042ce:	0141                	addi	sp,sp,16
800042d0:	8082                	ret

800042d2 <strlen>:
800042d2:	1141                	addi	sp,sp,-16
800042d4:	c622                	sw	s0,12(sp)
800042d6:	0800                	addi	s0,sp,16
800042d8:	00054783          	lbu	a5,0(a0)
800042dc:	cf81                	beqz	a5,800042f4 <strlen+0x22>
800042de:	872a                	mv	a4,a0
800042e0:	4501                	li	a0,0
800042e2:	0505                	addi	a0,a0,1
800042e4:	00a707b3          	add	a5,a4,a0
800042e8:	0007c783          	lbu	a5,0(a5)
800042ec:	fbfd                	bnez	a5,800042e2 <strlen+0x10>
800042ee:	4432                	lw	s0,12(sp)
800042f0:	0141                	addi	sp,sp,16
800042f2:	8082                	ret
800042f4:	4501                	li	a0,0
800042f6:	bfe5                	j	800042ee <strlen+0x1c>

800042f8 <argfd>:
800042f8:	1101                	addi	sp,sp,-32
800042fa:	ce06                	sw	ra,28(sp)
800042fc:	cc22                	sw	s0,24(sp)
800042fe:	ca26                	sw	s1,20(sp)
80004300:	c84a                	sw	s2,16(sp)
80004302:	1000                	addi	s0,sp,32
80004304:	892e                	mv	s2,a1
80004306:	84b2                	mv	s1,a2
80004308:	fec40593          	addi	a1,s0,-20
8000430c:	4bb000ef          	jal	80004fc6 <argint>
80004310:	fec42703          	lw	a4,-20(s0)
80004314:	47bd                	li	a5,15
80004316:	02e7e963          	bltu	a5,a4,80004348 <argfd+0x50>
8000431a:	8f0fc0ef          	jal	8000040a <myproc>
8000431e:	fec42703          	lw	a4,-20(s0)
80004322:	01870793          	addi	a5,a4,24
80004326:	078a                	slli	a5,a5,0x2
80004328:	953e                	add	a0,a0,a5
8000432a:	455c                	lw	a5,12(a0)
8000432c:	c385                	beqz	a5,8000434c <argfd+0x54>
8000432e:	00090463          	beqz	s2,80004336 <argfd+0x3e>
80004332:	00e92023          	sw	a4,0(s2)
80004336:	4501                	li	a0,0
80004338:	c091                	beqz	s1,8000433c <argfd+0x44>
8000433a:	c09c                	sw	a5,0(s1)
8000433c:	40f2                	lw	ra,28(sp)
8000433e:	4462                	lw	s0,24(sp)
80004340:	44d2                	lw	s1,20(sp)
80004342:	4942                	lw	s2,16(sp)
80004344:	6105                	addi	sp,sp,32
80004346:	8082                	ret
80004348:	557d                	li	a0,-1
8000434a:	bfcd                	j	8000433c <argfd+0x44>
8000434c:	557d                	li	a0,-1
8000434e:	b7fd                	j	8000433c <argfd+0x44>

80004350 <fdalloc>:
80004350:	1141                	addi	sp,sp,-16
80004352:	c606                	sw	ra,12(sp)
80004354:	c422                	sw	s0,8(sp)
80004356:	c226                	sw	s1,4(sp)
80004358:	0800                	addi	s0,sp,16
8000435a:	84aa                	mv	s1,a0
8000435c:	8aefc0ef          	jal	8000040a <myproc>
80004360:	862a                	mv	a2,a0
80004362:	06c50793          	addi	a5,a0,108
80004366:	4501                	li	a0,0
80004368:	46c1                	li	a3,16
8000436a:	4398                	lw	a4,0(a5)
8000436c:	cb19                	beqz	a4,80004382 <fdalloc+0x32>
8000436e:	0505                	addi	a0,a0,1
80004370:	0791                	addi	a5,a5,4
80004372:	fed51ce3          	bne	a0,a3,8000436a <fdalloc+0x1a>
80004376:	557d                	li	a0,-1
80004378:	40b2                	lw	ra,12(sp)
8000437a:	4422                	lw	s0,8(sp)
8000437c:	4492                	lw	s1,4(sp)
8000437e:	0141                	addi	sp,sp,16
80004380:	8082                	ret
80004382:	01850793          	addi	a5,a0,24
80004386:	078a                	slli	a5,a5,0x2
80004388:	963e                	add	a2,a2,a5
8000438a:	c644                	sw	s1,12(a2)
8000438c:	b7f5                	j	80004378 <fdalloc+0x28>

8000438e <create>:
8000438e:	7179                	addi	sp,sp,-48
80004390:	d606                	sw	ra,44(sp)
80004392:	d422                	sw	s0,40(sp)
80004394:	d226                	sw	s1,36(sp)
80004396:	d04a                	sw	s2,32(sp)
80004398:	ce4e                	sw	s3,28(sp)
8000439a:	ca56                	sw	s5,20(sp)
8000439c:	c85a                	sw	s6,16(sp)
8000439e:	1800                	addi	s0,sp,48
800043a0:	8b2e                	mv	s6,a1
800043a2:	89b2                	mv	s3,a2
800043a4:	8936                	mv	s2,a3
800043a6:	fd040593          	addi	a1,s0,-48
800043aa:	b6aff0ef          	jal	80003714 <nameiparent>
800043ae:	84aa                	mv	s1,a0
800043b0:	10050a63          	beqz	a0,800044c4 <create+0x136>
800043b4:	bbdfe0ef          	jal	80002f70 <ilock>
800043b8:	4601                	li	a2,0
800043ba:	fd040593          	addi	a1,s0,-48
800043be:	8526                	mv	a0,s1
800043c0:	8f8ff0ef          	jal	800034b8 <dirlookup>
800043c4:	8aaa                	mv	s5,a0
800043c6:	c129                	beqz	a0,80004408 <create+0x7a>
800043c8:	8526                	mv	a0,s1
800043ca:	da3fe0ef          	jal	8000316c <iunlockput>
800043ce:	8556                	mv	a0,s5
800043d0:	ba1fe0ef          	jal	80002f70 <ilock>
800043d4:	4789                	li	a5,2
800043d6:	02fb1463          	bne	s6,a5,800043fe <create+0x70>
800043da:	028ad783          	lhu	a5,40(s5)
800043de:	17f9                	addi	a5,a5,-2
800043e0:	07c2                	slli	a5,a5,0x10
800043e2:	83c1                	srli	a5,a5,0x10
800043e4:	4705                	li	a4,1
800043e6:	00f76c63          	bltu	a4,a5,800043fe <create+0x70>
800043ea:	8556                	mv	a0,s5
800043ec:	50b2                	lw	ra,44(sp)
800043ee:	5422                	lw	s0,40(sp)
800043f0:	5492                	lw	s1,36(sp)
800043f2:	5902                	lw	s2,32(sp)
800043f4:	49f2                	lw	s3,28(sp)
800043f6:	4ad2                	lw	s5,20(sp)
800043f8:	4b42                	lw	s6,16(sp)
800043fa:	6145                	addi	sp,sp,48
800043fc:	8082                	ret
800043fe:	8556                	mv	a0,s5
80004400:	d6dfe0ef          	jal	8000316c <iunlockput>
80004404:	4a81                	li	s5,0
80004406:	b7d5                	j	800043ea <create+0x5c>
80004408:	cc52                	sw	s4,24(sp)
8000440a:	85da                	mv	a1,s6
8000440c:	4088                	lw	a0,0(s1)
8000440e:	9fdfe0ef          	jal	80002e0a <ialloc>
80004412:	8a2a                	mv	s4,a0
80004414:	cd15                	beqz	a0,80004450 <create+0xc2>
80004416:	b5bfe0ef          	jal	80002f70 <ilock>
8000441a:	033a1523          	sh	s3,42(s4)
8000441e:	032a1623          	sh	s2,44(s4)
80004422:	4905                	li	s2,1
80004424:	032a1723          	sh	s2,46(s4)
80004428:	8552                	mv	a0,s4
8000442a:	a95fe0ef          	jal	80002ebe <iupdate>
8000442e:	032b0763          	beq	s6,s2,8000445c <create+0xce>
80004432:	004a2603          	lw	a2,4(s4)
80004436:	fd040593          	addi	a1,s0,-48
8000443a:	8526                	mv	a0,s1
8000443c:	a2eff0ef          	jal	8000366a <dirlink>
80004440:	06054563          	bltz	a0,800044aa <create+0x11c>
80004444:	8526                	mv	a0,s1
80004446:	d27fe0ef          	jal	8000316c <iunlockput>
8000444a:	8ad2                	mv	s5,s4
8000444c:	4a62                	lw	s4,24(sp)
8000444e:	bf71                	j	800043ea <create+0x5c>
80004450:	8526                	mv	a0,s1
80004452:	d1bfe0ef          	jal	8000316c <iunlockput>
80004456:	8ad2                	mv	s5,s4
80004458:	4a62                	lw	s4,24(sp)
8000445a:	bf41                	j	800043ea <create+0x5c>
8000445c:	004a2603          	lw	a2,4(s4)
80004460:	00003597          	auipc	a1,0x3
80004464:	8c058593          	addi	a1,a1,-1856 # 80006d20 <consoleinit+0x1916>
80004468:	8552                	mv	a0,s4
8000446a:	a00ff0ef          	jal	8000366a <dirlink>
8000446e:	02054e63          	bltz	a0,800044aa <create+0x11c>
80004472:	40d0                	lw	a2,4(s1)
80004474:	00003597          	auipc	a1,0x3
80004478:	8b058593          	addi	a1,a1,-1872 # 80006d24 <consoleinit+0x191a>
8000447c:	8552                	mv	a0,s4
8000447e:	9ecff0ef          	jal	8000366a <dirlink>
80004482:	02054463          	bltz	a0,800044aa <create+0x11c>
80004486:	004a2603          	lw	a2,4(s4)
8000448a:	fd040593          	addi	a1,s0,-48
8000448e:	8526                	mv	a0,s1
80004490:	9daff0ef          	jal	8000366a <dirlink>
80004494:	00054b63          	bltz	a0,800044aa <create+0x11c>
80004498:	02e4d783          	lhu	a5,46(s1)
8000449c:	0785                	addi	a5,a5,1
8000449e:	02f49723          	sh	a5,46(s1)
800044a2:	8526                	mv	a0,s1
800044a4:	a1bfe0ef          	jal	80002ebe <iupdate>
800044a8:	bf71                	j	80004444 <create+0xb6>
800044aa:	020a1723          	sh	zero,46(s4)
800044ae:	8552                	mv	a0,s4
800044b0:	a0ffe0ef          	jal	80002ebe <iupdate>
800044b4:	8552                	mv	a0,s4
800044b6:	cb7fe0ef          	jal	8000316c <iunlockput>
800044ba:	8526                	mv	a0,s1
800044bc:	cb1fe0ef          	jal	8000316c <iunlockput>
800044c0:	4a62                	lw	s4,24(sp)
800044c2:	b725                	j	800043ea <create+0x5c>
800044c4:	8aaa                	mv	s5,a0
800044c6:	b715                	j	800043ea <create+0x5c>

800044c8 <sys_dup>:
800044c8:	1101                	addi	sp,sp,-32
800044ca:	ce06                	sw	ra,28(sp)
800044cc:	cc22                	sw	s0,24(sp)
800044ce:	1000                	addi	s0,sp,32
800044d0:	fec40613          	addi	a2,s0,-20
800044d4:	4581                	li	a1,0
800044d6:	4501                	li	a0,0
800044d8:	3505                	jal	800042f8 <argfd>
800044da:	57fd                	li	a5,-1
800044dc:	02054263          	bltz	a0,80004500 <sys_dup+0x38>
800044e0:	ca26                	sw	s1,20(sp)
800044e2:	c84a                	sw	s2,16(sp)
800044e4:	fec42903          	lw	s2,-20(s0)
800044e8:	854a                	mv	a0,s2
800044ea:	359d                	jal	80004350 <fdalloc>
800044ec:	84aa                	mv	s1,a0
800044ee:	57fd                	li	a5,-1
800044f0:	00054d63          	bltz	a0,8000450a <sys_dup+0x42>
800044f4:	854a                	mv	a0,s2
800044f6:	ab4ff0ef          	jal	800037aa <filedup>
800044fa:	87a6                	mv	a5,s1
800044fc:	44d2                	lw	s1,20(sp)
800044fe:	4942                	lw	s2,16(sp)
80004500:	853e                	mv	a0,a5
80004502:	40f2                	lw	ra,28(sp)
80004504:	4462                	lw	s0,24(sp)
80004506:	6105                	addi	sp,sp,32
80004508:	8082                	ret
8000450a:	44d2                	lw	s1,20(sp)
8000450c:	4942                	lw	s2,16(sp)
8000450e:	bfcd                	j	80004500 <sys_dup+0x38>

80004510 <sys_read>:
80004510:	1101                	addi	sp,sp,-32
80004512:	ce06                	sw	ra,28(sp)
80004514:	cc22                	sw	s0,24(sp)
80004516:	1000                	addi	s0,sp,32
80004518:	fe440593          	addi	a1,s0,-28
8000451c:	4505                	li	a0,1
8000451e:	2c3000ef          	jal	80004fe0 <argaddr>
80004522:	fe840593          	addi	a1,s0,-24
80004526:	4509                	li	a0,2
80004528:	29f000ef          	jal	80004fc6 <argint>
8000452c:	fec40613          	addi	a2,s0,-20
80004530:	4581                	li	a1,0
80004532:	4501                	li	a0,0
80004534:	33d1                	jal	800042f8 <argfd>
80004536:	87aa                	mv	a5,a0
80004538:	557d                	li	a0,-1
8000453a:	0007ca63          	bltz	a5,8000454e <sys_read+0x3e>
8000453e:	fe842603          	lw	a2,-24(s0)
80004542:	fe442583          	lw	a1,-28(s0)
80004546:	fec42503          	lw	a0,-20(s0)
8000454a:	bbcff0ef          	jal	80003906 <fileread>
8000454e:	40f2                	lw	ra,28(sp)
80004550:	4462                	lw	s0,24(sp)
80004552:	6105                	addi	sp,sp,32
80004554:	8082                	ret

80004556 <sys_write>:
80004556:	1101                	addi	sp,sp,-32
80004558:	ce06                	sw	ra,28(sp)
8000455a:	cc22                	sw	s0,24(sp)
8000455c:	1000                	addi	s0,sp,32
8000455e:	fe440593          	addi	a1,s0,-28
80004562:	4505                	li	a0,1
80004564:	27d000ef          	jal	80004fe0 <argaddr>
80004568:	fe840593          	addi	a1,s0,-24
8000456c:	4509                	li	a0,2
8000456e:	259000ef          	jal	80004fc6 <argint>
80004572:	fec40613          	addi	a2,s0,-20
80004576:	4581                	li	a1,0
80004578:	4501                	li	a0,0
8000457a:	3bbd                	jal	800042f8 <argfd>
8000457c:	87aa                	mv	a5,a0
8000457e:	557d                	li	a0,-1
80004580:	0007ca63          	bltz	a5,80004594 <sys_write+0x3e>
80004584:	fe842603          	lw	a2,-24(s0)
80004588:	fe442583          	lw	a1,-28(s0)
8000458c:	fec42503          	lw	a0,-20(s0)
80004590:	c32ff0ef          	jal	800039c2 <filewrite>
80004594:	40f2                	lw	ra,28(sp)
80004596:	4462                	lw	s0,24(sp)
80004598:	6105                	addi	sp,sp,32
8000459a:	8082                	ret

8000459c <sys_close>:
8000459c:	1101                	addi	sp,sp,-32
8000459e:	ce06                	sw	ra,28(sp)
800045a0:	cc22                	sw	s0,24(sp)
800045a2:	1000                	addi	s0,sp,32
800045a4:	fe840613          	addi	a2,s0,-24
800045a8:	fec40593          	addi	a1,s0,-20
800045ac:	4501                	li	a0,0
800045ae:	33a9                	jal	800042f8 <argfd>
800045b0:	57fd                	li	a5,-1
800045b2:	02054063          	bltz	a0,800045d2 <sys_close+0x36>
800045b6:	e55fb0ef          	jal	8000040a <myproc>
800045ba:	fec42783          	lw	a5,-20(s0)
800045be:	07e1                	addi	a5,a5,24
800045c0:	078a                	slli	a5,a5,0x2
800045c2:	953e                	add	a0,a0,a5
800045c4:	00052623          	sw	zero,12(a0)
800045c8:	fe842503          	lw	a0,-24(s0)
800045cc:	a24ff0ef          	jal	800037f0 <fileclose>
800045d0:	4781                	li	a5,0
800045d2:	853e                	mv	a0,a5
800045d4:	40f2                	lw	ra,28(sp)
800045d6:	4462                	lw	s0,24(sp)
800045d8:	6105                	addi	sp,sp,32
800045da:	8082                	ret

800045dc <sys_fstat>:
800045dc:	1101                	addi	sp,sp,-32
800045de:	ce06                	sw	ra,28(sp)
800045e0:	cc22                	sw	s0,24(sp)
800045e2:	1000                	addi	s0,sp,32
800045e4:	fe840593          	addi	a1,s0,-24
800045e8:	4505                	li	a0,1
800045ea:	1f7000ef          	jal	80004fe0 <argaddr>
800045ee:	fec40613          	addi	a2,s0,-20
800045f2:	4581                	li	a1,0
800045f4:	4501                	li	a0,0
800045f6:	3309                	jal	800042f8 <argfd>
800045f8:	87aa                	mv	a5,a0
800045fa:	557d                	li	a0,-1
800045fc:	0007c863          	bltz	a5,8000460c <sys_fstat+0x30>
80004600:	fe842583          	lw	a1,-24(s0)
80004604:	fec42503          	lw	a0,-20(s0)
80004608:	aa2ff0ef          	jal	800038aa <filestat>
8000460c:	40f2                	lw	ra,28(sp)
8000460e:	4462                	lw	s0,24(sp)
80004610:	6105                	addi	sp,sp,32
80004612:	8082                	ret

80004614 <sys_link>:
80004614:	712d                	addi	sp,sp,-288
80004616:	10112e23          	sw	ra,284(sp)
8000461a:	10812c23          	sw	s0,280(sp)
8000461e:	1200                	addi	s0,sp,288
80004620:	08000613          	li	a2,128
80004624:	ee040593          	addi	a1,s0,-288
80004628:	4501                	li	a0,0
8000462a:	1d1000ef          	jal	80004ffa <argstr>
8000462e:	57fd                	li	a5,-1
80004630:	0e054663          	bltz	a0,8000471c <sys_link+0x108>
80004634:	08000613          	li	a2,128
80004638:	f6040593          	addi	a1,s0,-160
8000463c:	4505                	li	a0,1
8000463e:	1bd000ef          	jal	80004ffa <argstr>
80004642:	57fd                	li	a5,-1
80004644:	0c054c63          	bltz	a0,8000471c <sys_link+0x108>
80004648:	10912a23          	sw	s1,276(sp)
8000464c:	909ff0ef          	jal	80003f54 <begin_op>
80004650:	ee040513          	addi	a0,s0,-288
80004654:	8a8ff0ef          	jal	800036fc <namei>
80004658:	84aa                	mv	s1,a0
8000465a:	c935                	beqz	a0,800046ce <sys_link+0xba>
8000465c:	915fe0ef          	jal	80002f70 <ilock>
80004660:	02849703          	lh	a4,40(s1)
80004664:	4785                	li	a5,1
80004666:	06f70a63          	beq	a4,a5,800046da <sys_link+0xc6>
8000466a:	11212823          	sw	s2,272(sp)
8000466e:	02e4d783          	lhu	a5,46(s1)
80004672:	0785                	addi	a5,a5,1
80004674:	02f49723          	sh	a5,46(s1)
80004678:	8526                	mv	a0,s1
8000467a:	845fe0ef          	jal	80002ebe <iupdate>
8000467e:	8526                	mv	a0,s1
80004680:	99dfe0ef          	jal	8000301c <iunlock>
80004684:	fe040593          	addi	a1,s0,-32
80004688:	f6040513          	addi	a0,s0,-160
8000468c:	888ff0ef          	jal	80003714 <nameiparent>
80004690:	892a                	mv	s2,a0
80004692:	c125                	beqz	a0,800046f2 <sys_link+0xde>
80004694:	8ddfe0ef          	jal	80002f70 <ilock>
80004698:	00092703          	lw	a4,0(s2)
8000469c:	409c                	lw	a5,0(s1)
8000469e:	04f71763          	bne	a4,a5,800046ec <sys_link+0xd8>
800046a2:	40d0                	lw	a2,4(s1)
800046a4:	fe040593          	addi	a1,s0,-32
800046a8:	854a                	mv	a0,s2
800046aa:	fc1fe0ef          	jal	8000366a <dirlink>
800046ae:	02054f63          	bltz	a0,800046ec <sys_link+0xd8>
800046b2:	854a                	mv	a0,s2
800046b4:	ab9fe0ef          	jal	8000316c <iunlockput>
800046b8:	8526                	mv	a0,s1
800046ba:	a2ffe0ef          	jal	800030e8 <iput>
800046be:	8ffff0ef          	jal	80003fbc <end_op>
800046c2:	4781                	li	a5,0
800046c4:	11412483          	lw	s1,276(sp)
800046c8:	11012903          	lw	s2,272(sp)
800046cc:	a881                	j	8000471c <sys_link+0x108>
800046ce:	8efff0ef          	jal	80003fbc <end_op>
800046d2:	57fd                	li	a5,-1
800046d4:	11412483          	lw	s1,276(sp)
800046d8:	a091                	j	8000471c <sys_link+0x108>
800046da:	8526                	mv	a0,s1
800046dc:	a91fe0ef          	jal	8000316c <iunlockput>
800046e0:	8ddff0ef          	jal	80003fbc <end_op>
800046e4:	57fd                	li	a5,-1
800046e6:	11412483          	lw	s1,276(sp)
800046ea:	a80d                	j	8000471c <sys_link+0x108>
800046ec:	854a                	mv	a0,s2
800046ee:	a7ffe0ef          	jal	8000316c <iunlockput>
800046f2:	8526                	mv	a0,s1
800046f4:	87dfe0ef          	jal	80002f70 <ilock>
800046f8:	02e4d783          	lhu	a5,46(s1)
800046fc:	17fd                	addi	a5,a5,-1
800046fe:	02f49723          	sh	a5,46(s1)
80004702:	8526                	mv	a0,s1
80004704:	fbafe0ef          	jal	80002ebe <iupdate>
80004708:	8526                	mv	a0,s1
8000470a:	a63fe0ef          	jal	8000316c <iunlockput>
8000470e:	8afff0ef          	jal	80003fbc <end_op>
80004712:	57fd                	li	a5,-1
80004714:	11412483          	lw	s1,276(sp)
80004718:	11012903          	lw	s2,272(sp)
8000471c:	853e                	mv	a0,a5
8000471e:	11c12083          	lw	ra,284(sp)
80004722:	11812403          	lw	s0,280(sp)
80004726:	6115                	addi	sp,sp,288
80004728:	8082                	ret

8000472a <sys_unlink>:
8000472a:	7115                	addi	sp,sp,-224
8000472c:	cf86                	sw	ra,220(sp)
8000472e:	cda2                	sw	s0,216(sp)
80004730:	1180                	addi	s0,sp,224
80004732:	08000613          	li	a2,128
80004736:	f4040593          	addi	a1,s0,-192
8000473a:	4501                	li	a0,0
8000473c:	0bf000ef          	jal	80004ffa <argstr>
80004740:	16054063          	bltz	a0,800048a0 <sys_unlink+0x176>
80004744:	cba6                	sw	s1,212(sp)
80004746:	80fff0ef          	jal	80003f54 <begin_op>
8000474a:	fc040593          	addi	a1,s0,-64
8000474e:	f4040513          	addi	a0,s0,-192
80004752:	fc3fe0ef          	jal	80003714 <nameiparent>
80004756:	84aa                	mv	s1,a0
80004758:	c945                	beqz	a0,80004808 <sys_unlink+0xde>
8000475a:	817fe0ef          	jal	80002f70 <ilock>
8000475e:	00002597          	auipc	a1,0x2
80004762:	5c258593          	addi	a1,a1,1474 # 80006d20 <consoleinit+0x1916>
80004766:	fc040513          	addi	a0,s0,-64
8000476a:	d39fe0ef          	jal	800034a2 <namecmp>
8000476e:	10050e63          	beqz	a0,8000488a <sys_unlink+0x160>
80004772:	00002597          	auipc	a1,0x2
80004776:	5b258593          	addi	a1,a1,1458 # 80006d24 <consoleinit+0x191a>
8000477a:	fc040513          	addi	a0,s0,-64
8000477e:	d25fe0ef          	jal	800034a2 <namecmp>
80004782:	10050463          	beqz	a0,8000488a <sys_unlink+0x160>
80004786:	c9ca                	sw	s2,208(sp)
80004788:	f3c40613          	addi	a2,s0,-196
8000478c:	fc040593          	addi	a1,s0,-64
80004790:	8526                	mv	a0,s1
80004792:	d27fe0ef          	jal	800034b8 <dirlookup>
80004796:	892a                	mv	s2,a0
80004798:	0e050863          	beqz	a0,80004888 <sys_unlink+0x15e>
8000479c:	fd4fe0ef          	jal	80002f70 <ilock>
800047a0:	02e91783          	lh	a5,46(s2)
800047a4:	06f05763          	blez	a5,80004812 <sys_unlink+0xe8>
800047a8:	02891703          	lh	a4,40(s2)
800047ac:	4785                	li	a5,1
800047ae:	06f70963          	beq	a4,a5,80004820 <sys_unlink+0xf6>
800047b2:	4641                	li	a2,16
800047b4:	4581                	li	a1,0
800047b6:	fd040513          	addi	a0,s0,-48
800047ba:	9d9ff0ef          	jal	80004192 <memset>
800047be:	4741                	li	a4,16
800047c0:	f3c42683          	lw	a3,-196(s0)
800047c4:	fd040613          	addi	a2,s0,-48
800047c8:	4581                	li	a1,0
800047ca:	8526                	mv	a0,s1
800047cc:	be9fe0ef          	jal	800033b4 <writei>
800047d0:	47c1                	li	a5,16
800047d2:	08f51b63          	bne	a0,a5,80004868 <sys_unlink+0x13e>
800047d6:	02891703          	lh	a4,40(s2)
800047da:	4785                	li	a5,1
800047dc:	08f70d63          	beq	a4,a5,80004876 <sys_unlink+0x14c>
800047e0:	8526                	mv	a0,s1
800047e2:	98bfe0ef          	jal	8000316c <iunlockput>
800047e6:	02e95783          	lhu	a5,46(s2)
800047ea:	17fd                	addi	a5,a5,-1
800047ec:	02f91723          	sh	a5,46(s2)
800047f0:	854a                	mv	a0,s2
800047f2:	eccfe0ef          	jal	80002ebe <iupdate>
800047f6:	854a                	mv	a0,s2
800047f8:	975fe0ef          	jal	8000316c <iunlockput>
800047fc:	fc0ff0ef          	jal	80003fbc <end_op>
80004800:	4501                	li	a0,0
80004802:	44de                	lw	s1,212(sp)
80004804:	494e                	lw	s2,208(sp)
80004806:	a849                	j	80004898 <sys_unlink+0x16e>
80004808:	fb4ff0ef          	jal	80003fbc <end_op>
8000480c:	557d                	li	a0,-1
8000480e:	44de                	lw	s1,212(sp)
80004810:	a061                	j	80004898 <sys_unlink+0x16e>
80004812:	c7ce                	sw	s3,204(sp)
80004814:	00002517          	auipc	a0,0x2
80004818:	51450513          	addi	a0,a0,1300 # 80006d28 <consoleinit+0x191e>
8000481c:	80cfc0ef          	jal	80000828 <panic>
80004820:	03092703          	lw	a4,48(s2)
80004824:	02000793          	li	a5,32
80004828:	f8e7f5e3          	bgeu	a5,a4,800047b2 <sys_unlink+0x88>
8000482c:	c7ce                	sw	s3,204(sp)
8000482e:	02000993          	li	s3,32
80004832:	4741                	li	a4,16
80004834:	86ce                	mv	a3,s3
80004836:	f2c40613          	addi	a2,s0,-212
8000483a:	4581                	li	a1,0
8000483c:	854a                	mv	a0,s2
8000483e:	a9bfe0ef          	jal	800032d8 <readi>
80004842:	47c1                	li	a5,16
80004844:	00f51c63          	bne	a0,a5,8000485c <sys_unlink+0x132>
80004848:	f2c45783          	lhu	a5,-212(s0)
8000484c:	efa1                	bnez	a5,800048a4 <sys_unlink+0x17a>
8000484e:	09c1                	addi	s3,s3,16
80004850:	03092783          	lw	a5,48(s2)
80004854:	fcf9efe3          	bltu	s3,a5,80004832 <sys_unlink+0x108>
80004858:	49be                	lw	s3,204(sp)
8000485a:	bfa1                	j	800047b2 <sys_unlink+0x88>
8000485c:	00002517          	auipc	a0,0x2
80004860:	4e050513          	addi	a0,a0,1248 # 80006d3c <consoleinit+0x1932>
80004864:	fc5fb0ef          	jal	80000828 <panic>
80004868:	c7ce                	sw	s3,204(sp)
8000486a:	00002517          	auipc	a0,0x2
8000486e:	4e650513          	addi	a0,a0,1254 # 80006d50 <consoleinit+0x1946>
80004872:	fb7fb0ef          	jal	80000828 <panic>
80004876:	02e4d783          	lhu	a5,46(s1)
8000487a:	17fd                	addi	a5,a5,-1
8000487c:	02f49723          	sh	a5,46(s1)
80004880:	8526                	mv	a0,s1
80004882:	e3cfe0ef          	jal	80002ebe <iupdate>
80004886:	bfa9                	j	800047e0 <sys_unlink+0xb6>
80004888:	494e                	lw	s2,208(sp)
8000488a:	8526                	mv	a0,s1
8000488c:	8e1fe0ef          	jal	8000316c <iunlockput>
80004890:	f2cff0ef          	jal	80003fbc <end_op>
80004894:	557d                	li	a0,-1
80004896:	44de                	lw	s1,212(sp)
80004898:	40fe                	lw	ra,220(sp)
8000489a:	446e                	lw	s0,216(sp)
8000489c:	612d                	addi	sp,sp,224
8000489e:	8082                	ret
800048a0:	557d                	li	a0,-1
800048a2:	bfdd                	j	80004898 <sys_unlink+0x16e>
800048a4:	854a                	mv	a0,s2
800048a6:	8c7fe0ef          	jal	8000316c <iunlockput>
800048aa:	494e                	lw	s2,208(sp)
800048ac:	49be                	lw	s3,204(sp)
800048ae:	bff1                	j	8000488a <sys_unlink+0x160>

800048b0 <sys_open>:
800048b0:	7171                	addi	sp,sp,-176
800048b2:	d706                	sw	ra,172(sp)
800048b4:	d522                	sw	s0,168(sp)
800048b6:	1900                	addi	s0,sp,176
800048b8:	f5c40593          	addi	a1,s0,-164
800048bc:	4505                	li	a0,1
800048be:	708000ef          	jal	80004fc6 <argint>
800048c2:	08000613          	li	a2,128
800048c6:	f6040593          	addi	a1,s0,-160
800048ca:	4501                	li	a0,0
800048cc:	72e000ef          	jal	80004ffa <argstr>
800048d0:	87aa                	mv	a5,a0
800048d2:	557d                	li	a0,-1
800048d4:	0a07c063          	bltz	a5,80004974 <sys_open+0xc4>
800048d8:	d326                	sw	s1,164(sp)
800048da:	e7aff0ef          	jal	80003f54 <begin_op>
800048de:	f5c42783          	lw	a5,-164(s0)
800048e2:	2007f793          	andi	a5,a5,512
800048e6:	c3c5                	beqz	a5,80004986 <sys_open+0xd6>
800048e8:	4681                	li	a3,0
800048ea:	4601                	li	a2,0
800048ec:	4589                	li	a1,2
800048ee:	f6040513          	addi	a0,s0,-160
800048f2:	3c71                	jal	8000438e <create>
800048f4:	84aa                	mv	s1,a0
800048f6:	c159                	beqz	a0,8000497c <sys_open+0xcc>
800048f8:	02849703          	lh	a4,40(s1)
800048fc:	478d                	li	a5,3
800048fe:	00f71763          	bne	a4,a5,8000490c <sys_open+0x5c>
80004902:	02a4d703          	lhu	a4,42(s1)
80004906:	47a5                	li	a5,9
80004908:	0ae7ec63          	bltu	a5,a4,800049c0 <sys_open+0x110>
8000490c:	d14a                	sw	s2,160(sp)
8000490e:	e41fe0ef          	jal	8000374e <filealloc>
80004912:	892a                	mv	s2,a0
80004914:	c171                	beqz	a0,800049d8 <sys_open+0x128>
80004916:	cf4e                	sw	s3,156(sp)
80004918:	3c25                	jal	80004350 <fdalloc>
8000491a:	89aa                	mv	s3,a0
8000491c:	0a054a63          	bltz	a0,800049d0 <sys_open+0x120>
80004920:	02849703          	lh	a4,40(s1)
80004924:	478d                	li	a5,3
80004926:	0cf70263          	beq	a4,a5,800049ea <sys_open+0x13a>
8000492a:	4789                	li	a5,2
8000492c:	00f92023          	sw	a5,0(s2)
80004930:	00092a23          	sw	zero,20(s2)
80004934:	00992823          	sw	s1,16(s2)
80004938:	f5c42783          	lw	a5,-164(s0)
8000493c:	0017c713          	xori	a4,a5,1
80004940:	8b05                	andi	a4,a4,1
80004942:	00e90423          	sb	a4,8(s2)
80004946:	0037f713          	andi	a4,a5,3
8000494a:	00e03733          	snez	a4,a4
8000494e:	00e904a3          	sb	a4,9(s2)
80004952:	4007f793          	andi	a5,a5,1024
80004956:	c791                	beqz	a5,80004962 <sys_open+0xb2>
80004958:	02849703          	lh	a4,40(s1)
8000495c:	4789                	li	a5,2
8000495e:	08f70d63          	beq	a4,a5,800049f8 <sys_open+0x148>
80004962:	8526                	mv	a0,s1
80004964:	eb8fe0ef          	jal	8000301c <iunlock>
80004968:	e54ff0ef          	jal	80003fbc <end_op>
8000496c:	854e                	mv	a0,s3
8000496e:	549a                	lw	s1,164(sp)
80004970:	590a                	lw	s2,160(sp)
80004972:	49fa                	lw	s3,156(sp)
80004974:	50ba                	lw	ra,172(sp)
80004976:	542a                	lw	s0,168(sp)
80004978:	614d                	addi	sp,sp,176
8000497a:	8082                	ret
8000497c:	e40ff0ef          	jal	80003fbc <end_op>
80004980:	557d                	li	a0,-1
80004982:	549a                	lw	s1,164(sp)
80004984:	bfc5                	j	80004974 <sys_open+0xc4>
80004986:	f6040513          	addi	a0,s0,-160
8000498a:	d73fe0ef          	jal	800036fc <namei>
8000498e:	84aa                	mv	s1,a0
80004990:	c11d                	beqz	a0,800049b6 <sys_open+0x106>
80004992:	ddefe0ef          	jal	80002f70 <ilock>
80004996:	02849703          	lh	a4,40(s1)
8000499a:	4785                	li	a5,1
8000499c:	f4f71ee3          	bne	a4,a5,800048f8 <sys_open+0x48>
800049a0:	f5c42783          	lw	a5,-164(s0)
800049a4:	d7a5                	beqz	a5,8000490c <sys_open+0x5c>
800049a6:	8526                	mv	a0,s1
800049a8:	fc4fe0ef          	jal	8000316c <iunlockput>
800049ac:	e10ff0ef          	jal	80003fbc <end_op>
800049b0:	557d                	li	a0,-1
800049b2:	549a                	lw	s1,164(sp)
800049b4:	b7c1                	j	80004974 <sys_open+0xc4>
800049b6:	e06ff0ef          	jal	80003fbc <end_op>
800049ba:	557d                	li	a0,-1
800049bc:	549a                	lw	s1,164(sp)
800049be:	bf5d                	j	80004974 <sys_open+0xc4>
800049c0:	8526                	mv	a0,s1
800049c2:	faafe0ef          	jal	8000316c <iunlockput>
800049c6:	df6ff0ef          	jal	80003fbc <end_op>
800049ca:	557d                	li	a0,-1
800049cc:	549a                	lw	s1,164(sp)
800049ce:	b75d                	j	80004974 <sys_open+0xc4>
800049d0:	854a                	mv	a0,s2
800049d2:	e1ffe0ef          	jal	800037f0 <fileclose>
800049d6:	49fa                	lw	s3,156(sp)
800049d8:	8526                	mv	a0,s1
800049da:	f92fe0ef          	jal	8000316c <iunlockput>
800049de:	ddeff0ef          	jal	80003fbc <end_op>
800049e2:	557d                	li	a0,-1
800049e4:	549a                	lw	s1,164(sp)
800049e6:	590a                	lw	s2,160(sp)
800049e8:	b771                	j	80004974 <sys_open+0xc4>
800049ea:	00f92023          	sw	a5,0(s2)
800049ee:	02a49783          	lh	a5,42(s1)
800049f2:	00f91c23          	sh	a5,24(s2)
800049f6:	bf3d                	j	80004934 <sys_open+0x84>
800049f8:	8526                	mv	a0,s1
800049fa:	e62fe0ef          	jal	8000305c <itrunc>
800049fe:	b795                	j	80004962 <sys_open+0xb2>

80004a00 <sys_mkdir>:
80004a00:	7175                	addi	sp,sp,-144
80004a02:	c706                	sw	ra,140(sp)
80004a04:	c522                	sw	s0,136(sp)
80004a06:	0900                	addi	s0,sp,144
80004a08:	d4cff0ef          	jal	80003f54 <begin_op>
80004a0c:	08000613          	li	a2,128
80004a10:	f7040593          	addi	a1,s0,-144
80004a14:	4501                	li	a0,0
80004a16:	23d5                	jal	80004ffa <argstr>
80004a18:	02054363          	bltz	a0,80004a3e <sys_mkdir+0x3e>
80004a1c:	4681                	li	a3,0
80004a1e:	4601                	li	a2,0
80004a20:	4585                	li	a1,1
80004a22:	f7040513          	addi	a0,s0,-144
80004a26:	969ff0ef          	jal	8000438e <create>
80004a2a:	c911                	beqz	a0,80004a3e <sys_mkdir+0x3e>
80004a2c:	f40fe0ef          	jal	8000316c <iunlockput>
80004a30:	d8cff0ef          	jal	80003fbc <end_op>
80004a34:	4501                	li	a0,0
80004a36:	40ba                	lw	ra,140(sp)
80004a38:	442a                	lw	s0,136(sp)
80004a3a:	6149                	addi	sp,sp,144
80004a3c:	8082                	ret
80004a3e:	d7eff0ef          	jal	80003fbc <end_op>
80004a42:	557d                	li	a0,-1
80004a44:	bfcd                	j	80004a36 <sys_mkdir+0x36>

80004a46 <sys_mknod>:
80004a46:	7135                	addi	sp,sp,-160
80004a48:	cf06                	sw	ra,156(sp)
80004a4a:	cd22                	sw	s0,152(sp)
80004a4c:	1100                	addi	s0,sp,160
80004a4e:	d06ff0ef          	jal	80003f54 <begin_op>
80004a52:	f6c40593          	addi	a1,s0,-148
80004a56:	4505                	li	a0,1
80004a58:	23bd                	jal	80004fc6 <argint>
80004a5a:	f6840593          	addi	a1,s0,-152
80004a5e:	4509                	li	a0,2
80004a60:	239d                	jal	80004fc6 <argint>
80004a62:	08000613          	li	a2,128
80004a66:	f7040593          	addi	a1,s0,-144
80004a6a:	4501                	li	a0,0
80004a6c:	2379                	jal	80004ffa <argstr>
80004a6e:	02054563          	bltz	a0,80004a98 <sys_mknod+0x52>
80004a72:	f6841683          	lh	a3,-152(s0)
80004a76:	f6c41603          	lh	a2,-148(s0)
80004a7a:	458d                	li	a1,3
80004a7c:	f7040513          	addi	a0,s0,-144
80004a80:	90fff0ef          	jal	8000438e <create>
80004a84:	c911                	beqz	a0,80004a98 <sys_mknod+0x52>
80004a86:	ee6fe0ef          	jal	8000316c <iunlockput>
80004a8a:	d32ff0ef          	jal	80003fbc <end_op>
80004a8e:	4501                	li	a0,0
80004a90:	40fa                	lw	ra,156(sp)
80004a92:	446a                	lw	s0,152(sp)
80004a94:	610d                	addi	sp,sp,160
80004a96:	8082                	ret
80004a98:	d24ff0ef          	jal	80003fbc <end_op>
80004a9c:	557d                	li	a0,-1
80004a9e:	bfcd                	j	80004a90 <sys_mknod+0x4a>

80004aa0 <sys_chdir>:
80004aa0:	7175                	addi	sp,sp,-144
80004aa2:	c706                	sw	ra,140(sp)
80004aa4:	c522                	sw	s0,136(sp)
80004aa6:	c14a                	sw	s2,128(sp)
80004aa8:	0900                	addi	s0,sp,144
80004aaa:	961fb0ef          	jal	8000040a <myproc>
80004aae:	892a                	mv	s2,a0
80004ab0:	ca4ff0ef          	jal	80003f54 <begin_op>
80004ab4:	08000613          	li	a2,128
80004ab8:	f7040593          	addi	a1,s0,-144
80004abc:	4501                	li	a0,0
80004abe:	2b35                	jal	80004ffa <argstr>
80004ac0:	04054363          	bltz	a0,80004b06 <sys_chdir+0x66>
80004ac4:	c326                	sw	s1,132(sp)
80004ac6:	f7040513          	addi	a0,s0,-144
80004aca:	c33fe0ef          	jal	800036fc <namei>
80004ace:	84aa                	mv	s1,a0
80004ad0:	c915                	beqz	a0,80004b04 <sys_chdir+0x64>
80004ad2:	c9efe0ef          	jal	80002f70 <ilock>
80004ad6:	02849703          	lh	a4,40(s1)
80004ada:	4785                	li	a5,1
80004adc:	02f71963          	bne	a4,a5,80004b0e <sys_chdir+0x6e>
80004ae0:	8526                	mv	a0,s1
80004ae2:	d3afe0ef          	jal	8000301c <iunlock>
80004ae6:	0ac92503          	lw	a0,172(s2)
80004aea:	dfefe0ef          	jal	800030e8 <iput>
80004aee:	cceff0ef          	jal	80003fbc <end_op>
80004af2:	0a992623          	sw	s1,172(s2)
80004af6:	4501                	li	a0,0
80004af8:	449a                	lw	s1,132(sp)
80004afa:	40ba                	lw	ra,140(sp)
80004afc:	442a                	lw	s0,136(sp)
80004afe:	490a                	lw	s2,128(sp)
80004b00:	6149                	addi	sp,sp,144
80004b02:	8082                	ret
80004b04:	449a                	lw	s1,132(sp)
80004b06:	cb6ff0ef          	jal	80003fbc <end_op>
80004b0a:	557d                	li	a0,-1
80004b0c:	b7fd                	j	80004afa <sys_chdir+0x5a>
80004b0e:	8526                	mv	a0,s1
80004b10:	e5cfe0ef          	jal	8000316c <iunlockput>
80004b14:	ca8ff0ef          	jal	80003fbc <end_op>
80004b18:	557d                	li	a0,-1
80004b1a:	449a                	lw	s1,132(sp)
80004b1c:	bff9                	j	80004afa <sys_chdir+0x5a>

80004b1e <sys_exec>:
80004b1e:	7169                	addi	sp,sp,-304
80004b20:	12112623          	sw	ra,300(sp)
80004b24:	12812423          	sw	s0,296(sp)
80004b28:	1a00                	addi	s0,sp,304
80004b2a:	edc40593          	addi	a1,s0,-292
80004b2e:	4505                	li	a0,1
80004b30:	2945                	jal	80004fe0 <argaddr>
80004b32:	08000613          	li	a2,128
80004b36:	f6040593          	addi	a1,s0,-160
80004b3a:	4501                	li	a0,0
80004b3c:	297d                	jal	80004ffa <argstr>
80004b3e:	87aa                	mv	a5,a0
80004b40:	557d                	li	a0,-1
80004b42:	0e07c163          	bltz	a5,80004c24 <sys_exec+0x106>
80004b46:	12912223          	sw	s1,292(sp)
80004b4a:	13212023          	sw	s2,288(sp)
80004b4e:	11312e23          	sw	s3,284(sp)
80004b52:	11412c23          	sw	s4,280(sp)
80004b56:	08000613          	li	a2,128
80004b5a:	4581                	li	a1,0
80004b5c:	ee040513          	addi	a0,s0,-288
80004b60:	e32ff0ef          	jal	80004192 <memset>
80004b64:	ee040493          	addi	s1,s0,-288
80004b68:	89a6                	mv	s3,s1
80004b6a:	4901                	li	s2,0
80004b6c:	02000a13          	li	s4,32
80004b70:	00291513          	slli	a0,s2,0x2
80004b74:	ed840593          	addi	a1,s0,-296
80004b78:	edc42783          	lw	a5,-292(s0)
80004b7c:	953e                	add	a0,a0,a5
80004b7e:	2e7d                	jal	80004f3c <fetchaddr>
80004b80:	02054563          	bltz	a0,80004baa <sys_exec+0x8c>
80004b84:	ed842783          	lw	a5,-296(s0)
80004b88:	c7a1                	beqz	a5,80004bd0 <sys_exec+0xb2>
80004b8a:	995fb0ef          	jal	8000051e <kalloc>
80004b8e:	85aa                	mv	a1,a0
80004b90:	00a9a023          	sw	a0,0(s3)
80004b94:	c919                	beqz	a0,80004baa <sys_exec+0x8c>
80004b96:	6605                	lui	a2,0x1
80004b98:	ed842503          	lw	a0,-296(s0)
80004b9c:	26ed                	jal	80004f86 <fetchstr>
80004b9e:	00054663          	bltz	a0,80004baa <sys_exec+0x8c>
80004ba2:	0905                	addi	s2,s2,1
80004ba4:	0991                	addi	s3,s3,4
80004ba6:	fd4915e3          	bne	s2,s4,80004b70 <sys_exec+0x52>
80004baa:	f6040913          	addi	s2,s0,-160
80004bae:	4088                	lw	a0,0(s1)
80004bb0:	c12d                	beqz	a0,80004c12 <sys_exec+0xf4>
80004bb2:	97ffb0ef          	jal	80000530 <kfree>
80004bb6:	0491                	addi	s1,s1,4
80004bb8:	ff249be3          	bne	s1,s2,80004bae <sys_exec+0x90>
80004bbc:	557d                	li	a0,-1
80004bbe:	12412483          	lw	s1,292(sp)
80004bc2:	12012903          	lw	s2,288(sp)
80004bc6:	11c12983          	lw	s3,284(sp)
80004bca:	11812a03          	lw	s4,280(sp)
80004bce:	a899                	j	80004c24 <sys_exec+0x106>
80004bd0:	090a                	slli	s2,s2,0x2
80004bd2:	fe090793          	addi	a5,s2,-32
80004bd6:	00878933          	add	s2,a5,s0
80004bda:	f0092023          	sw	zero,-256(s2)
80004bde:	ee040593          	addi	a1,s0,-288
80004be2:	f6040513          	addi	a0,s0,-160
80004be6:	ef8fc0ef          	jal	800012de <kexec>
80004bea:	892a                	mv	s2,a0
80004bec:	f6040993          	addi	s3,s0,-160
80004bf0:	4088                	lw	a0,0(s1)
80004bf2:	c511                	beqz	a0,80004bfe <sys_exec+0xe0>
80004bf4:	93dfb0ef          	jal	80000530 <kfree>
80004bf8:	0491                	addi	s1,s1,4
80004bfa:	ff349be3          	bne	s1,s3,80004bf0 <sys_exec+0xd2>
80004bfe:	854a                	mv	a0,s2
80004c00:	12412483          	lw	s1,292(sp)
80004c04:	12012903          	lw	s2,288(sp)
80004c08:	11c12983          	lw	s3,284(sp)
80004c0c:	11812a03          	lw	s4,280(sp)
80004c10:	a811                	j	80004c24 <sys_exec+0x106>
80004c12:	557d                	li	a0,-1
80004c14:	12412483          	lw	s1,292(sp)
80004c18:	12012903          	lw	s2,288(sp)
80004c1c:	11c12983          	lw	s3,284(sp)
80004c20:	11812a03          	lw	s4,280(sp)
80004c24:	12c12083          	lw	ra,300(sp)
80004c28:	12812403          	lw	s0,296(sp)
80004c2c:	6155                	addi	sp,sp,304
80004c2e:	8082                	ret

80004c30 <sys_pipe>:
80004c30:	7179                	addi	sp,sp,-48
80004c32:	d606                	sw	ra,44(sp)
80004c34:	d422                	sw	s0,40(sp)
80004c36:	d226                	sw	s1,36(sp)
80004c38:	1800                	addi	s0,sp,48
80004c3a:	fd0fb0ef          	jal	8000040a <myproc>
80004c3e:	84aa                	mv	s1,a0
80004c40:	fec40593          	addi	a1,s0,-20
80004c44:	4501                	li	a0,0
80004c46:	2e69                	jal	80004fe0 <argaddr>
80004c48:	fe440593          	addi	a1,s0,-28
80004c4c:	fe840513          	addi	a0,s0,-24
80004c50:	e81fe0ef          	jal	80003ad0 <pipealloc>
80004c54:	57fd                	li	a5,-1
80004c56:	0a054463          	bltz	a0,80004cfe <sys_pipe+0xce>
80004c5a:	fef42023          	sw	a5,-32(s0)
80004c5e:	fe842503          	lw	a0,-24(s0)
80004c62:	eeeff0ef          	jal	80004350 <fdalloc>
80004c66:	fea42023          	sw	a0,-32(s0)
80004c6a:	08054163          	bltz	a0,80004cec <sys_pipe+0xbc>
80004c6e:	fe442503          	lw	a0,-28(s0)
80004c72:	edeff0ef          	jal	80004350 <fdalloc>
80004c76:	fca42e23          	sw	a0,-36(s0)
80004c7a:	06054063          	bltz	a0,80004cda <sys_pipe+0xaa>
80004c7e:	4691                	li	a3,4
80004c80:	fe040613          	addi	a2,s0,-32
80004c84:	fec42583          	lw	a1,-20(s0)
80004c88:	54c8                	lw	a0,44(s1)
80004c8a:	bb7fb0ef          	jal	80000840 <copyout>
80004c8e:	00054e63          	bltz	a0,80004caa <sys_pipe+0x7a>
80004c92:	4691                	li	a3,4
80004c94:	fdc40613          	addi	a2,s0,-36
80004c98:	fec42583          	lw	a1,-20(s0)
80004c9c:	0591                	addi	a1,a1,4
80004c9e:	54c8                	lw	a0,44(s1)
80004ca0:	ba1fb0ef          	jal	80000840 <copyout>
80004ca4:	4781                	li	a5,0
80004ca6:	04055c63          	bgez	a0,80004cfe <sys_pipe+0xce>
80004caa:	fe042783          	lw	a5,-32(s0)
80004cae:	07e1                	addi	a5,a5,24
80004cb0:	078a                	slli	a5,a5,0x2
80004cb2:	97a6                	add	a5,a5,s1
80004cb4:	0007a623          	sw	zero,12(a5)
80004cb8:	fdc42783          	lw	a5,-36(s0)
80004cbc:	07e1                	addi	a5,a5,24
80004cbe:	078a                	slli	a5,a5,0x2
80004cc0:	94be                	add	s1,s1,a5
80004cc2:	0004a623          	sw	zero,12(s1)
80004cc6:	fe842503          	lw	a0,-24(s0)
80004cca:	b27fe0ef          	jal	800037f0 <fileclose>
80004cce:	fe442503          	lw	a0,-28(s0)
80004cd2:	b1ffe0ef          	jal	800037f0 <fileclose>
80004cd6:	57fd                	li	a5,-1
80004cd8:	a01d                	j	80004cfe <sys_pipe+0xce>
80004cda:	fe042783          	lw	a5,-32(s0)
80004cde:	0007c763          	bltz	a5,80004cec <sys_pipe+0xbc>
80004ce2:	07e1                	addi	a5,a5,24
80004ce4:	078a                	slli	a5,a5,0x2
80004ce6:	97a6                	add	a5,a5,s1
80004ce8:	0007a623          	sw	zero,12(a5)
80004cec:	fe842503          	lw	a0,-24(s0)
80004cf0:	b01fe0ef          	jal	800037f0 <fileclose>
80004cf4:	fe442503          	lw	a0,-28(s0)
80004cf8:	af9fe0ef          	jal	800037f0 <fileclose>
80004cfc:	57fd                	li	a5,-1
80004cfe:	853e                	mv	a0,a5
80004d00:	50b2                	lw	ra,44(sp)
80004d02:	5422                	lw	s0,40(sp)
80004d04:	5492                	lw	s1,36(sp)
80004d06:	6145                	addi	sp,sp,48
80004d08:	8082                	ret

80004d0a <sys_exit>:
80004d0a:	1101                	addi	sp,sp,-32
80004d0c:	ce06                	sw	ra,28(sp)
80004d0e:	cc22                	sw	s0,24(sp)
80004d10:	1000                	addi	s0,sp,32
80004d12:	fec40593          	addi	a1,s0,-20
80004d16:	4501                	li	a0,0
80004d18:	247d                	jal	80004fc6 <argint>
80004d1a:	fec42503          	lw	a0,-20(s0)
80004d1e:	fb9fb0ef          	jal	80000cd6 <kexit>
80004d22:	4501                	li	a0,0
80004d24:	40f2                	lw	ra,28(sp)
80004d26:	4462                	lw	s0,24(sp)
80004d28:	6105                	addi	sp,sp,32
80004d2a:	8082                	ret

80004d2c <sys_getpid>:
80004d2c:	1141                	addi	sp,sp,-16
80004d2e:	c606                	sw	ra,12(sp)
80004d30:	c422                	sw	s0,8(sp)
80004d32:	0800                	addi	s0,sp,16
80004d34:	ed6fb0ef          	jal	8000040a <myproc>
80004d38:	4d48                	lw	a0,28(a0)
80004d3a:	40b2                	lw	ra,12(sp)
80004d3c:	4422                	lw	s0,8(sp)
80004d3e:	0141                	addi	sp,sp,16
80004d40:	8082                	ret

80004d42 <sys_fork>:
80004d42:	1141                	addi	sp,sp,-16
80004d44:	c606                	sw	ra,12(sp)
80004d46:	c422                	sw	s0,8(sp)
80004d48:	0800                	addi	s0,sp,16
80004d4a:	c74fc0ef          	jal	800011be <kfork>
80004d4e:	40b2                	lw	ra,12(sp)
80004d50:	4422                	lw	s0,8(sp)
80004d52:	0141                	addi	sp,sp,16
80004d54:	8082                	ret

80004d56 <sys_wait>:
80004d56:	1101                	addi	sp,sp,-32
80004d58:	ce06                	sw	ra,28(sp)
80004d5a:	cc22                	sw	s0,24(sp)
80004d5c:	1000                	addi	s0,sp,32
80004d5e:	fec40593          	addi	a1,s0,-20
80004d62:	4501                	li	a0,0
80004d64:	2cb5                	jal	80004fe0 <argaddr>
80004d66:	fec42503          	lw	a0,-20(s0)
80004d6a:	e6dfb0ef          	jal	80000bd6 <kwait>
80004d6e:	40f2                	lw	ra,28(sp)
80004d70:	4462                	lw	s0,24(sp)
80004d72:	6105                	addi	sp,sp,32
80004d74:	8082                	ret

80004d76 <sys_sbrk>:
80004d76:	1101                	addi	sp,sp,-32
80004d78:	ce06                	sw	ra,28(sp)
80004d7a:	cc22                	sw	s0,24(sp)
80004d7c:	ca26                	sw	s1,20(sp)
80004d7e:	1000                	addi	s0,sp,32
80004d80:	fe840593          	addi	a1,s0,-24
80004d84:	4501                	li	a0,0
80004d86:	2481                	jal	80004fc6 <argint>
80004d88:	fec40593          	addi	a1,s0,-20
80004d8c:	4505                	li	a0,1
80004d8e:	2c25                	jal	80004fc6 <argint>
80004d90:	e7afb0ef          	jal	8000040a <myproc>
80004d94:	5504                	lw	s1,40(a0)
80004d96:	fec42703          	lw	a4,-20(s0)
80004d9a:	4785                	li	a5,1
80004d9c:	02f70463          	beq	a4,a5,80004dc4 <sys_sbrk+0x4e>
80004da0:	fe842783          	lw	a5,-24(s0)
80004da4:	0207c063          	bltz	a5,80004dc4 <sys_sbrk+0x4e>
80004da8:	97a6                	add	a5,a5,s1
80004daa:	0297eb63          	bltu	a5,s1,80004de0 <sys_sbrk+0x6a>
80004dae:	7779                	lui	a4,0xffffe
80004db0:	02f76a63          	bltu	a4,a5,80004de4 <sys_sbrk+0x6e>
80004db4:	e56fb0ef          	jal	8000040a <myproc>
80004db8:	551c                	lw	a5,40(a0)
80004dba:	fe842703          	lw	a4,-24(s0)
80004dbe:	97ba                	add	a5,a5,a4
80004dc0:	d51c                	sw	a5,40(a0)
80004dc2:	a039                	j	80004dd0 <sys_sbrk+0x5a>
80004dc4:	fe842503          	lw	a0,-24(s0)
80004dc8:	99bfc0ef          	jal	80001762 <growproc>
80004dcc:	00054863          	bltz	a0,80004ddc <sys_sbrk+0x66>
80004dd0:	8526                	mv	a0,s1
80004dd2:	40f2                	lw	ra,28(sp)
80004dd4:	4462                	lw	s0,24(sp)
80004dd6:	44d2                	lw	s1,20(sp)
80004dd8:	6105                	addi	sp,sp,32
80004dda:	8082                	ret
80004ddc:	54fd                	li	s1,-1
80004dde:	bfcd                	j	80004dd0 <sys_sbrk+0x5a>
80004de0:	54fd                	li	s1,-1
80004de2:	b7fd                	j	80004dd0 <sys_sbrk+0x5a>
80004de4:	54fd                	li	s1,-1
80004de6:	b7ed                	j	80004dd0 <sys_sbrk+0x5a>

80004de8 <sys_pause>:
80004de8:	7179                	addi	sp,sp,-48
80004dea:	d606                	sw	ra,44(sp)
80004dec:	d422                	sw	s0,40(sp)
80004dee:	d04a                	sw	s2,32(sp)
80004df0:	1800                	addi	s0,sp,48
80004df2:	fdc40593          	addi	a1,s0,-36
80004df6:	4501                	li	a0,0
80004df8:	22f9                	jal	80004fc6 <argint>
80004dfa:	fdc42783          	lw	a5,-36(s0)
80004dfe:	0607c763          	bltz	a5,80004e6c <sys_pause+0x84>
80004e02:	00002517          	auipc	a0,0x2
80004e06:	32a50513          	addi	a0,a0,810 # 8000712c <tickslock>
80004e0a:	b2bfd0ef          	jal	80002934 <acquire>
80004e0e:	00002917          	auipc	s2,0x2
80004e12:	1f292903          	lw	s2,498(s2) # 80007000 <ticks>
80004e16:	fdc42783          	lw	a5,-36(s0)
80004e1a:	cf8d                	beqz	a5,80004e54 <sys_pause+0x6c>
80004e1c:	d226                	sw	s1,36(sp)
80004e1e:	ce4e                	sw	s3,28(sp)
80004e20:	00002997          	auipc	s3,0x2
80004e24:	30c98993          	addi	s3,s3,780 # 8000712c <tickslock>
80004e28:	00002497          	auipc	s1,0x2
80004e2c:	1d848493          	addi	s1,s1,472 # 80007000 <ticks>
80004e30:	ddafb0ef          	jal	8000040a <myproc>
80004e34:	804fc0ef          	jal	80000e38 <killed>
80004e38:	ed0d                	bnez	a0,80004e72 <sys_pause+0x8a>
80004e3a:	85ce                	mv	a1,s3
80004e3c:	8526                	mv	a0,s1
80004e3e:	d67fb0ef          	jal	80000ba4 <sleep>
80004e42:	409c                	lw	a5,0(s1)
80004e44:	412787b3          	sub	a5,a5,s2
80004e48:	fdc42703          	lw	a4,-36(s0)
80004e4c:	fee7e2e3          	bltu	a5,a4,80004e30 <sys_pause+0x48>
80004e50:	5492                	lw	s1,36(sp)
80004e52:	49f2                	lw	s3,28(sp)
80004e54:	00002517          	auipc	a0,0x2
80004e58:	2d850513          	addi	a0,a0,728 # 8000712c <tickslock>
80004e5c:	b63fd0ef          	jal	800029be <release>
80004e60:	4501                	li	a0,0
80004e62:	50b2                	lw	ra,44(sp)
80004e64:	5422                	lw	s0,40(sp)
80004e66:	5902                	lw	s2,32(sp)
80004e68:	6145                	addi	sp,sp,48
80004e6a:	8082                	ret
80004e6c:	fc042e23          	sw	zero,-36(s0)
80004e70:	bf49                	j	80004e02 <sys_pause+0x1a>
80004e72:	00002517          	auipc	a0,0x2
80004e76:	2ba50513          	addi	a0,a0,698 # 8000712c <tickslock>
80004e7a:	b45fd0ef          	jal	800029be <release>
80004e7e:	557d                	li	a0,-1
80004e80:	5492                	lw	s1,36(sp)
80004e82:	49f2                	lw	s3,28(sp)
80004e84:	bff9                	j	80004e62 <sys_pause+0x7a>

80004e86 <sys_kill>:
80004e86:	1101                	addi	sp,sp,-32
80004e88:	ce06                	sw	ra,28(sp)
80004e8a:	cc22                	sw	s0,24(sp)
80004e8c:	1000                	addi	s0,sp,32
80004e8e:	fec40593          	addi	a1,s0,-20
80004e92:	4501                	li	a0,0
80004e94:	2a0d                	jal	80004fc6 <argint>
80004e96:	fec42503          	lw	a0,-20(s0)
80004e9a:	eb7fb0ef          	jal	80000d50 <kkill>
80004e9e:	40f2                	lw	ra,28(sp)
80004ea0:	4462                	lw	s0,24(sp)
80004ea2:	6105                	addi	sp,sp,32
80004ea4:	8082                	ret

80004ea6 <sys_uptime>:
80004ea6:	1141                	addi	sp,sp,-16
80004ea8:	c606                	sw	ra,12(sp)
80004eaa:	c422                	sw	s0,8(sp)
80004eac:	c226                	sw	s1,4(sp)
80004eae:	0800                	addi	s0,sp,16
80004eb0:	00002517          	auipc	a0,0x2
80004eb4:	27c50513          	addi	a0,a0,636 # 8000712c <tickslock>
80004eb8:	a7dfd0ef          	jal	80002934 <acquire>
80004ebc:	00002497          	auipc	s1,0x2
80004ec0:	1444a483          	lw	s1,324(s1) # 80007000 <ticks>
80004ec4:	00002517          	auipc	a0,0x2
80004ec8:	26850513          	addi	a0,a0,616 # 8000712c <tickslock>
80004ecc:	af3fd0ef          	jal	800029be <release>
80004ed0:	8526                	mv	a0,s1
80004ed2:	40b2                	lw	ra,12(sp)
80004ed4:	4422                	lw	s0,8(sp)
80004ed6:	4492                	lw	s1,4(sp)
80004ed8:	0141                	addi	sp,sp,16
80004eda:	8082                	ret

80004edc <argraw>:
80004edc:	1141                	addi	sp,sp,-16
80004ede:	c606                	sw	ra,12(sp)
80004ee0:	c422                	sw	s0,8(sp)
80004ee2:	c226                	sw	s1,4(sp)
80004ee4:	0800                	addi	s0,sp,16
80004ee6:	84aa                	mv	s1,a0
80004ee8:	d22fb0ef          	jal	8000040a <myproc>
80004eec:	4795                	li	a5,5
80004eee:	0497e163          	bltu	a5,s1,80004f30 <argraw+0x54>
80004ef2:	048a                	slli	s1,s1,0x2
80004ef4:	00002717          	auipc	a4,0x2
80004ef8:	eac70713          	addi	a4,a4,-340 # 80006da0 <consoleinit+0x1996>
80004efc:	94ba                	add	s1,s1,a4
80004efe:	409c                	lw	a5,0(s1)
80004f00:	97ba                	add	a5,a5,a4
80004f02:	8782                	jr	a5
80004f04:	591c                	lw	a5,48(a0)
80004f06:	5f88                	lw	a0,56(a5)
80004f08:	40b2                	lw	ra,12(sp)
80004f0a:	4422                	lw	s0,8(sp)
80004f0c:	4492                	lw	s1,4(sp)
80004f0e:	0141                	addi	sp,sp,16
80004f10:	8082                	ret
80004f12:	591c                	lw	a5,48(a0)
80004f14:	5fc8                	lw	a0,60(a5)
80004f16:	bfcd                	j	80004f08 <argraw+0x2c>
80004f18:	591c                	lw	a5,48(a0)
80004f1a:	43a8                	lw	a0,64(a5)
80004f1c:	b7f5                	j	80004f08 <argraw+0x2c>
80004f1e:	591c                	lw	a5,48(a0)
80004f20:	43e8                	lw	a0,68(a5)
80004f22:	b7dd                	j	80004f08 <argraw+0x2c>
80004f24:	591c                	lw	a5,48(a0)
80004f26:	47a8                	lw	a0,72(a5)
80004f28:	b7c5                	j	80004f08 <argraw+0x2c>
80004f2a:	591c                	lw	a5,48(a0)
80004f2c:	47e8                	lw	a0,76(a5)
80004f2e:	bfe9                	j	80004f08 <argraw+0x2c>
80004f30:	00002517          	auipc	a0,0x2
80004f34:	e3050513          	addi	a0,a0,-464 # 80006d60 <consoleinit+0x1956>
80004f38:	8f1fb0ef          	jal	80000828 <panic>

80004f3c <fetchaddr>:
80004f3c:	1101                	addi	sp,sp,-32
80004f3e:	ce06                	sw	ra,28(sp)
80004f40:	cc22                	sw	s0,24(sp)
80004f42:	ca26                	sw	s1,20(sp)
80004f44:	c84a                	sw	s2,16(sp)
80004f46:	1000                	addi	s0,sp,32
80004f48:	84aa                	mv	s1,a0
80004f4a:	892e                	mv	s2,a1
80004f4c:	cbefb0ef          	jal	8000040a <myproc>
80004f50:	800007b7          	lui	a5,0x80000
80004f54:	17f1                	addi	a5,a5,-4 # 7ffffffc <_entry-0x4>
80004f56:	0297e463          	bltu	a5,s1,80004f7e <fetchaddr+0x42>
80004f5a:	4691                	li	a3,4
80004f5c:	8626                	mv	a2,s1
80004f5e:	fec40593          	addi	a1,s0,-20
80004f62:	5548                	lw	a0,44(a0)
80004f64:	989fb0ef          	jal	800008ec <copyin>
80004f68:	ed09                	bnez	a0,80004f82 <fetchaddr+0x46>
80004f6a:	fec42783          	lw	a5,-20(s0)
80004f6e:	00f92023          	sw	a5,0(s2)
80004f72:	40f2                	lw	ra,28(sp)
80004f74:	4462                	lw	s0,24(sp)
80004f76:	44d2                	lw	s1,20(sp)
80004f78:	4942                	lw	s2,16(sp)
80004f7a:	6105                	addi	sp,sp,32
80004f7c:	8082                	ret
80004f7e:	557d                	li	a0,-1
80004f80:	bfcd                	j	80004f72 <fetchaddr+0x36>
80004f82:	557d                	li	a0,-1
80004f84:	b7fd                	j	80004f72 <fetchaddr+0x36>

80004f86 <fetchstr>:
80004f86:	1101                	addi	sp,sp,-32
80004f88:	ce06                	sw	ra,28(sp)
80004f8a:	cc22                	sw	s0,24(sp)
80004f8c:	ca26                	sw	s1,20(sp)
80004f8e:	c84a                	sw	s2,16(sp)
80004f90:	c64e                	sw	s3,12(sp)
80004f92:	1000                	addi	s0,sp,32
80004f94:	892a                	mv	s2,a0
80004f96:	84ae                	mv	s1,a1
80004f98:	89b2                	mv	s3,a2
80004f9a:	c70fb0ef          	jal	8000040a <myproc>
80004f9e:	86ce                	mv	a3,s3
80004fa0:	864a                	mv	a2,s2
80004fa2:	85a6                	mv	a1,s1
80004fa4:	5548                	lw	a0,44(a0)
80004fa6:	dd3fb0ef          	jal	80000d78 <copyinstr>
80004faa:	00054c63          	bltz	a0,80004fc2 <fetchstr+0x3c>
80004fae:	8526                	mv	a0,s1
80004fb0:	b22ff0ef          	jal	800042d2 <strlen>
80004fb4:	40f2                	lw	ra,28(sp)
80004fb6:	4462                	lw	s0,24(sp)
80004fb8:	44d2                	lw	s1,20(sp)
80004fba:	4942                	lw	s2,16(sp)
80004fbc:	49b2                	lw	s3,12(sp)
80004fbe:	6105                	addi	sp,sp,32
80004fc0:	8082                	ret
80004fc2:	557d                	li	a0,-1
80004fc4:	bfc5                	j	80004fb4 <fetchstr+0x2e>

80004fc6 <argint>:
80004fc6:	1141                	addi	sp,sp,-16
80004fc8:	c606                	sw	ra,12(sp)
80004fca:	c422                	sw	s0,8(sp)
80004fcc:	c226                	sw	s1,4(sp)
80004fce:	0800                	addi	s0,sp,16
80004fd0:	84ae                	mv	s1,a1
80004fd2:	3729                	jal	80004edc <argraw>
80004fd4:	c088                	sw	a0,0(s1)
80004fd6:	40b2                	lw	ra,12(sp)
80004fd8:	4422                	lw	s0,8(sp)
80004fda:	4492                	lw	s1,4(sp)
80004fdc:	0141                	addi	sp,sp,16
80004fde:	8082                	ret

80004fe0 <argaddr>:
80004fe0:	1141                	addi	sp,sp,-16
80004fe2:	c606                	sw	ra,12(sp)
80004fe4:	c422                	sw	s0,8(sp)
80004fe6:	c226                	sw	s1,4(sp)
80004fe8:	0800                	addi	s0,sp,16
80004fea:	84ae                	mv	s1,a1
80004fec:	3dc5                	jal	80004edc <argraw>
80004fee:	c088                	sw	a0,0(s1)
80004ff0:	40b2                	lw	ra,12(sp)
80004ff2:	4422                	lw	s0,8(sp)
80004ff4:	4492                	lw	s1,4(sp)
80004ff6:	0141                	addi	sp,sp,16
80004ff8:	8082                	ret

80004ffa <argstr>:
80004ffa:	1101                	addi	sp,sp,-32
80004ffc:	ce06                	sw	ra,28(sp)
80004ffe:	cc22                	sw	s0,24(sp)
80005000:	ca26                	sw	s1,20(sp)
80005002:	c84a                	sw	s2,16(sp)
80005004:	1000                	addi	s0,sp,32
80005006:	84ae                	mv	s1,a1
80005008:	8932                	mv	s2,a2
8000500a:	fec40593          	addi	a1,s0,-20
8000500e:	3fc9                	jal	80004fe0 <argaddr>
80005010:	864a                	mv	a2,s2
80005012:	85a6                	mv	a1,s1
80005014:	fec42503          	lw	a0,-20(s0)
80005018:	37bd                	jal	80004f86 <fetchstr>
8000501a:	40f2                	lw	ra,28(sp)
8000501c:	4462                	lw	s0,24(sp)
8000501e:	44d2                	lw	s1,20(sp)
80005020:	4942                	lw	s2,16(sp)
80005022:	6105                	addi	sp,sp,32
80005024:	8082                	ret

80005026 <syscall>:
80005026:	1141                	addi	sp,sp,-16
80005028:	c606                	sw	ra,12(sp)
8000502a:	c422                	sw	s0,8(sp)
8000502c:	c226                	sw	s1,4(sp)
8000502e:	c04a                	sw	s2,0(sp)
80005030:	0800                	addi	s0,sp,16
80005032:	bd8fb0ef          	jal	8000040a <myproc>
80005036:	84aa                	mv	s1,a0
80005038:	03052903          	lw	s2,48(a0)
8000503c:	05492683          	lw	a3,84(s2)
80005040:	fff68713          	addi	a4,a3,-1
80005044:	47d1                	li	a5,20
80005046:	00e7ef63          	bltu	a5,a4,80005064 <syscall+0x3e>
8000504a:	00269713          	slli	a4,a3,0x2
8000504e:	00002797          	auipc	a5,0x2
80005052:	d6a78793          	addi	a5,a5,-662 # 80006db8 <syscalls>
80005056:	97ba                	add	a5,a5,a4
80005058:	439c                	lw	a5,0(a5)
8000505a:	c789                	beqz	a5,80005064 <syscall+0x3e>
8000505c:	9782                	jalr	a5
8000505e:	02a92c23          	sw	a0,56(s2)
80005062:	a829                	j	8000507c <syscall+0x56>
80005064:	0b048613          	addi	a2,s1,176
80005068:	4ccc                	lw	a1,28(s1)
8000506a:	00002517          	auipc	a0,0x2
8000506e:	cfe50513          	addi	a0,a0,-770 # 80006d68 <consoleinit+0x195e>
80005072:	e14fb0ef          	jal	80000686 <printf>
80005076:	589c                	lw	a5,48(s1)
80005078:	577d                	li	a4,-1
8000507a:	df98                	sw	a4,56(a5)
8000507c:	40b2                	lw	ra,12(sp)
8000507e:	4422                	lw	s0,8(sp)
80005080:	4492                	lw	s1,4(sp)
80005082:	4902                	lw	s2,0(sp)
80005084:	0141                	addi	sp,sp,16
80005086:	8082                	ret

80005088 <consolewrite>:
80005088:	7139                	addi	sp,sp,-64
8000508a:	de06                	sw	ra,60(sp)
8000508c:	dc22                	sw	s0,56(sp)
8000508e:	d84a                	sw	s2,48(sp)
80005090:	0080                	addi	s0,sp,64
80005092:	06c05663          	blez	a2,800050fe <consolewrite+0x76>
80005096:	da26                	sw	s1,52(sp)
80005098:	d64e                	sw	s3,44(sp)
8000509a:	d452                	sw	s4,40(sp)
8000509c:	d256                	sw	s5,36(sp)
8000509e:	8a2e                	mv	s4,a1
800050a0:	89b2                	mv	s3,a2
800050a2:	4901                	li	s2,0
800050a4:	02000a93          	li	s5,32
800050a8:	a815                	j	800050dc <consolewrite+0x54>
800050aa:	01490533          	add	a0,s2,s4
800050ae:	00f05f63          	blez	a5,800050cc <consolewrite+0x44>
800050b2:	fc040713          	addi	a4,s0,-64
800050b6:	4781                	li	a5,0
800050b8:	00a786b3          	add	a3,a5,a0
800050bc:	0006c683          	lbu	a3,0(a3)
800050c0:	00d70023          	sb	a3,0(a4)
800050c4:	0785                	addi	a5,a5,1
800050c6:	0705                	addi	a4,a4,1
800050c8:	fe97c8e3          	blt	a5,s1,800050b8 <consolewrite+0x30>
800050cc:	85a6                	mv	a1,s1
800050ce:	fc040513          	addi	a0,s0,-64
800050d2:	c1cfb0ef          	jal	800004ee <uartwrite>
800050d6:	9926                	add	s2,s2,s1
800050d8:	01395963          	bge	s2,s3,800050ea <consolewrite+0x62>
800050dc:	412987b3          	sub	a5,s3,s2
800050e0:	84be                	mv	s1,a5
800050e2:	fcfad4e3          	bge	s5,a5,800050aa <consolewrite+0x22>
800050e6:	84d6                	mv	s1,s5
800050e8:	b7c9                	j	800050aa <consolewrite+0x22>
800050ea:	54d2                	lw	s1,52(sp)
800050ec:	59b2                	lw	s3,44(sp)
800050ee:	5a22                	lw	s4,40(sp)
800050f0:	5a92                	lw	s5,36(sp)
800050f2:	854a                	mv	a0,s2
800050f4:	50f2                	lw	ra,60(sp)
800050f6:	5462                	lw	s0,56(sp)
800050f8:	5942                	lw	s2,48(sp)
800050fa:	6121                	addi	sp,sp,64
800050fc:	8082                	ret
800050fe:	4901                	li	s2,0
80005100:	bfcd                	j	800050f2 <consolewrite+0x6a>

80005102 <consputc>:
80005102:	1141                	addi	sp,sp,-16
80005104:	c606                	sw	ra,12(sp)
80005106:	c422                	sw	s0,8(sp)
80005108:	0800                	addi	s0,sp,16
8000510a:	10000793          	li	a5,256
8000510e:	00f50863          	beq	a0,a5,8000511e <consputc+0x1c>
80005112:	f29fa0ef          	jal	8000003a <putchar>
80005116:	40b2                	lw	ra,12(sp)
80005118:	4422                	lw	s0,8(sp)
8000511a:	0141                	addi	sp,sp,16
8000511c:	8082                	ret
8000511e:	4521                	li	a0,8
80005120:	f1bfa0ef          	jal	8000003a <putchar>
80005124:	02000513          	li	a0,32
80005128:	f13fa0ef          	jal	8000003a <putchar>
8000512c:	4521                	li	a0,8
8000512e:	f0dfa0ef          	jal	8000003a <putchar>
80005132:	b7d5                	j	80005116 <consputc+0x14>

80005134 <consoleread>:
80005134:	7179                	addi	sp,sp,-48
80005136:	d606                	sw	ra,44(sp)
80005138:	d422                	sw	s0,40(sp)
8000513a:	d226                	sw	s1,36(sp)
8000513c:	d04a                	sw	s2,32(sp)
8000513e:	ce4e                	sw	s3,28(sp)
80005140:	cc52                	sw	s4,24(sp)
80005142:	ca56                	sw	s5,20(sp)
80005144:	c85a                	sw	s6,16(sp)
80005146:	c65e                	sw	s7,12(sp)
80005148:	1800                	addi	s0,sp,48
8000514a:	8aae                	mv	s5,a1
8000514c:	8b32                	mv	s6,a2
8000514e:	0000f517          	auipc	a0,0xf
80005152:	2a250513          	addi	a0,a0,674 # 800143f0 <cons>
80005156:	fdefd0ef          	jal	80002934 <acquire>
8000515a:	8a5a                	mv	s4,s6
8000515c:	0000f497          	auipc	s1,0xf
80005160:	29448493          	addi	s1,s1,660 # 800143f0 <cons>
80005164:	59fd                	li	s3,-1
80005166:	9ada                	add	s5,s5,s6
80005168:	4ba9                	li	s7,10
8000516a:	a8a9                	j	800051c4 <consoleread+0x90>
8000516c:	47b5                	li	a5,13
8000516e:	0ef50963          	beq	a0,a5,80005260 <consoleread+0x12c>
80005172:	3f41                	jal	80005102 <consputc>
80005174:	0000f517          	auipc	a0,0xf
80005178:	27c50513          	addi	a0,a0,636 # 800143f0 <cons>
8000517c:	fb8fd0ef          	jal	80002934 <acquire>
80005180:	0e091963          	bnez	s2,80005272 <consoleread+0x13e>
80005184:	0000f717          	auipc	a4,0xf
80005188:	26c70713          	addi	a4,a4,620 # 800143f0 <cons>
8000518c:	08c72783          	lw	a5,140(a4)
80005190:	09072703          	lw	a4,144(a4)
80005194:	0ae78563          	beq	a5,a4,8000523e <consoleread+0x10a>
80005198:	00178713          	addi	a4,a5,1
8000519c:	08e4a623          	sw	a4,140(s1)
800051a0:	07f7f793          	andi	a5,a5,127
800051a4:	97a6                	add	a5,a5,s1
800051a6:	00c7c903          	lbu	s2,12(a5)
800051aa:	8526                	mv	a0,s1
800051ac:	813fd0ef          	jal	800029be <release>
800051b0:	414a87b3          	sub	a5,s5,s4
800051b4:	01278023          	sb	s2,0(a5)
800051b8:	8526                	mv	a0,s1
800051ba:	f7afd0ef          	jal	80002934 <acquire>
800051be:	1a7d                	addi	s4,s4,-1
800051c0:	09790763          	beq	s2,s7,8000524e <consoleread+0x11a>
800051c4:	09405563          	blez	s4,8000524e <consoleread+0x11a>
800051c8:	08c4a783          	lw	a5,140(s1)
800051cc:	0904a703          	lw	a4,144(s1)
800051d0:	fce794e3          	bne	a5,a4,80005198 <consoleread+0x64>
800051d4:	8526                	mv	a0,s1
800051d6:	fe8fd0ef          	jal	800029be <release>
800051da:	e69fa0ef          	jal	80000042 <getchar_impl>
800051de:	892a                	mv	s2,a0
800051e0:	f93516e3          	bne	a0,s3,8000516c <consoleread+0x38>
800051e4:	8526                	mv	a0,s1
800051e6:	f4efd0ef          	jal	80002934 <acquire>
800051ea:	a20fb0ef          	jal	8000040a <myproc>
800051ee:	c4bfb0ef          	jal	80000e38 <killed>
800051f2:	e505                	bnez	a0,8000521a <consoleread+0xe6>
800051f4:	8526                	mv	a0,s1
800051f6:	fc8fd0ef          	jal	800029be <release>
800051fa:	86dfb0ef          	jal	80000a66 <yield>
800051fe:	8526                	mv	a0,s1
80005200:	f34fd0ef          	jal	80002934 <acquire>
80005204:	08c4a703          	lw	a4,140(s1)
80005208:	0904a783          	lw	a5,144(s1)
8000520c:	fcf704e3          	beq	a4,a5,800051d4 <consoleread+0xa0>
80005210:	0000f797          	auipc	a5,0xf
80005214:	26c7a783          	lw	a5,620(a5) # 8001447c <cons+0x8c>
80005218:	b741                	j	80005198 <consoleread+0x64>
8000521a:	0000f517          	auipc	a0,0xf
8000521e:	1d650513          	addi	a0,a0,470 # 800143f0 <cons>
80005222:	f9cfd0ef          	jal	800029be <release>
80005226:	854a                	mv	a0,s2
80005228:	50b2                	lw	ra,44(sp)
8000522a:	5422                	lw	s0,40(sp)
8000522c:	5492                	lw	s1,36(sp)
8000522e:	5902                	lw	s2,32(sp)
80005230:	49f2                	lw	s3,28(sp)
80005232:	4a62                	lw	s4,24(sp)
80005234:	4ad2                	lw	s5,20(sp)
80005236:	4b42                	lw	s6,16(sp)
80005238:	4bb2                	lw	s7,12(sp)
8000523a:	6145                	addi	sp,sp,48
8000523c:	8082                	ret
8000523e:	0000f517          	auipc	a0,0xf
80005242:	1b250513          	addi	a0,a0,434 # 800143f0 <cons>
80005246:	f78fd0ef          	jal	800029be <release>
8000524a:	597d                	li	s2,-1
8000524c:	bfe9                	j	80005226 <consoleread+0xf2>
8000524e:	0000f517          	auipc	a0,0xf
80005252:	1a250513          	addi	a0,a0,418 # 800143f0 <cons>
80005256:	f68fd0ef          	jal	800029be <release>
8000525a:	414b0933          	sub	s2,s6,s4
8000525e:	b7e1                	j	80005226 <consoleread+0xf2>
80005260:	4529                	li	a0,10
80005262:	3545                	jal	80005102 <consputc>
80005264:	0000f517          	auipc	a0,0xf
80005268:	18c50513          	addi	a0,a0,396 # 800143f0 <cons>
8000526c:	ec8fd0ef          	jal	80002934 <acquire>
80005270:	4929                	li	s2,10
80005272:	0000f717          	auipc	a4,0xf
80005276:	17e70713          	addi	a4,a4,382 # 800143f0 <cons>
8000527a:	09472783          	lw	a5,148(a4)
8000527e:	08c72703          	lw	a4,140(a4)
80005282:	40e78733          	sub	a4,a5,a4
80005286:	07f00693          	li	a3,127
8000528a:	eee6ede3          	bltu	a3,a4,80005184 <consoleread+0x50>
8000528e:	00178693          	addi	a3,a5,1
80005292:	0000f717          	auipc	a4,0xf
80005296:	15e70713          	addi	a4,a4,350 # 800143f0 <cons>
8000529a:	08d72a23          	sw	a3,148(a4)
8000529e:	07f7f793          	andi	a5,a5,127
800052a2:	97ba                	add	a5,a5,a4
800052a4:	01278623          	sb	s2,12(a5)
800052a8:	08d72823          	sw	a3,144(a4)
800052ac:	bde1                	j	80005184 <consoleread+0x50>

800052ae <consoleintr>:
800052ae:	1141                	addi	sp,sp,-16
800052b0:	c606                	sw	ra,12(sp)
800052b2:	c422                	sw	s0,8(sp)
800052b4:	c226                	sw	s1,4(sp)
800052b6:	0800                	addi	s0,sp,16
800052b8:	84aa                	mv	s1,a0
800052ba:	0000f517          	auipc	a0,0xf
800052be:	13650513          	addi	a0,a0,310 # 800143f0 <cons>
800052c2:	e72fd0ef          	jal	80002934 <acquire>
800052c6:	47d5                	li	a5,21
800052c8:	08f48b63          	beq	s1,a5,8000535e <consoleintr+0xb0>
800052cc:	0297c563          	blt	a5,s1,800052f6 <consoleintr+0x48>
800052d0:	47a1                	li	a5,8
800052d2:	0cf48f63          	beq	s1,a5,800053b0 <consoleintr+0x102>
800052d6:	47c1                	li	a5,16
800052d8:	0ef49f63          	bne	s1,a5,800053d6 <consoleintr+0x128>
800052dc:	d32fb0ef          	jal	8000080e <procdump>
800052e0:	0000f517          	auipc	a0,0xf
800052e4:	11050513          	addi	a0,a0,272 # 800143f0 <cons>
800052e8:	ed6fd0ef          	jal	800029be <release>
800052ec:	40b2                	lw	ra,12(sp)
800052ee:	4422                	lw	s0,8(sp)
800052f0:	4492                	lw	s1,4(sp)
800052f2:	0141                	addi	sp,sp,16
800052f4:	8082                	ret
800052f6:	07f00793          	li	a5,127
800052fa:	0af48b63          	beq	s1,a5,800053b0 <consoleintr+0x102>
800052fe:	0000f717          	auipc	a4,0xf
80005302:	0f270713          	addi	a4,a4,242 # 800143f0 <cons>
80005306:	09472783          	lw	a5,148(a4)
8000530a:	08c72703          	lw	a4,140(a4)
8000530e:	8f99                	sub	a5,a5,a4
80005310:	07f00713          	li	a4,127
80005314:	fcf766e3          	bltu	a4,a5,800052e0 <consoleintr+0x32>
80005318:	47b5                	li	a5,13
8000531a:	0cf48163          	beq	s1,a5,800053dc <consoleintr+0x12e>
8000531e:	8526                	mv	a0,s1
80005320:	33cd                	jal	80005102 <consputc>
80005322:	0000f797          	auipc	a5,0xf
80005326:	0ce78793          	addi	a5,a5,206 # 800143f0 <cons>
8000532a:	0947a703          	lw	a4,148(a5)
8000532e:	00170693          	addi	a3,a4,1
80005332:	08d7aa23          	sw	a3,148(a5)
80005336:	07f77713          	andi	a4,a4,127
8000533a:	97ba                	add	a5,a5,a4
8000533c:	00978623          	sb	s1,12(a5)
80005340:	47a9                	li	a5,10
80005342:	0af48f63          	beq	s1,a5,80005400 <consoleintr+0x152>
80005346:	4791                	li	a5,4
80005348:	0af48c63          	beq	s1,a5,80005400 <consoleintr+0x152>
8000534c:	0000f797          	auipc	a5,0xf
80005350:	1307a783          	lw	a5,304(a5) # 8001447c <cons+0x8c>
80005354:	f8068713          	addi	a4,a3,-128
80005358:	f8f714e3          	bne	a4,a5,800052e0 <consoleintr+0x32>
8000535c:	a055                	j	80005400 <consoleintr+0x152>
8000535e:	c04a                	sw	s2,0(sp)
80005360:	0000f717          	auipc	a4,0xf
80005364:	09070713          	addi	a4,a4,144 # 800143f0 <cons>
80005368:	09472783          	lw	a5,148(a4)
8000536c:	09072703          	lw	a4,144(a4)
80005370:	0000f497          	auipc	s1,0xf
80005374:	08048493          	addi	s1,s1,128 # 800143f0 <cons>
80005378:	4929                	li	s2,10
8000537a:	02e78763          	beq	a5,a4,800053a8 <consoleintr+0xfa>
8000537e:	17fd                	addi	a5,a5,-1
80005380:	07f7f713          	andi	a4,a5,127
80005384:	9726                	add	a4,a4,s1
80005386:	00c74703          	lbu	a4,12(a4)
8000538a:	03270163          	beq	a4,s2,800053ac <consoleintr+0xfe>
8000538e:	08f4aa23          	sw	a5,148(s1)
80005392:	10000513          	li	a0,256
80005396:	33b5                	jal	80005102 <consputc>
80005398:	0944a783          	lw	a5,148(s1)
8000539c:	0904a703          	lw	a4,144(s1)
800053a0:	fce79fe3          	bne	a5,a4,8000537e <consoleintr+0xd0>
800053a4:	4902                	lw	s2,0(sp)
800053a6:	bf2d                	j	800052e0 <consoleintr+0x32>
800053a8:	4902                	lw	s2,0(sp)
800053aa:	bf1d                	j	800052e0 <consoleintr+0x32>
800053ac:	4902                	lw	s2,0(sp)
800053ae:	bf0d                	j	800052e0 <consoleintr+0x32>
800053b0:	0000f717          	auipc	a4,0xf
800053b4:	04070713          	addi	a4,a4,64 # 800143f0 <cons>
800053b8:	09472783          	lw	a5,148(a4)
800053bc:	09072703          	lw	a4,144(a4)
800053c0:	f2e780e3          	beq	a5,a4,800052e0 <consoleintr+0x32>
800053c4:	17fd                	addi	a5,a5,-1
800053c6:	0000f717          	auipc	a4,0xf
800053ca:	0af72f23          	sw	a5,190(a4) # 80014484 <cons+0x94>
800053ce:	10000513          	li	a0,256
800053d2:	3b05                	jal	80005102 <consputc>
800053d4:	b731                	j	800052e0 <consoleintr+0x32>
800053d6:	f00485e3          	beqz	s1,800052e0 <consoleintr+0x32>
800053da:	b715                	j	800052fe <consoleintr+0x50>
800053dc:	4529                	li	a0,10
800053de:	3315                	jal	80005102 <consputc>
800053e0:	0000f797          	auipc	a5,0xf
800053e4:	01078793          	addi	a5,a5,16 # 800143f0 <cons>
800053e8:	0947a703          	lw	a4,148(a5)
800053ec:	00170693          	addi	a3,a4,1
800053f0:	08d7aa23          	sw	a3,148(a5)
800053f4:	07f77713          	andi	a4,a4,127
800053f8:	97ba                	add	a5,a5,a4
800053fa:	4729                	li	a4,10
800053fc:	00e78623          	sb	a4,12(a5)
80005400:	0000f797          	auipc	a5,0xf
80005404:	08d7a023          	sw	a3,128(a5) # 80014480 <cons+0x90>
80005408:	bde1                	j	800052e0 <consoleintr+0x32>

8000540a <consoleinit>:
8000540a:	1141                	addi	sp,sp,-16
8000540c:	c606                	sw	ra,12(sp)
8000540e:	c422                	sw	s0,8(sp)
80005410:	0800                	addi	s0,sp,16
80005412:	00002597          	auipc	a1,0x2
80005416:	97258593          	addi	a1,a1,-1678 # 80006d84 <consoleinit+0x197a>
8000541a:	0000f517          	auipc	a0,0xf
8000541e:	fd650513          	addi	a0,a0,-42 # 800143f0 <cons>
80005422:	c92fd0ef          	jal	800028b4 <initlock>
80005426:	0000e797          	auipc	a5,0xe
8000542a:	3e678793          	addi	a5,a5,998 # 8001380c <devsw>
8000542e:	00000717          	auipc	a4,0x0
80005432:	d0670713          	addi	a4,a4,-762 # 80005134 <consoleread>
80005436:	c798                	sw	a4,8(a5)
80005438:	00000717          	auipc	a4,0x0
8000543c:	c5070713          	addi	a4,a4,-944 # 80005088 <consolewrite>
80005440:	c7d8                	sw	a4,12(a5)
80005442:	40b2                	lw	ra,12(sp)
80005444:	4422                	lw	s0,8(sp)
80005446:	0141                	addi	sp,sp,16
80005448:	8082                	ret
	...
