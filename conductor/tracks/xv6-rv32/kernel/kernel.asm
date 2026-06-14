
kernel/kernel:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <_entry>:
_entry:
        # set up a stack for C.
        # stack0 is declared in start.c,
        # with a 4096-byte stack per CPU.
        # sp = stack0 + ((hartid + 1) * 4096)
        la sp, stack0
80000000:	000b3117          	auipc	sp,0xb3
80000004:	ec010113          	addi	sp,sp,-320 # 800b2ec0 <stack0>
        li a0, 1024*4
80000008:	6505                	lui	a0,0x1
        csrr a1, mhartid
8000000a:	f14025f3          	csrr	a1,mhartid
        addi a1, a1, 1
8000000e:	0585                	addi	a1,a1,1
        mul a0, a0, a1
80000010:	02b50533          	mul	a0,a0,a1
        add sp, sp, a0
80000014:	912a                	add	sp,sp,a0
        # jump to start() in start.c
        call start
80000016:	2825                	jal	8000004e <start>

80000018 <spin>:
spin:
        j spin
80000018:	a001                	j	80000018 <spin>

8000001a <timerinit>:
// ask each hart to generate timer interrupts.
// Uses SBI TIME extension (0x54494D45), fid=0 (set_timer)
// instead of the Sstc (stimecmp) CSR that xv6 normally uses.
void
timerinit()
{
8000001a:	1141                	addi	sp,sp,-16
8000001c:	c622                	sw	s0,12(sp)
8000001e:	0800                	addi	s0,sp,16

static inline uint32
r_mcounteren()
{
  uint32 x;
  asm volatile("csrr %0, mcounteren" : "=r"(x));
80000020:	306027f3          	csrr	a5,mcounteren
  // Allow supervisor to read the time CSR.
  w_mcounteren(r_mcounteren() | 2);
80000024:	0027e793          	ori	a5,a5,2
  asm volatile("csrw mcounteren, %0" : : "r"(x));
80000028:	30679073          	csrw	mcounteren,a5

  // Schedule the first timer interrupt: current time + ~100ms
  // read the time CSR
  uint32 now;
  asm volatile("csrr %0, time" : "=r"(now));
8000002c:	c0102573          	rdtime	a0
  uint32 next = now + 100000;
80000030:	67e1                	lui	a5,0x18
80000032:	6a078793          	addi	a5,a5,1696 # 186a0 <_entry-0x7ffe7960>
80000036:	953e                	add	a0,a0,a5
  register uint32 r1 asm("a1") = a1;
80000038:	4581                	li	a1,0
  register uint32 r6 asm("a6") = fid;
8000003a:	4801                	li	a6,0
  register uint32 r7 asm("a7") = ext;
8000003c:	544958b7          	lui	a7,0x54495
80000040:	d4588893          	addi	a7,a7,-699 # 54494d45 <_entry-0x2bb6b2bb>
  asm volatile("ecall"
80000044:	00000073          	ecall

  // SBI_TIME set_timer: fid=0, next_time in (a0, a1)
  // For RV32, the timer value may be 64 bits, passed as (lo, hi)
  sbi_ecall(0x54494D45, 0, next, 0);
}
80000048:	4432                	lw	s0,12(sp)
8000004a:	0141                	addi	sp,sp,16
8000004c:	8082                	ret

8000004e <start>:
{
8000004e:	1141                	addi	sp,sp,-16
80000050:	c606                	sw	ra,12(sp)
80000052:	c422                	sw	s0,8(sp)
80000054:	0800                	addi	s0,sp,16
  asm volatile("csrr %0, mstatus" : "=r"(x));
80000056:	300027f3          	csrr	a5,mstatus
  x &= ~MSTATUS_MPP_MASK;
8000005a:	7779                	lui	a4,0xffffe
8000005c:	7ff70713          	addi	a4,a4,2047 # ffffe7ff <end+0x7ff2e283>
80000060:	8ff9                	and	a5,a5,a4
  x |= MSTATUS_MPP_S;
80000062:	6705                	lui	a4,0x1
80000064:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
80000068:	8fd9                	or	a5,a5,a4
  asm volatile("csrw mstatus, %0" : : "r"(x));
8000006a:	30079073          	csrw	mstatus,a5
  asm volatile("csrw mepc, %0" : : "r"(x));
8000006e:	00001797          	auipc	a5,0x1
80000072:	c5c78793          	addi	a5,a5,-932 # 80000cca <main>
80000076:	34179073          	csrw	mepc,a5
  asm volatile("csrw satp, %0" : : "r"(x));
8000007a:	4781                	li	a5,0
8000007c:	18079073          	csrw	satp,a5
  asm volatile("csrw medeleg, %0" : : "r"(x));
80000080:	67c1                	lui	a5,0x10
80000082:	17fd                	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
80000084:	30279073          	csrw	medeleg,a5
  asm volatile("csrw mideleg, %0" : : "r"(x));
80000088:	30379073          	csrw	mideleg,a5
  asm volatile("csrr %0, sie" : "=r"(x));
8000008c:	104027f3          	csrr	a5,sie
  w_sie(r_sie() | SIE_SEIE | SIE_STIE);
80000090:	2207e793          	ori	a5,a5,544
  asm volatile("csrw sie, %0" : : "r"(x));
80000094:	10479073          	csrw	sie,a5
  asm volatile("csrw pmpaddr0, %0" : : "r"(x));
80000098:	57fd                	li	a5,-1
8000009a:	3b079073          	csrw	pmpaddr0,a5
  asm volatile("csrw pmpcfg0, %0" : : "r"(x));
8000009e:	47bd                	li	a5,15
800000a0:	3a079073          	csrw	pmpcfg0,a5
  timerinit();
800000a4:	3f9d                	jal	8000001a <timerinit>
  asm volatile("csrr %0, mhartid" : "=r"(x));
800000a6:	f14027f3          	csrr	a5,mhartid
}

static inline void
w_tp(uint32 x)
{
  asm volatile("mv tp, %0" : : "r"(x));
800000aa:	823e                	mv	tp,a5
  asm volatile("mret");
800000ac:	30200073          	mret
}
800000b0:	40b2                	lw	ra,12(sp)
800000b2:	4422                	lw	s0,8(sp)
800000b4:	0141                	addi	sp,sp,16
800000b6:	8082                	ret

800000b8 <consolewrite>:
// user write() system calls to the console go here.
// uses sleep() and UART interrupts.
//
int
consolewrite(int user_src, uint64 src, int n)
{
800000b8:	715d                	addi	sp,sp,-80
800000ba:	c686                	sw	ra,76(sp)
800000bc:	c4a2                	sw	s0,72(sp)
800000be:	c0ca                	sw	s2,64(sp)
800000c0:	0880                	addi	s0,sp,80
  char buf[32]; // move batches from user space to uart.
  int i = 0;

  while (i < n) {
800000c2:	04c05f63          	blez	a2,80000120 <consolewrite+0x68>
800000c6:	c2a6                	sw	s1,68(sp)
800000c8:	de4e                	sw	s3,60(sp)
800000ca:	dc52                	sw	s4,56(sp)
800000cc:	da56                	sw	s5,52(sp)
800000ce:	d85a                	sw	s6,48(sp)
800000d0:	d65e                	sw	s7,44(sp)
800000d2:	8aaa                	mv	s5,a0
800000d4:	8b2e                	mv	s6,a1
800000d6:	89b2                	mv	s3,a2
  int i = 0;
800000d8:	4901                	li	s2,0
    int nn = sizeof(buf);
    if (nn > n - i)
800000da:	02000a13          	li	s4,32
      nn = n - i;
    if (either_copyin(buf, user_src, src + i, nn) == -1)
800000de:	5bfd                	li	s7,-1
800000e0:	a01d                	j	80000106 <consolewrite+0x4e>
800000e2:	86a6                	mv	a3,s1
800000e4:	01690633          	add	a2,s2,s6
800000e8:	85d6                	mv	a1,s5
800000ea:	fb040513          	addi	a0,s0,-80
800000ee:	725010ef          	jal	80002012 <either_copyin>
800000f2:	03750963          	beq	a0,s7,80000124 <consolewrite+0x6c>
      break;
    uartwrite(buf, nn);
800000f6:	85a6                	mv	a1,s1
800000f8:	fb040513          	addi	a0,s0,-80
800000fc:	788000ef          	jal	80000884 <uartwrite>
    i += nn;
80000100:	9926                	add	s2,s2,s1
  while (i < n) {
80000102:	01395863          	bge	s2,s3,80000112 <consolewrite+0x5a>
    if (nn > n - i)
80000106:	412984b3          	sub	s1,s3,s2
8000010a:	fc9a5ce3          	bge	s4,s1,800000e2 <consolewrite+0x2a>
8000010e:	84d2                	mv	s1,s4
80000110:	bfc9                	j	800000e2 <consolewrite+0x2a>
80000112:	4496                	lw	s1,68(sp)
80000114:	59f2                	lw	s3,60(sp)
80000116:	5a62                	lw	s4,56(sp)
80000118:	5ad2                	lw	s5,52(sp)
8000011a:	5b42                	lw	s6,48(sp)
8000011c:	5bb2                	lw	s7,44(sp)
8000011e:	a809                	j	80000130 <consolewrite+0x78>
  int i = 0;
80000120:	4901                	li	s2,0
  }

  return i;
80000122:	a039                	j	80000130 <consolewrite+0x78>
80000124:	4496                	lw	s1,68(sp)
80000126:	59f2                	lw	s3,60(sp)
80000128:	5a62                	lw	s4,56(sp)
8000012a:	5ad2                	lw	s5,52(sp)
8000012c:	5b42                	lw	s6,48(sp)
8000012e:	5bb2                	lw	s7,44(sp)
}
80000130:	854a                	mv	a0,s2
80000132:	40b6                	lw	ra,76(sp)
80000134:	4426                	lw	s0,72(sp)
80000136:	4906                	lw	s2,64(sp)
80000138:	6161                	addi	sp,sp,80
8000013a:	8082                	ret

8000013c <consoleread>:
// user_dst indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
8000013c:	7179                	addi	sp,sp,-48
8000013e:	d606                	sw	ra,44(sp)
80000140:	d422                	sw	s0,40(sp)
80000142:	d226                	sw	s1,36(sp)
80000144:	d04a                	sw	s2,32(sp)
80000146:	ce4e                	sw	s3,28(sp)
80000148:	cc52                	sw	s4,24(sp)
8000014a:	ca56                	sw	s5,20(sp)
8000014c:	1800                	addi	s0,sp,48
8000014e:	8aaa                	mv	s5,a0
80000150:	8a2e                	mv	s4,a1
80000152:	8932                	mv	s2,a2
  uint target;
  int c;
  char cbuf;

  target = n;
80000154:	89b2                	mv	s3,a2
  acquire(&cons.lock);
80000156:	000bb517          	auipc	a0,0xbb
8000015a:	d6a50513          	addi	a0,a0,-662 # 800baec0 <cons>
8000015e:	151000ef          	jal	80000aae <acquire>
    // Poll for input (since we don't have interrupts)
    uartintr();

    // wait until interrupt handler has put some
    // input into cons.buffer.
    while (cons.r == cons.w) {
80000162:	000bb497          	auipc	s1,0xbb
80000166:	d5e48493          	addi	s1,s1,-674 # 800baec0 <cons>
  while (n > 0) {
8000016a:	0b205963          	blez	s2,8000021c <consoleread+0xe0>
    uartintr();
8000016e:	76a000ef          	jal	800008d8 <uartintr>
    while (cons.r == cons.w) {
80000172:	08c4a783          	lw	a5,140(s1)
80000176:	0904a703          	lw	a4,144(s1)
8000017a:	00e79f63          	bne	a5,a4,80000198 <consoleread+0x5c>
      if (killed(myproc())) {
8000017e:	4d2010ef          	jal	80001650 <myproc>
80000182:	529010ef          	jal	80001eaa <killed>
80000186:	e125                	bnez	a0,800001e6 <consoleread+0xaa>
        release(&cons.lock);
        return -1;
      }
      // Poll again while waiting
      uartintr();
80000188:	750000ef          	jal	800008d8 <uartintr>
    while (cons.r == cons.w) {
8000018c:	08c4a783          	lw	a5,140(s1)
80000190:	0904a703          	lw	a4,144(s1)
80000194:	fee785e3          	beq	a5,a4,8000017e <consoleread+0x42>
80000198:	c85a                	sw	s6,16(sp)
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
8000019a:	000bb717          	auipc	a4,0xbb
8000019e:	d2670713          	addi	a4,a4,-730 # 800baec0 <cons>
800001a2:	00178693          	addi	a3,a5,1
800001a6:	08d72623          	sw	a3,140(a4)
800001aa:	07f7f693          	andi	a3,a5,127
800001ae:	9736                	add	a4,a4,a3
800001b0:	00c74703          	lbu	a4,12(a4)
800001b4:	8b3a                	mv	s6,a4

    if (c == C('D')) { // end-of-file
800001b6:	4691                	li	a3,4
800001b8:	04d70763          	beq	a4,a3,80000206 <consoleread+0xca>
      }
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
800001bc:	fce40fa3          	sb	a4,-33(s0)
    if (either_copyout(user_dst, dst, &cbuf, 1) == -1)
800001c0:	014985b3          	add	a1,s3,s4
800001c4:	4685                	li	a3,1
800001c6:	fdf40613          	addi	a2,s0,-33
800001ca:	412585b3          	sub	a1,a1,s2
800001ce:	8556                	mv	a0,s5
800001d0:	5fb010ef          	jal	80001fca <either_copyout>
800001d4:	57fd                	li	a5,-1
800001d6:	04f50263          	beq	a0,a5,8000021a <consoleread+0xde>
      break;

    dst++;
    --n;
800001da:	197d                	addi	s2,s2,-1

    if (c == '\n') {
800001dc:	47a9                	li	a5,10
800001de:	04fb0863          	beq	s6,a5,8000022e <consoleread+0xf2>
800001e2:	4b42                	lw	s6,16(sp)
800001e4:	b759                	j	8000016a <consoleread+0x2e>
        release(&cons.lock);
800001e6:	000bb517          	auipc	a0,0xbb
800001ea:	cda50513          	addi	a0,a0,-806 # 800baec0 <cons>
800001ee:	145000ef          	jal	80000b32 <release>
        return -1;
800001f2:	557d                	li	a0,-1
    }
  }
  release(&cons.lock);

  return target - n;
}
800001f4:	50b2                	lw	ra,44(sp)
800001f6:	5422                	lw	s0,40(sp)
800001f8:	5492                	lw	s1,36(sp)
800001fa:	5902                	lw	s2,32(sp)
800001fc:	49f2                	lw	s3,28(sp)
800001fe:	4a62                	lw	s4,24(sp)
80000200:	4ad2                	lw	s5,20(sp)
80000202:	6145                	addi	sp,sp,48
80000204:	8082                	ret
      if (n < target) {
80000206:	01397863          	bgeu	s2,s3,80000216 <consoleread+0xda>
        cons.r--;
8000020a:	000bb717          	auipc	a4,0xbb
8000020e:	d4f72123          	sw	a5,-702(a4) # 800baf4c <cons+0x8c>
80000212:	4b42                	lw	s6,16(sp)
80000214:	a021                	j	8000021c <consoleread+0xe0>
80000216:	4b42                	lw	s6,16(sp)
80000218:	a011                	j	8000021c <consoleread+0xe0>
8000021a:	4b42                	lw	s6,16(sp)
  release(&cons.lock);
8000021c:	000bb517          	auipc	a0,0xbb
80000220:	ca450513          	addi	a0,a0,-860 # 800baec0 <cons>
80000224:	10f000ef          	jal	80000b32 <release>
  return target - n;
80000228:	41298533          	sub	a0,s3,s2
8000022c:	b7e1                	j	800001f4 <consoleread+0xb8>
8000022e:	4b42                	lw	s6,16(sp)
80000230:	b7f5                	j	8000021c <consoleread+0xe0>

80000232 <consputc>:
{
80000232:	1141                	addi	sp,sp,-16
80000234:	c606                	sw	ra,12(sp)
80000236:	c422                	sw	s0,8(sp)
80000238:	0800                	addi	s0,sp,16
  if (c == BACKSPACE) {
8000023a:	10000793          	li	a5,256
8000023e:	00f50763          	beq	a0,a5,8000024c <consputc+0x1a>
    uartputc_sync(c);
80000242:	2bcd                	jal	80000834 <uartputc_sync>
}
80000244:	40b2                	lw	ra,12(sp)
80000246:	4422                	lw	s0,8(sp)
80000248:	0141                	addi	sp,sp,16
8000024a:	8082                	ret
    uartputc_sync('\b');
8000024c:	4521                	li	a0,8
8000024e:	23dd                	jal	80000834 <uartputc_sync>
    uartputc_sync(' ');
80000250:	02000513          	li	a0,32
80000254:	23c5                	jal	80000834 <uartputc_sync>
    uartputc_sync('\b');
80000256:	4521                	li	a0,8
80000258:	2bf1                	jal	80000834 <uartputc_sync>
8000025a:	b7ed                	j	80000244 <consputc+0x12>

8000025c <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
8000025c:	1141                	addi	sp,sp,-16
8000025e:	c606                	sw	ra,12(sp)
80000260:	c422                	sw	s0,8(sp)
80000262:	c226                	sw	s1,4(sp)
80000264:	0800                	addi	s0,sp,16
80000266:	84aa                	mv	s1,a0
  acquire(&cons.lock);
80000268:	000bb517          	auipc	a0,0xbb
8000026c:	c5850513          	addi	a0,a0,-936 # 800baec0 <cons>
80000270:	03f000ef          	jal	80000aae <acquire>

  switch (c) {
80000274:	47d5                	li	a5,21
80000276:	08f48b63          	beq	s1,a5,8000030c <consoleintr+0xb0>
8000027a:	0297c563          	blt	a5,s1,800002a4 <consoleintr+0x48>
8000027e:	47a1                	li	a5,8
80000280:	0cf48f63          	beq	s1,a5,8000035e <consoleintr+0x102>
80000284:	47c1                	li	a5,16
80000286:	0ef49f63          	bne	s1,a5,80000384 <consoleintr+0x128>
  case C('P'): // Print process list.
    procdump();
8000028a:	5d1010ef          	jal	8000205a <procdump>
      }
    }
    break;
  }

  release(&cons.lock);
8000028e:	000bb517          	auipc	a0,0xbb
80000292:	c3250513          	addi	a0,a0,-974 # 800baec0 <cons>
80000296:	09d000ef          	jal	80000b32 <release>
}
8000029a:	40b2                	lw	ra,12(sp)
8000029c:	4422                	lw	s0,8(sp)
8000029e:	4492                	lw	s1,4(sp)
800002a0:	0141                	addi	sp,sp,16
800002a2:	8082                	ret
  switch (c) {
800002a4:	07f00793          	li	a5,127
800002a8:	0af48b63          	beq	s1,a5,8000035e <consoleintr+0x102>
    if (c != 0 && cons.e - cons.r < INPUT_BUF_SIZE) {
800002ac:	000bb717          	auipc	a4,0xbb
800002b0:	c1470713          	addi	a4,a4,-1004 # 800baec0 <cons>
800002b4:	09472783          	lw	a5,148(a4)
800002b8:	08c72703          	lw	a4,140(a4)
800002bc:	8f99                	sub	a5,a5,a4
800002be:	07f00713          	li	a4,127
800002c2:	fcf766e3          	bltu	a4,a5,8000028e <consoleintr+0x32>
      c = (c == '\r') ? '\n' : c;
800002c6:	47b5                	li	a5,13
800002c8:	0cf48163          	beq	s1,a5,8000038a <consoleintr+0x12e>
      consputc(c);
800002cc:	8526                	mv	a0,s1
800002ce:	3795                	jal	80000232 <consputc>
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = c;
800002d0:	000bb797          	auipc	a5,0xbb
800002d4:	bf078793          	addi	a5,a5,-1040 # 800baec0 <cons>
800002d8:	0947a703          	lw	a4,148(a5)
800002dc:	00170693          	addi	a3,a4,1
800002e0:	08d7aa23          	sw	a3,148(a5)
800002e4:	07f77713          	andi	a4,a4,127
800002e8:	97ba                	add	a5,a5,a4
800002ea:	00978623          	sb	s1,12(a5)
      if (c == '\n' || c == C('D') || cons.e - cons.r == INPUT_BUF_SIZE) {
800002ee:	47a9                	li	a5,10
800002f0:	0af48f63          	beq	s1,a5,800003ae <consoleintr+0x152>
800002f4:	4791                	li	a5,4
800002f6:	0af48c63          	beq	s1,a5,800003ae <consoleintr+0x152>
800002fa:	000bb797          	auipc	a5,0xbb
800002fe:	c527a783          	lw	a5,-942(a5) # 800baf4c <cons+0x8c>
80000302:	f8068713          	addi	a4,a3,-128
80000306:	f8f714e3          	bne	a4,a5,8000028e <consoleintr+0x32>
8000030a:	a055                	j	800003ae <consoleintr+0x152>
8000030c:	c04a                	sw	s2,0(sp)
    while (cons.e != cons.w &&
8000030e:	000bb717          	auipc	a4,0xbb
80000312:	bb270713          	addi	a4,a4,-1102 # 800baec0 <cons>
80000316:	09472783          	lw	a5,148(a4)
8000031a:	09072703          	lw	a4,144(a4)
           cons.buf[(cons.e - 1) % INPUT_BUF_SIZE] != '\n') {
8000031e:	000bb497          	auipc	s1,0xbb
80000322:	ba248493          	addi	s1,s1,-1118 # 800baec0 <cons>
    while (cons.e != cons.w &&
80000326:	4929                	li	s2,10
80000328:	02e78763          	beq	a5,a4,80000356 <consoleintr+0xfa>
           cons.buf[(cons.e - 1) % INPUT_BUF_SIZE] != '\n') {
8000032c:	17fd                	addi	a5,a5,-1
8000032e:	07f7f713          	andi	a4,a5,127
80000332:	9726                	add	a4,a4,s1
    while (cons.e != cons.w &&
80000334:	00c74703          	lbu	a4,12(a4)
80000338:	03270163          	beq	a4,s2,8000035a <consoleintr+0xfe>
      cons.e--;
8000033c:	08f4aa23          	sw	a5,148(s1)
      consputc(BACKSPACE);
80000340:	10000513          	li	a0,256
80000344:	35fd                	jal	80000232 <consputc>
    while (cons.e != cons.w &&
80000346:	0944a783          	lw	a5,148(s1)
8000034a:	0904a703          	lw	a4,144(s1)
8000034e:	fce79fe3          	bne	a5,a4,8000032c <consoleintr+0xd0>
80000352:	4902                	lw	s2,0(sp)
80000354:	bf2d                	j	8000028e <consoleintr+0x32>
80000356:	4902                	lw	s2,0(sp)
80000358:	bf1d                	j	8000028e <consoleintr+0x32>
8000035a:	4902                	lw	s2,0(sp)
8000035c:	bf0d                	j	8000028e <consoleintr+0x32>
    if (cons.e != cons.w) {
8000035e:	000bb717          	auipc	a4,0xbb
80000362:	b6270713          	addi	a4,a4,-1182 # 800baec0 <cons>
80000366:	09472783          	lw	a5,148(a4)
8000036a:	09072703          	lw	a4,144(a4)
8000036e:	f2e780e3          	beq	a5,a4,8000028e <consoleintr+0x32>
      cons.e--;
80000372:	17fd                	addi	a5,a5,-1
80000374:	000bb717          	auipc	a4,0xbb
80000378:	bef72023          	sw	a5,-1056(a4) # 800baf54 <cons+0x94>
      consputc(BACKSPACE);
8000037c:	10000513          	li	a0,256
80000380:	3d4d                	jal	80000232 <consputc>
80000382:	b731                	j	8000028e <consoleintr+0x32>
    if (c != 0 && cons.e - cons.r < INPUT_BUF_SIZE) {
80000384:	f00485e3          	beqz	s1,8000028e <consoleintr+0x32>
80000388:	b715                	j	800002ac <consoleintr+0x50>
      consputc(c);
8000038a:	4529                	li	a0,10
8000038c:	355d                	jal	80000232 <consputc>
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = c;
8000038e:	000bb797          	auipc	a5,0xbb
80000392:	b3278793          	addi	a5,a5,-1230 # 800baec0 <cons>
80000396:	0947a703          	lw	a4,148(a5)
8000039a:	00170693          	addi	a3,a4,1
8000039e:	08d7aa23          	sw	a3,148(a5)
800003a2:	07f77713          	andi	a4,a4,127
800003a6:	97ba                	add	a5,a5,a4
800003a8:	4729                	li	a4,10
800003aa:	00e78623          	sb	a4,12(a5)
        cons.w = cons.e;
800003ae:	000bb797          	auipc	a5,0xbb
800003b2:	bad7a123          	sw	a3,-1118(a5) # 800baf50 <cons+0x90>
        wakeup(&cons.r);
800003b6:	000bb517          	auipc	a0,0xbb
800003ba:	b9650513          	addi	a0,a0,-1130 # 800baf4c <cons+0x8c>
800003be:	109010ef          	jal	80001cc6 <wakeup>
800003c2:	b5f1                	j	8000028e <consoleintr+0x32>

800003c4 <consoleinit>:

void
consoleinit(void)
{
800003c4:	1141                	addi	sp,sp,-16
800003c6:	c606                	sw	ra,12(sp)
800003c8:	c422                	sw	s0,8(sp)
800003ca:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
800003cc:	0000b597          	auipc	a1,0xb
800003d0:	c3458593          	addi	a1,a1,-972 # 8000b000 <etext>
800003d4:	000bb517          	auipc	a0,0xbb
800003d8:	aec50513          	addi	a0,a0,-1300 # 800baec0 <cons>
800003dc:	2d89                	jal	80000a2e <initlock>

  uartinit();
800003de:	2915                	jal	80000812 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
800003e0:	000c7797          	auipc	a5,0xc7
800003e4:	55078793          	addi	a5,a5,1360 # 800c7930 <devsw>
800003e8:	00000717          	auipc	a4,0x0
800003ec:	d5470713          	addi	a4,a4,-684 # 8000013c <consoleread>
800003f0:	c798                	sw	a4,8(a5)
  devsw[CONSOLE].write = consolewrite;
800003f2:	00000717          	auipc	a4,0x0
800003f6:	cc670713          	addi	a4,a4,-826 # 800000b8 <consolewrite>
800003fa:	c7d8                	sw	a4,12(a5)
}
800003fc:	40b2                	lw	ra,12(sp)
800003fe:	4422                	lw	s0,8(sp)
80000400:	0141                	addi	sp,sp,16
80000402:	8082                	ret

80000404 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(long long xx, int base, int sign)
{
80000404:	711d                	addi	sp,sp,-96
80000406:	ce86                	sw	ra,92(sp)
80000408:	cca2                	sw	s0,88(sp)
8000040a:	caa6                	sw	s1,84(sp)
8000040c:	c8ca                	sw	s2,80(sp)
8000040e:	c6ce                	sw	s3,76(sp)
80000410:	c4d2                	sw	s4,72(sp)
80000412:	c2d6                	sw	s5,68(sp)
80000414:	c0da                	sw	s6,64(sp)
80000416:	de5e                	sw	s7,60(sp)
80000418:	dc62                	sw	s8,56(sp)
8000041a:	da66                	sw	s9,52(sp)
8000041c:	d86a                	sw	s10,48(sp)
8000041e:	d66e                	sw	s11,44(sp)
80000420:	1080                	addi	s0,sp,96
80000422:	8daa                	mv	s11,a0
80000424:	84ae                	mv	s1,a1
80000426:	8ab2                	mv	s5,a2
  char buf[20];
  int i;
  unsigned long long x;

  if (sign && (sign = (xx < 0)))
80000428:	c299                	beqz	a3,8000042e <printint+0x2a>
8000042a:	0a05c463          	bltz	a1,800004d2 <printint+0xce>
    x = -xx;
  else
    x = xx;
8000042e:	4c81                	li	s9,0

  i = 0;
80000430:	4901                	li	s2,0
  do {
    buf[i++] = digits[x % base];
80000432:	8d56                	mv	s10,s5
80000434:	41fad993          	srai	s3,s5,0x1f
80000438:	0000bb17          	auipc	s6,0xb
8000043c:	1d4b0b13          	addi	s6,s6,468 # 8000b60c <digits>
80000440:	8c4a                	mv	s8,s2
80000442:	0905                	addi	s2,s2,1
80000444:	fac40793          	addi	a5,s0,-84
80000448:	01278a33          	add	s4,a5,s2
8000044c:	8656                	mv	a2,s5
8000044e:	86ce                	mv	a3,s3
80000450:	856e                	mv	a0,s11
80000452:	85a6                	mv	a1,s1
80000454:	7fd080ef          	jal	80009450 <__umoddi3>
80000458:	955a                	add	a0,a0,s6
8000045a:	00054783          	lbu	a5,0(a0)
8000045e:	fefa0fa3          	sb	a5,-1(s4)
  } while ((x /= base) != 0);
80000462:	8bee                	mv	s7,s11
80000464:	8a26                	mv	s4,s1
80000466:	8656                	mv	a2,s5
80000468:	86ce                	mv	a3,s3
8000046a:	856e                	mv	a0,s11
8000046c:	85a6                	mv	a1,s1
8000046e:	485080ef          	jal	800090f2 <__udivdi3>
80000472:	8daa                	mv	s11,a0
80000474:	84ae                	mv	s1,a1
80000476:	013a6663          	bltu	s4,s3,80000482 <printint+0x7e>
8000047a:	fd4993e3          	bne	s3,s4,80000440 <printint+0x3c>
8000047e:	fdabf1e3          	bgeu	s7,s10,80000440 <printint+0x3c>

  if (sign)
80000482:	000c8c63          	beqz	s9,8000049a <printint+0x96>
    buf[i++] = '-';
80000486:	fc090793          	addi	a5,s2,-64
8000048a:	008784b3          	add	s1,a5,s0
8000048e:	02d00793          	li	a5,45
80000492:	fef48623          	sb	a5,-20(s1)
80000496:	002c0913          	addi	s2,s8,2

  while (--i >= 0)
8000049a:	01205d63          	blez	s2,800004b4 <printint+0xb0>
8000049e:	fac40793          	addi	a5,s0,-84
800004a2:	012784b3          	add	s1,a5,s2
800004a6:	893e                	mv	s2,a5
    consputc(buf[i]);
800004a8:	fff4c503          	lbu	a0,-1(s1)
800004ac:	3359                	jal	80000232 <consputc>
  while (--i >= 0)
800004ae:	14fd                	addi	s1,s1,-1
800004b0:	ff249ce3          	bne	s1,s2,800004a8 <printint+0xa4>
}
800004b4:	40f6                	lw	ra,92(sp)
800004b6:	4466                	lw	s0,88(sp)
800004b8:	44d6                	lw	s1,84(sp)
800004ba:	4946                	lw	s2,80(sp)
800004bc:	49b6                	lw	s3,76(sp)
800004be:	4a26                	lw	s4,72(sp)
800004c0:	4a96                	lw	s5,68(sp)
800004c2:	4b06                	lw	s6,64(sp)
800004c4:	5bf2                	lw	s7,60(sp)
800004c6:	5c62                	lw	s8,56(sp)
800004c8:	5cd2                	lw	s9,52(sp)
800004ca:	5d42                	lw	s10,48(sp)
800004cc:	5db2                	lw	s11,44(sp)
800004ce:	6125                	addi	sp,sp,96
800004d0:	8082                	ret
    x = -xx;
800004d2:	00a037b3          	snez	a5,a0
800004d6:	40b004b3          	neg	s1,a1
800004da:	40a00db3          	neg	s11,a0
800004de:	8c9d                	sub	s1,s1,a5
  if (sign && (sign = (xx < 0)))
800004e0:	4c85                	li	s9,1
    x = -xx;
800004e2:	b7b9                	j	80000430 <printint+0x2c>

800004e4 <printf>:
}

// Print to the console.
int
printf(char *fmt, ...)
{
800004e4:	7159                	addi	sp,sp,-112
800004e6:	c686                	sw	ra,76(sp)
800004e8:	c4a2                	sw	s0,72(sp)
800004ea:	c0ca                	sw	s2,64(sp)
800004ec:	0880                	addi	s0,sp,80
800004ee:	892a                	mv	s2,a0
800004f0:	c04c                	sw	a1,4(s0)
800004f2:	c410                	sw	a2,8(s0)
800004f4:	c454                	sw	a3,12(s0)
800004f6:	c818                	sw	a4,16(s0)
800004f8:	c85c                	sw	a5,20(s0)
800004fa:	01042c23          	sw	a6,24(s0)
800004fe:	01142e23          	sw	a7,28(s0)
  va_list ap;
  int i, cx, c0, c1, c2;
  char *s;

  if (panicking == 0)
80000502:	000b3797          	auipc	a5,0xb3
80000506:	9a27a783          	lw	a5,-1630(a5) # 800b2ea4 <panicking>
8000050a:	c3a9                	beqz	a5,8000054c <printf+0x68>
    acquire(&pr.lock);

  va_start(ap, fmt);
8000050c:	00440793          	addi	a5,s0,4
80000510:	faf42e23          	sw	a5,-68(s0)
  for (i = 0; (cx = fmt[i] & 0xff) != 0; i++) {
80000514:	00094503          	lbu	a0,0(s2)
80000518:	26050f63          	beqz	a0,80000796 <printf+0x2b2>
8000051c:	c2a6                	sw	s1,68(sp)
8000051e:	de4e                	sw	s3,60(sp)
80000520:	dc52                	sw	s4,56(sp)
80000522:	da56                	sw	s5,52(sp)
80000524:	d85a                	sw	s6,48(sp)
80000526:	d65e                	sw	s7,44(sp)
80000528:	d462                	sw	s8,40(sp)
8000052a:	d06a                	sw	s10,32(sp)
8000052c:	ce6e                	sw	s11,28(sp)
8000052e:	4981                	li	s3,0
80000530:	4701                	li	a4,0
    if (cx != '%') {
80000532:	02500a93          	li	s5,37
    c1 = c2 = 0;
    if (c0)
      c1 = fmt[i + 1] & 0xff;
    if (c1)
      c2 = fmt[i + 2] & 0xff;
    if (c0 == 'd') {
80000536:	06400b13          	li	s6,100
      printint(va_arg(ap, int), 10, 1);
    } else if (c0 == 'l' && c1 == 'd') {
8000053a:	06c00b93          	li	s7,108
      printint(va_arg(ap, uint32), 10, 1);
      i += 1;
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'd') {
      printint(va_arg(ap, uint64), 10, 1);
      i += 2;
    } else if (c0 == 'u') {
8000053e:	07500c13          	li	s8,117
      printint(va_arg(ap, uint32), 10, 0);
      i += 1;
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'u') {
      printint(va_arg(ap, uint64), 10, 0);
      i += 2;
    } else if (c0 == 'x') {
80000542:	07800d13          	li	s10,120
      printint(va_arg(ap, uint32), 16, 0);
      i += 1;
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'x') {
      printint(va_arg(ap, uint64), 16, 0);
      i += 2;
    } else if (c0 == 'p') {
80000546:	07000d93          	li	s11,112
8000054a:	a015                	j	8000056e <printf+0x8a>
    acquire(&pr.lock);
8000054c:	000bb517          	auipc	a0,0xbb
80000550:	a0c50513          	addi	a0,a0,-1524 # 800baf58 <pr>
80000554:	2ba9                	jal	80000aae <acquire>
80000556:	bf5d                	j	8000050c <printf+0x28>
      consputc(cx);
80000558:	39e9                	jal	80000232 <consputc>
      continue;
8000055a:	84ce                	mv	s1,s3
  for (i = 0; (cx = fmt[i] & 0xff) != 0; i++) {
8000055c:	00148993          	addi	s3,s1,1
80000560:	874e                	mv	a4,s3
80000562:	013907b3          	add	a5,s2,s3
80000566:	0007c503          	lbu	a0,0(a5)
8000056a:	20050363          	beqz	a0,80000770 <printf+0x28c>
    if (cx != '%') {
8000056e:	ff5515e3          	bne	a0,s5,80000558 <printf+0x74>
    i++;
80000572:	00198493          	addi	s1,s3,1
    c0 = fmt[i + 0] & 0xff;
80000576:	009907b3          	add	a5,s2,s1
8000057a:	0007ca03          	lbu	s4,0(a5)
    if (c0)
8000057e:	200a0363          	beqz	s4,80000784 <printf+0x2a0>
      c1 = fmt[i + 1] & 0xff;
80000582:	00e907b3          	add	a5,s2,a4
80000586:	0027c783          	lbu	a5,2(a5)
    c1 = c2 = 0;
8000058a:	86be                	mv	a3,a5
    if (c1)
8000058c:	c781                	beqz	a5,80000594 <printf+0xb0>
      c2 = fmt[i + 2] & 0xff;
8000058e:	974a                	add	a4,a4,s2
80000590:	00374683          	lbu	a3,3(a4)
    if (c0 == 'd') {
80000594:	036a0863          	beq	s4,s6,800005c4 <printf+0xe0>
    } else if (c0 == 'l' && c1 == 'd') {
80000598:	057a0363          	beq	s4,s7,800005de <printf+0xfa>
    } else if (c0 == 'u') {
8000059c:	0d8a0463          	beq	s4,s8,80000664 <printf+0x180>
    } else if (c0 == 'x') {
800005a0:	11aa0a63          	beq	s4,s10,800006b4 <printf+0x1d0>
    } else if (c0 == 'p') {
800005a4:	15ba0263          	beq	s4,s11,800006e8 <printf+0x204>
      printptr(va_arg(ap, uint32));
    } else if (c0 == 'c') {
800005a8:	06300793          	li	a5,99
800005ac:	16fa0e63          	beq	s4,a5,80000728 <printf+0x244>
      consputc(va_arg(ap, uint));
    } else if (c0 == 's') {
800005b0:	07300793          	li	a5,115
800005b4:	18fa0363          	beq	s4,a5,8000073a <printf+0x256>
      if ((s = va_arg(ap, char *)) == 0)
        s = "(null)";
      for (; *s; s++)
        consputc(*s);
    } else if (c0 == '%') {
800005b8:	035a1b63          	bne	s4,s5,800005ee <printf+0x10a>
      consputc('%');
800005bc:	02500513          	li	a0,37
800005c0:	398d                	jal	80000232 <consputc>
800005c2:	bf69                	j	8000055c <printf+0x78>
      printint(va_arg(ap, int), 10, 1);
800005c4:	fbc42783          	lw	a5,-68(s0)
800005c8:	00478713          	addi	a4,a5,4
800005cc:	fae42e23          	sw	a4,-68(s0)
800005d0:	4388                	lw	a0,0(a5)
800005d2:	4685                	li	a3,1
800005d4:	4629                	li	a2,10
800005d6:	41f55593          	srai	a1,a0,0x1f
800005da:	352d                	jal	80000404 <printint>
800005dc:	b741                	j	8000055c <printf+0x78>
    } else if (c0 == 'l' && c1 == 'd') {
800005de:	01678d63          	beq	a5,s6,800005f8 <printf+0x114>
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'd') {
800005e2:	03778963          	beq	a5,s7,80000614 <printf+0x130>
    } else if (c0 == 'l' && c1 == 'u') {
800005e6:	09878b63          	beq	a5,s8,8000067c <printf+0x198>
    } else if (c0 == 'l' && c1 == 'x') {
800005ea:	0fa78163          	beq	a5,s10,800006cc <printf+0x1e8>
    } else if (c0 == 0) {
      break;
    } else {
      // Print unknown % sequence to draw attention.
      consputc('%');
800005ee:	8556                	mv	a0,s5
800005f0:	3189                	jal	80000232 <consputc>
      consputc(c0);
800005f2:	8552                	mv	a0,s4
800005f4:	393d                	jal	80000232 <consputc>
800005f6:	b79d                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint32), 10, 1);
800005f8:	fbc42783          	lw	a5,-68(s0)
800005fc:	00478713          	addi	a4,a5,4
80000600:	fae42e23          	sw	a4,-68(s0)
80000604:	4685                	li	a3,1
80000606:	4629                	li	a2,10
80000608:	4388                	lw	a0,0(a5)
8000060a:	4581                	li	a1,0
8000060c:	3be5                	jal	80000404 <printint>
      i += 1;
8000060e:	00298493          	addi	s1,s3,2
80000612:	b7a9                	j	8000055c <printf+0x78>
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'd') {
80000614:	06400793          	li	a5,100
80000618:	02f68863          	beq	a3,a5,80000648 <printf+0x164>
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'u') {
8000061c:	07500793          	li	a5,117
80000620:	06f68c63          	beq	a3,a5,80000698 <printf+0x1b4>
    } else if (c0 == 'l' && c1 == 'l' && c2 == 'x') {
80000624:	07800793          	li	a5,120
80000628:	fcf693e3          	bne	a3,a5,800005ee <printf+0x10a>
      printint(va_arg(ap, uint64), 16, 0);
8000062c:	fbc42783          	lw	a5,-68(s0)
80000630:	00478713          	addi	a4,a5,4
80000634:	fae42e23          	sw	a4,-68(s0)
80000638:	4681                	li	a3,0
8000063a:	4641                	li	a2,16
8000063c:	4388                	lw	a0,0(a5)
8000063e:	4581                	li	a1,0
80000640:	33d1                	jal	80000404 <printint>
      i += 2;
80000642:	00398493          	addi	s1,s3,3
80000646:	bf19                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint64), 10, 1);
80000648:	fbc42783          	lw	a5,-68(s0)
8000064c:	00478713          	addi	a4,a5,4
80000650:	fae42e23          	sw	a4,-68(s0)
80000654:	4685                	li	a3,1
80000656:	4629                	li	a2,10
80000658:	4388                	lw	a0,0(a5)
8000065a:	4581                	li	a1,0
8000065c:	3365                	jal	80000404 <printint>
      i += 2;
8000065e:	00398493          	addi	s1,s3,3
80000662:	bded                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint32), 10, 0);
80000664:	fbc42783          	lw	a5,-68(s0)
80000668:	00478713          	addi	a4,a5,4
8000066c:	fae42e23          	sw	a4,-68(s0)
80000670:	4681                	li	a3,0
80000672:	4629                	li	a2,10
80000674:	4388                	lw	a0,0(a5)
80000676:	4581                	li	a1,0
80000678:	3371                	jal	80000404 <printint>
8000067a:	b5cd                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint32), 10, 0);
8000067c:	fbc42783          	lw	a5,-68(s0)
80000680:	00478713          	addi	a4,a5,4
80000684:	fae42e23          	sw	a4,-68(s0)
80000688:	4681                	li	a3,0
8000068a:	4629                	li	a2,10
8000068c:	4388                	lw	a0,0(a5)
8000068e:	4581                	li	a1,0
80000690:	3b95                	jal	80000404 <printint>
      i += 1;
80000692:	00298493          	addi	s1,s3,2
80000696:	b5d9                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint64), 10, 0);
80000698:	fbc42783          	lw	a5,-68(s0)
8000069c:	00478713          	addi	a4,a5,4
800006a0:	fae42e23          	sw	a4,-68(s0)
800006a4:	4681                	li	a3,0
800006a6:	4629                	li	a2,10
800006a8:	4388                	lw	a0,0(a5)
800006aa:	4581                	li	a1,0
800006ac:	3ba1                	jal	80000404 <printint>
      i += 2;
800006ae:	00398493          	addi	s1,s3,3
800006b2:	b56d                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint32), 16, 0);
800006b4:	fbc42783          	lw	a5,-68(s0)
800006b8:	00478713          	addi	a4,a5,4
800006bc:	fae42e23          	sw	a4,-68(s0)
800006c0:	4681                	li	a3,0
800006c2:	4641                	li	a2,16
800006c4:	4388                	lw	a0,0(a5)
800006c6:	4581                	li	a1,0
800006c8:	3b35                	jal	80000404 <printint>
800006ca:	bd49                	j	8000055c <printf+0x78>
      printint(va_arg(ap, uint32), 16, 0);
800006cc:	fbc42783          	lw	a5,-68(s0)
800006d0:	00478713          	addi	a4,a5,4
800006d4:	fae42e23          	sw	a4,-68(s0)
800006d8:	4681                	li	a3,0
800006da:	4641                	li	a2,16
800006dc:	4388                	lw	a0,0(a5)
800006de:	4581                	li	a1,0
800006e0:	3315                	jal	80000404 <printint>
      i += 1;
800006e2:	00298493          	addi	s1,s3,2
800006e6:	bd9d                	j	8000055c <printf+0x78>
800006e8:	d266                	sw	s9,36(sp)
      printptr(va_arg(ap, uint32));
800006ea:	fbc42783          	lw	a5,-68(s0)
800006ee:	00478713          	addi	a4,a5,4
800006f2:	fae42e23          	sw	a4,-68(s0)
800006f6:	0007aa03          	lw	s4,0(a5)
  consputc('0');
800006fa:	03000513          	li	a0,48
800006fe:	3e15                	jal	80000232 <consputc>
  consputc('x');
80000700:	07800513          	li	a0,120
80000704:	363d                	jal	80000232 <consputc>
80000706:	49a1                	li	s3,8
    consputc(digits[x >> 28]);
80000708:	0000bc97          	auipc	s9,0xb
8000070c:	f04c8c93          	addi	s9,s9,-252 # 8000b60c <digits>
80000710:	01ca5793          	srli	a5,s4,0x1c
80000714:	97e6                	add	a5,a5,s9
80000716:	0007c503          	lbu	a0,0(a5)
8000071a:	3e21                	jal	80000232 <consputc>
  for (i = 0; i < 8; i++, x <<= 4)
8000071c:	0a12                	slli	s4,s4,0x4
8000071e:	19fd                	addi	s3,s3,-1
80000720:	fe0998e3          	bnez	s3,80000710 <printf+0x22c>
80000724:	5c92                	lw	s9,36(sp)
80000726:	bd1d                	j	8000055c <printf+0x78>
      consputc(va_arg(ap, uint));
80000728:	fbc42783          	lw	a5,-68(s0)
8000072c:	00478713          	addi	a4,a5,4
80000730:	fae42e23          	sw	a4,-68(s0)
80000734:	4388                	lw	a0,0(a5)
80000736:	3cf5                	jal	80000232 <consputc>
80000738:	b515                	j	8000055c <printf+0x78>
      if ((s = va_arg(ap, char *)) == 0)
8000073a:	fbc42783          	lw	a5,-68(s0)
8000073e:	00478713          	addi	a4,a5,4
80000742:	fae42e23          	sw	a4,-68(s0)
80000746:	0007a983          	lw	s3,0(a5)
8000074a:	00098c63          	beqz	s3,80000762 <printf+0x27e>
      for (; *s; s++)
8000074e:	0009c503          	lbu	a0,0(s3)
80000752:	e00505e3          	beqz	a0,8000055c <printf+0x78>
        consputc(*s);
80000756:	3cf1                	jal	80000232 <consputc>
      for (; *s; s++)
80000758:	0985                	addi	s3,s3,1
8000075a:	0009c503          	lbu	a0,0(s3)
8000075e:	fd65                	bnez	a0,80000756 <printf+0x272>
80000760:	bbf5                	j	8000055c <printf+0x78>
        s = "(null)";
80000762:	0000b997          	auipc	s3,0xb
80000766:	8a698993          	addi	s3,s3,-1882 # 8000b008 <etext+0x8>
      for (; *s; s++)
8000076a:	02800513          	li	a0,40
8000076e:	b7e5                	j	80000756 <printf+0x272>
80000770:	4496                	lw	s1,68(sp)
80000772:	59f2                	lw	s3,60(sp)
80000774:	5a62                	lw	s4,56(sp)
80000776:	5ad2                	lw	s5,52(sp)
80000778:	5b42                	lw	s6,48(sp)
8000077a:	5bb2                	lw	s7,44(sp)
8000077c:	5c22                	lw	s8,40(sp)
8000077e:	5d02                	lw	s10,32(sp)
80000780:	4df2                	lw	s11,28(sp)
80000782:	a811                	j	80000796 <printf+0x2b2>
80000784:	4496                	lw	s1,68(sp)
80000786:	59f2                	lw	s3,60(sp)
80000788:	5a62                	lw	s4,56(sp)
8000078a:	5ad2                	lw	s5,52(sp)
8000078c:	5b42                	lw	s6,48(sp)
8000078e:	5bb2                	lw	s7,44(sp)
80000790:	5c22                	lw	s8,40(sp)
80000792:	5d02                	lw	s10,32(sp)
80000794:	4df2                	lw	s11,28(sp)
    }
  }
  va_end(ap);

  if (panicking == 0)
80000796:	000b2797          	auipc	a5,0xb2
8000079a:	70e7a783          	lw	a5,1806(a5) # 800b2ea4 <panicking>
8000079e:	c799                	beqz	a5,800007ac <printf+0x2c8>
    release(&pr.lock);

  return 0;
}
800007a0:	4501                	li	a0,0
800007a2:	40b6                	lw	ra,76(sp)
800007a4:	4426                	lw	s0,72(sp)
800007a6:	4906                	lw	s2,64(sp)
800007a8:	6165                	addi	sp,sp,112
800007aa:	8082                	ret
    release(&pr.lock);
800007ac:	000ba517          	auipc	a0,0xba
800007b0:	7ac50513          	addi	a0,a0,1964 # 800baf58 <pr>
800007b4:	2ebd                	jal	80000b32 <release>
  return 0;
800007b6:	b7ed                	j	800007a0 <printf+0x2bc>

800007b8 <panic>:

void
panic(char *s)
{
800007b8:	1141                	addi	sp,sp,-16
800007ba:	c606                	sw	ra,12(sp)
800007bc:	c422                	sw	s0,8(sp)
800007be:	c226                	sw	s1,4(sp)
800007c0:	c04a                	sw	s2,0(sp)
800007c2:	0800                	addi	s0,sp,16
800007c4:	84aa                	mv	s1,a0
  panicking = 1;
800007c6:	4905                	li	s2,1
800007c8:	000b2797          	auipc	a5,0xb2
800007cc:	6d27ae23          	sw	s2,1756(a5) # 800b2ea4 <panicking>
  printf("panic: ");
800007d0:	0000b517          	auipc	a0,0xb
800007d4:	84450513          	addi	a0,a0,-1980 # 8000b014 <etext+0x14>
800007d8:	3331                	jal	800004e4 <printf>
  printf("%s\n", s);
800007da:	85a6                	mv	a1,s1
800007dc:	0000b517          	auipc	a0,0xb
800007e0:	84050513          	addi	a0,a0,-1984 # 8000b01c <etext+0x1c>
800007e4:	3301                	jal	800004e4 <printf>
  panicked = 1; // freeze uart output from other CPUs
800007e6:	000b2797          	auipc	a5,0xb2
800007ea:	6b27ad23          	sw	s2,1722(a5) # 800b2ea0 <panicked>
  for (;;)
800007ee:	a001                	j	800007ee <panic+0x36>

800007f0 <printfinit>:
    ;
}

void
printfinit(void)
{
800007f0:	1141                	addi	sp,sp,-16
800007f2:	c606                	sw	ra,12(sp)
800007f4:	c422                	sw	s0,8(sp)
800007f6:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
800007f8:	0000b597          	auipc	a1,0xb
800007fc:	82858593          	addi	a1,a1,-2008 # 8000b020 <etext+0x20>
80000800:	000ba517          	auipc	a0,0xba
80000804:	75850513          	addi	a0,a0,1880 # 800baf58 <pr>
80000808:	241d                	jal	80000a2e <initlock>
}
8000080a:	40b2                	lw	ra,12(sp)
8000080c:	4422                	lw	s0,8(sp)
8000080e:	0141                	addi	sp,sp,16
80000810:	8082                	ret

80000812 <uartinit>:
  return r0; // return value is in a0
}

void
uartinit(void)
{
80000812:	1141                	addi	sp,sp,-16
80000814:	c606                	sw	ra,12(sp)
80000816:	c422                	sw	s0,8(sp)
80000818:	0800                	addi	s0,sp,16
  initlock(&tx_lock, "uart");
8000081a:	0000b597          	auipc	a1,0xb
8000081e:	80a58593          	addi	a1,a1,-2038 # 8000b024 <etext+0x24>
80000822:	000ba517          	auipc	a0,0xba
80000826:	74250513          	addi	a0,a0,1858 # 800baf64 <tx_lock>
8000082a:	2411                	jal	80000a2e <initlock>
  tx_busy = 0;
}
8000082c:	40b2                	lw	ra,12(sp)
8000082e:	4422                	lw	s0,8(sp)
80000830:	0141                	addi	sp,sp,16
80000832:	8082                	ret

80000834 <uartputc_sync>:

// write a byte via SBI DBCN
void
uartputc_sync(int c)
{
80000834:	1141                	addi	sp,sp,-16
80000836:	c606                	sw	ra,12(sp)
80000838:	c422                	sw	s0,8(sp)
8000083a:	c226                	sw	s1,4(sp)
8000083c:	0800                	addi	s0,sp,16
8000083e:	84aa                	mv	s1,a0
  if (panicking == 0)
80000840:	000b2797          	auipc	a5,0xb2
80000844:	6647a783          	lw	a5,1636(a5) # 800b2ea4 <panicking>
80000848:	c799                	beqz	a5,80000856 <uartputc_sync+0x22>
    push_off();

  if (panicked) {
8000084a:	000b2797          	auipc	a5,0xb2
8000084e:	6567a783          	lw	a5,1622(a5) # 800b2ea0 <panicked>
80000852:	c781                	beqz	a5,8000085a <uartputc_sync+0x26>
    for (;;)
80000854:	a001                	j	80000854 <uartputc_sync+0x20>
    push_off();
80000856:	2c21                	jal	80000a6e <push_off>
80000858:	bfcd                	j	8000084a <uartputc_sync+0x16>
  register uint32 r0 asm("a0") = a0;
8000085a:	8526                	mv	a0,s1
  register uint32 r1 asm("a1") = a1;
8000085c:	4581                	li	a1,0
  register uint32 r6 asm("a6") = fid;
8000085e:	4809                	li	a6,2
  register uint32 r7 asm("a7") = ext;
80000860:	444248b7          	lui	a7,0x44424
80000864:	34e88893          	addi	a7,a7,846 # 4442434e <_entry-0x3bbdbcb2>
  asm volatile("ecall"
80000868:	00000073          	ecall
  }

  // SBI DBCN console_write_byte (ext=0x4442434E, fid=2, a0=char)
  sbi_ecall(0x4442434E, 2, (uint32)c, 0);

  if (panicking == 0)
8000086c:	000b2797          	auipc	a5,0xb2
80000870:	6387a783          	lw	a5,1592(a5) # 800b2ea4 <panicking>
80000874:	c791                	beqz	a5,80000880 <uartputc_sync+0x4c>
    pop_off();
}
80000876:	40b2                	lw	ra,12(sp)
80000878:	4422                	lw	s0,8(sp)
8000087a:	4492                	lw	s1,4(sp)
8000087c:	0141                	addi	sp,sp,16
8000087e:	8082                	ret
    pop_off();
80000880:	249d                	jal	80000ae6 <pop_off>
}
80000882:	bfd5                	j	80000876 <uartputc_sync+0x42>

80000884 <uartwrite>:

// transmit buf[] via SBI DBCN
void
uartwrite(char buf[], int n)
{
80000884:	1141                	addi	sp,sp,-16
80000886:	c606                	sw	ra,12(sp)
80000888:	c422                	sw	s0,8(sp)
8000088a:	c226                	sw	s1,4(sp)
8000088c:	c04a                	sw	s2,0(sp)
8000088e:	0800                	addi	s0,sp,16
80000890:	84aa                	mv	s1,a0
80000892:	892e                	mv	s2,a1
  acquire(&tx_lock);
80000894:	000ba517          	auipc	a0,0xba
80000898:	6d050513          	addi	a0,a0,1744 # 800baf64 <tx_lock>
8000089c:	2c09                	jal	80000aae <acquire>

  int i;
  for (i = 0; i < n; i++) {
8000089e:	03205263          	blez	s2,800008c2 <uartwrite+0x3e>
800008a2:	87a6                	mv	a5,s1
800008a4:	01248733          	add	a4,s1,s2
  register uint32 r7 asm("a7") = ext;
800008a8:	444248b7          	lui	a7,0x44424
800008ac:	34e88893          	addi	a7,a7,846 # 4442434e <_entry-0x3bbdbcb2>
    // no TX-complete interrupt to wait for with SBI DBCN
    sbi_ecall(0x4442434E, 2, (uint32)buf[i], 0);
800008b0:	0007c503          	lbu	a0,0(a5)
  register uint32 r1 asm("a1") = a1;
800008b4:	4581                	li	a1,0
  register uint32 r6 asm("a6") = fid;
800008b6:	4809                	li	a6,2
  asm volatile("ecall"
800008b8:	00000073          	ecall
  for (i = 0; i < n; i++) {
800008bc:	0785                	addi	a5,a5,1
800008be:	fee799e3          	bne	a5,a4,800008b0 <uartwrite+0x2c>
  }

  release(&tx_lock);
800008c2:	000ba517          	auipc	a0,0xba
800008c6:	6a250513          	addi	a0,a0,1698 # 800baf64 <tx_lock>
800008ca:	24a5                	jal	80000b32 <release>
}
800008cc:	40b2                	lw	ra,12(sp)
800008ce:	4422                	lw	s0,8(sp)
800008d0:	4492                	lw	s1,4(sp)
800008d2:	4902                	lw	s2,0(sp)
800008d4:	0141                	addi	sp,sp,16
800008d6:	8082                	ret

800008d8 <uartintr>:
}

// handle a uart interrupt
void
uartintr(void)
{
800008d8:	1141                	addi	sp,sp,-16
800008da:	c606                	sw	ra,12(sp)
800008dc:	c422                	sw	s0,8(sp)
800008de:	c226                	sw	s1,4(sp)
800008e0:	c04a                	sw	s2,0(sp)
800008e2:	0800                	addi	s0,sp,16
  register uint32 r7 asm("a7") = 0x4442434E; // SBI_EXT_DBCN
800008e4:	444244b7          	lui	s1,0x44424
800008e8:	34e48493          	addi	s1,s1,846 # 4442434e <_entry-0x3bbdbcb2>
  // No hardware interrupts for UART in our emulator.
  // Process any pending input.
  while (1) {
    int c = uartgetc();
    if (c == -1)
800008ec:	597d                	li	s2,-1
  register uint32 r0 asm("a0") = 0;
800008ee:	4501                	li	a0,0
  register uint32 r1 asm("a1") = 0;
800008f0:	4581                	li	a1,0
  register uint32 r6 asm("a6") = 1; // fid = console_read
800008f2:	4805                	li	a6,1
  register uint32 r7 asm("a7") = 0x4442434E; // SBI_EXT_DBCN
800008f4:	88a6                	mv	a7,s1
  asm volatile("ecall"
800008f6:	00000073          	ecall
  if (r0 == 0) {
800008fa:	e511                	bnez	a0,80000906 <uartintr+0x2e>
    return (int)r1;
800008fc:	852e                	mv	a0,a1
    if (c == -1)
800008fe:	01258463          	beq	a1,s2,80000906 <uartintr+0x2e>
      break;
    consoleintr(c);
80000902:	3aa9                	jal	8000025c <consoleintr>
  while (1) {
80000904:	b7ed                	j	800008ee <uartintr+0x16>
  }
}
80000906:	40b2                	lw	ra,12(sp)
80000908:	4422                	lw	s0,8(sp)
8000090a:	4492                	lw	s1,4(sp)
8000090c:	4902                	lw	s2,0(sp)
8000090e:	0141                	addi	sp,sp,16
80000910:	8082                	ret

80000912 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
80000912:	1141                	addi	sp,sp,-16
80000914:	c606                	sw	ra,12(sp)
80000916:	c422                	sw	s0,8(sp)
80000918:	c226                	sw	s1,4(sp)
8000091a:	c04a                	sw	s2,0(sp)
8000091c:	0800                	addi	s0,sp,16
  struct run *r;

  if (((uint64)pa % PGSIZE) != 0 || (char *)pa < end || (uint64)pa >= PHYSTOP)
8000091e:	01451793          	slli	a5,a0,0x14
80000922:	e3b1                	bnez	a5,80000966 <kfree+0x54>
80000924:	84aa                	mv	s1,a0
80000926:	000d0797          	auipc	a5,0xd0
8000092a:	c5678793          	addi	a5,a5,-938 # 800d057c <end>
8000092e:	02f56c63          	bltu	a0,a5,80000966 <kfree+0x54>
80000932:	804007b7          	lui	a5,0x80400
80000936:	02f57863          	bgeu	a0,a5,80000966 <kfree+0x54>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
8000093a:	6605                	lui	a2,0x1
8000093c:	4585                	li	a1,1
8000093e:	241d                	jal	80000b64 <memset>

  r = (struct run *)pa;

  acquire(&kmem.lock);
80000940:	000ba917          	auipc	s2,0xba
80000944:	63090913          	addi	s2,s2,1584 # 800baf70 <kmem>
80000948:	854a                	mv	a0,s2
8000094a:	2295                	jal	80000aae <acquire>
  r->next = kmem.freelist;
8000094c:	00c92783          	lw	a5,12(s2)
80000950:	c09c                	sw	a5,0(s1)
  kmem.freelist = r;
80000952:	00992623          	sw	s1,12(s2)
  release(&kmem.lock);
80000956:	854a                	mv	a0,s2
80000958:	2ae9                	jal	80000b32 <release>
}
8000095a:	40b2                	lw	ra,12(sp)
8000095c:	4422                	lw	s0,8(sp)
8000095e:	4492                	lw	s1,4(sp)
80000960:	4902                	lw	s2,0(sp)
80000962:	0141                	addi	sp,sp,16
80000964:	8082                	ret
    panic("kfree");
80000966:	0000a517          	auipc	a0,0xa
8000096a:	6c650513          	addi	a0,a0,1734 # 8000b02c <etext+0x2c>
8000096e:	35a9                	jal	800007b8 <panic>

80000970 <freerange>:
{
80000970:	1101                	addi	sp,sp,-32
80000972:	ce06                	sw	ra,28(sp)
80000974:	cc22                	sw	s0,24(sp)
80000976:	ca26                	sw	s1,20(sp)
80000978:	1000                	addi	s0,sp,32
  p = (char *)PGROUNDUP((uint64)pa_start);
8000097a:	6785                	lui	a5,0x1
8000097c:	fff78713          	addi	a4,a5,-1 # fff <_entry-0x7ffff001>
80000980:	00e504b3          	add	s1,a0,a4
80000984:	777d                	lui	a4,0xfffff
80000986:	8cf9                	and	s1,s1,a4
  for (; p + PGSIZE <= (char *)pa_end; p += PGSIZE)
80000988:	94be                	add	s1,s1,a5
8000098a:	0295e163          	bltu	a1,s1,800009ac <freerange+0x3c>
8000098e:	c84a                	sw	s2,16(sp)
80000990:	c64e                	sw	s3,12(sp)
80000992:	c452                	sw	s4,8(sp)
80000994:	892e                	mv	s2,a1
    kfree(p);
80000996:	7a7d                	lui	s4,0xfffff
  for (; p + PGSIZE <= (char *)pa_end; p += PGSIZE)
80000998:	6985                	lui	s3,0x1
    kfree(p);
8000099a:	01448533          	add	a0,s1,s4
8000099e:	3f95                	jal	80000912 <kfree>
  for (; p + PGSIZE <= (char *)pa_end; p += PGSIZE)
800009a0:	94ce                	add	s1,s1,s3
800009a2:	fe997ce3          	bgeu	s2,s1,8000099a <freerange+0x2a>
800009a6:	4942                	lw	s2,16(sp)
800009a8:	49b2                	lw	s3,12(sp)
800009aa:	4a22                	lw	s4,8(sp)
}
800009ac:	40f2                	lw	ra,28(sp)
800009ae:	4462                	lw	s0,24(sp)
800009b0:	44d2                	lw	s1,20(sp)
800009b2:	6105                	addi	sp,sp,32
800009b4:	8082                	ret

800009b6 <kinit>:
{
800009b6:	1141                	addi	sp,sp,-16
800009b8:	c606                	sw	ra,12(sp)
800009ba:	c422                	sw	s0,8(sp)
800009bc:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
800009be:	0000a597          	auipc	a1,0xa
800009c2:	67658593          	addi	a1,a1,1654 # 8000b034 <etext+0x34>
800009c6:	000ba517          	auipc	a0,0xba
800009ca:	5aa50513          	addi	a0,a0,1450 # 800baf70 <kmem>
800009ce:	2085                	jal	80000a2e <initlock>
  freerange(end, (void *)PHYSTOP);
800009d0:	804005b7          	lui	a1,0x80400
800009d4:	000d0517          	auipc	a0,0xd0
800009d8:	ba850513          	addi	a0,a0,-1112 # 800d057c <end>
800009dc:	3f51                	jal	80000970 <freerange>
}
800009de:	40b2                	lw	ra,12(sp)
800009e0:	4422                	lw	s0,8(sp)
800009e2:	0141                	addi	sp,sp,16
800009e4:	8082                	ret

800009e6 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
800009e6:	1141                	addi	sp,sp,-16
800009e8:	c606                	sw	ra,12(sp)
800009ea:	c422                	sw	s0,8(sp)
800009ec:	c226                	sw	s1,4(sp)
800009ee:	0800                	addi	s0,sp,16
  struct run *r;

  acquire(&kmem.lock);
800009f0:	000ba497          	auipc	s1,0xba
800009f4:	58048493          	addi	s1,s1,1408 # 800baf70 <kmem>
800009f8:	8526                	mv	a0,s1
800009fa:	2855                	jal	80000aae <acquire>
  r = kmem.freelist;
800009fc:	44c4                	lw	s1,12(s1)
  if (r)
800009fe:	c095                	beqz	s1,80000a22 <kalloc+0x3c>
    kmem.freelist = r->next;
80000a00:	409c                	lw	a5,0(s1)
80000a02:	000ba517          	auipc	a0,0xba
80000a06:	56e50513          	addi	a0,a0,1390 # 800baf70 <kmem>
80000a0a:	c55c                	sw	a5,12(a0)
  release(&kmem.lock);
80000a0c:	221d                	jal	80000b32 <release>

  if (r)
    memset((char *)r, 5, PGSIZE); // fill with junk
80000a0e:	6605                	lui	a2,0x1
80000a10:	4595                	li	a1,5
80000a12:	8526                	mv	a0,s1
80000a14:	2a81                	jal	80000b64 <memset>
  return (void *)r;
}
80000a16:	8526                	mv	a0,s1
80000a18:	40b2                	lw	ra,12(sp)
80000a1a:	4422                	lw	s0,8(sp)
80000a1c:	4492                	lw	s1,4(sp)
80000a1e:	0141                	addi	sp,sp,16
80000a20:	8082                	ret
  release(&kmem.lock);
80000a22:	000ba517          	auipc	a0,0xba
80000a26:	54e50513          	addi	a0,a0,1358 # 800baf70 <kmem>
80000a2a:	2221                	jal	80000b32 <release>
  if (r)
80000a2c:	b7ed                	j	80000a16 <kalloc+0x30>

80000a2e <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
80000a2e:	1141                	addi	sp,sp,-16
80000a30:	c622                	sw	s0,12(sp)
80000a32:	0800                	addi	s0,sp,16
  lk->name = name;
80000a34:	c14c                	sw	a1,4(a0)
  lk->locked = 0;
80000a36:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
80000a3a:	00052423          	sw	zero,8(a0)
}
80000a3e:	4432                	lw	s0,12(sp)
80000a40:	0141                	addi	sp,sp,16
80000a42:	8082                	ret

80000a44 <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
80000a44:	411c                	lw	a5,0(a0)
80000a46:	e399                	bnez	a5,80000a4c <holding+0x8>
80000a48:	4501                	li	a0,0
  return r;
}
80000a4a:	8082                	ret
{
80000a4c:	1141                	addi	sp,sp,-16
80000a4e:	c606                	sw	ra,12(sp)
80000a50:	c422                	sw	s0,8(sp)
80000a52:	c226                	sw	s1,4(sp)
80000a54:	0800                	addi	s0,sp,16
  r = (lk->locked && lk->cpu == mycpu());
80000a56:	4504                	lw	s1,8(a0)
80000a58:	3d9000ef          	jal	80001630 <mycpu>
80000a5c:	40a48533          	sub	a0,s1,a0
80000a60:	00153513          	seqz	a0,a0
}
80000a64:	40b2                	lw	ra,12(sp)
80000a66:	4422                	lw	s0,8(sp)
80000a68:	4492                	lw	s1,4(sp)
80000a6a:	0141                	addi	sp,sp,16
80000a6c:	8082                	ret

80000a6e <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
80000a6e:	1141                	addi	sp,sp,-16
80000a70:	c606                	sw	ra,12(sp)
80000a72:	c422                	sw	s0,8(sp)
80000a74:	c226                	sw	s1,4(sp)
80000a76:	0800                	addi	s0,sp,16
  asm volatile("csrr %0, sstatus" : "=r"(x));
80000a78:	100024f3          	csrr	s1,sstatus
80000a7c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
80000a80:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r"(x));
80000a82:	10079073          	csrw	sstatus,a5

  // disable interrupts to prevent an involuntary context
  // switch while using mycpu().
  intr_off();

  if (mycpu()->noff == 0)
80000a86:	3ab000ef          	jal	80001630 <mycpu>
80000a8a:	5d5c                	lw	a5,60(a0)
80000a8c:	cb99                	beqz	a5,80000aa2 <push_off+0x34>
    mycpu()->intena = old;
  mycpu()->noff += 1;
80000a8e:	3a3000ef          	jal	80001630 <mycpu>
80000a92:	5d5c                	lw	a5,60(a0)
80000a94:	0785                	addi	a5,a5,1
80000a96:	dd5c                	sw	a5,60(a0)
}
80000a98:	40b2                	lw	ra,12(sp)
80000a9a:	4422                	lw	s0,8(sp)
80000a9c:	4492                	lw	s1,4(sp)
80000a9e:	0141                	addi	sp,sp,16
80000aa0:	8082                	ret
    mycpu()->intena = old;
80000aa2:	38f000ef          	jal	80001630 <mycpu>
  return (x & SSTATUS_SIE) != 0;
80000aa6:	8085                	srli	s1,s1,0x1
80000aa8:	8885                	andi	s1,s1,1
80000aaa:	c124                	sw	s1,64(a0)
80000aac:	b7cd                	j	80000a8e <push_off+0x20>

80000aae <acquire>:
{
80000aae:	1141                	addi	sp,sp,-16
80000ab0:	c606                	sw	ra,12(sp)
80000ab2:	c422                	sw	s0,8(sp)
80000ab4:	c226                	sw	s1,4(sp)
80000ab6:	0800                	addi	s0,sp,16
80000ab8:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
80000aba:	3f55                	jal	80000a6e <push_off>
  if (holding(lk))
80000abc:	8526                	mv	a0,s1
80000abe:	3759                	jal	80000a44 <holding>
  while (__atomic_exchange_n(&lk->locked, 1, __ATOMIC_ACQUIRE) != 0)
80000ac0:	4705                	li	a4,1
  if (holding(lk))
80000ac2:	ed09                	bnez	a0,80000adc <acquire+0x2e>
  while (__atomic_exchange_n(&lk->locked, 1, __ATOMIC_ACQUIRE) != 0)
80000ac4:	87ba                	mv	a5,a4
80000ac6:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
80000aca:	ffed                	bnez	a5,80000ac4 <acquire+0x16>
  lk->cpu = mycpu();
80000acc:	365000ef          	jal	80001630 <mycpu>
80000ad0:	c488                	sw	a0,8(s1)
}
80000ad2:	40b2                	lw	ra,12(sp)
80000ad4:	4422                	lw	s0,8(sp)
80000ad6:	4492                	lw	s1,4(sp)
80000ad8:	0141                	addi	sp,sp,16
80000ada:	8082                	ret
    panic("acquire");
80000adc:	0000a517          	auipc	a0,0xa
80000ae0:	56050513          	addi	a0,a0,1376 # 8000b03c <etext+0x3c>
80000ae4:	39d1                	jal	800007b8 <panic>

80000ae6 <pop_off>:

void
pop_off(void)
{
80000ae6:	1141                	addi	sp,sp,-16
80000ae8:	c606                	sw	ra,12(sp)
80000aea:	c422                	sw	s0,8(sp)
80000aec:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
80000aee:	343000ef          	jal	80001630 <mycpu>
  asm volatile("csrr %0, sstatus" : "=r"(x));
80000af2:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
80000af6:	8b89                	andi	a5,a5,2
  if (intr_get())
80000af8:	e39d                	bnez	a5,80000b1e <pop_off+0x38>
    panic("pop_off - interruptible");
  if (c->noff < 1)
80000afa:	5d5c                	lw	a5,60(a0)
80000afc:	02f05663          	blez	a5,80000b28 <pop_off+0x42>
    panic("pop_off");
  c->noff -= 1;
80000b00:	17fd                	addi	a5,a5,-1
80000b02:	dd5c                	sw	a5,60(a0)
  if (c->noff == 0 && c->intena)
80000b04:	eb89                	bnez	a5,80000b16 <pop_off+0x30>
80000b06:	413c                	lw	a5,64(a0)
80000b08:	c799                	beqz	a5,80000b16 <pop_off+0x30>
  asm volatile("csrr %0, sstatus" : "=r"(x));
80000b0a:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
80000b0e:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r"(x));
80000b12:	10079073          	csrw	sstatus,a5
    intr_on();
}
80000b16:	40b2                	lw	ra,12(sp)
80000b18:	4422                	lw	s0,8(sp)
80000b1a:	0141                	addi	sp,sp,16
80000b1c:	8082                	ret
    panic("pop_off - interruptible");
80000b1e:	0000a517          	auipc	a0,0xa
80000b22:	52650513          	addi	a0,a0,1318 # 8000b044 <etext+0x44>
80000b26:	3949                	jal	800007b8 <panic>
    panic("pop_off");
80000b28:	0000a517          	auipc	a0,0xa
80000b2c:	53450513          	addi	a0,a0,1332 # 8000b05c <etext+0x5c>
80000b30:	3161                	jal	800007b8 <panic>

80000b32 <release>:
{
80000b32:	1141                	addi	sp,sp,-16
80000b34:	c606                	sw	ra,12(sp)
80000b36:	c422                	sw	s0,8(sp)
80000b38:	c226                	sw	s1,4(sp)
80000b3a:	0800                	addi	s0,sp,16
80000b3c:	84aa                	mv	s1,a0
  if (!holding(lk))
80000b3e:	3719                	jal	80000a44 <holding>
80000b40:	cd09                	beqz	a0,80000b5a <release+0x28>
  lk->cpu = 0;
80000b42:	0004a423          	sw	zero,8(s1)
  __atomic_store_n(&lk->locked, 0, __ATOMIC_RELEASE);
80000b46:	0f50000f          	fence	iorw,ow
80000b4a:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
80000b4e:	3f61                	jal	80000ae6 <pop_off>
}
80000b50:	40b2                	lw	ra,12(sp)
80000b52:	4422                	lw	s0,8(sp)
80000b54:	4492                	lw	s1,4(sp)
80000b56:	0141                	addi	sp,sp,16
80000b58:	8082                	ret
    panic("release");
80000b5a:	0000a517          	auipc	a0,0xa
80000b5e:	50a50513          	addi	a0,a0,1290 # 8000b064 <etext+0x64>
80000b62:	3999                	jal	800007b8 <panic>

80000b64 <memset>:
#include "types.h"

void *
memset(void *dst, int c, uint n)
{
80000b64:	1141                	addi	sp,sp,-16
80000b66:	c622                	sw	s0,12(sp)
80000b68:	0800                	addi	s0,sp,16
  char *cdst = (char *)dst;
  int i;
  for (i = 0; i < n; i++) {
80000b6a:	ca01                	beqz	a2,80000b7a <memset+0x16>
80000b6c:	87aa                	mv	a5,a0
80000b6e:	962a                	add	a2,a2,a0
    cdst[i] = c;
80000b70:	00b78023          	sb	a1,0(a5)
  for (i = 0; i < n; i++) {
80000b74:	0785                	addi	a5,a5,1
80000b76:	fec79de3          	bne	a5,a2,80000b70 <memset+0xc>
  }
  return dst;
}
80000b7a:	4432                	lw	s0,12(sp)
80000b7c:	0141                	addi	sp,sp,16
80000b7e:	8082                	ret

80000b80 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80000b80:	1141                	addi	sp,sp,-16
80000b82:	c622                	sw	s0,12(sp)
80000b84:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while (n-- > 0) {
80000b86:	c21d                	beqz	a2,80000bac <memcmp+0x2c>
80000b88:	962a                	add	a2,a2,a0
    if (*s1 != *s2)
80000b8a:	00054783          	lbu	a5,0(a0)
80000b8e:	0005c703          	lbu	a4,0(a1) # 80400000 <end+0x32fa84>
80000b92:	00e79863          	bne	a5,a4,80000ba2 <memcmp+0x22>
      return *s1 - *s2;
    s1++, s2++;
80000b96:	0505                	addi	a0,a0,1
80000b98:	0585                	addi	a1,a1,1
  while (n-- > 0) {
80000b9a:	fea618e3          	bne	a2,a0,80000b8a <memcmp+0xa>
  }

  return 0;
80000b9e:	4501                	li	a0,0
80000ba0:	a019                	j	80000ba6 <memcmp+0x26>
      return *s1 - *s2;
80000ba2:	40e78533          	sub	a0,a5,a4
}
80000ba6:	4432                	lw	s0,12(sp)
80000ba8:	0141                	addi	sp,sp,16
80000baa:	8082                	ret
  return 0;
80000bac:	4501                	li	a0,0
80000bae:	bfe5                	j	80000ba6 <memcmp+0x26>

80000bb0 <memmove>:

void *
memmove(void *dst, const void *src, uint n)
{
80000bb0:	1141                	addi	sp,sp,-16
80000bb2:	c622                	sw	s0,12(sp)
80000bb4:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  if (n == 0)
80000bb6:	ce09                	beqz	a2,80000bd0 <memmove+0x20>
    return dst;

  s = src;
  d = dst;
  if (s < d && s + n > d) {
80000bb8:	00a5ef63          	bltu	a1,a0,80000bd6 <memmove+0x26>
    s += n;
    d += n;
    while (n-- > 0)
      *--d = *--s;
  } else
    while (n-- > 0)
80000bbc:	962e                	add	a2,a2,a1
{
80000bbe:	87aa                	mv	a5,a0
      *d++ = *s++;
80000bc0:	0585                	addi	a1,a1,1
80000bc2:	0785                	addi	a5,a5,1
80000bc4:	fff5c703          	lbu	a4,-1(a1)
80000bc8:	fee78fa3          	sb	a4,-1(a5)
    while (n-- > 0)
80000bcc:	fec59ae3          	bne	a1,a2,80000bc0 <memmove+0x10>

  return dst;
}
80000bd0:	4432                	lw	s0,12(sp)
80000bd2:	0141                	addi	sp,sp,16
80000bd4:	8082                	ret
  if (s < d && s + n > d) {
80000bd6:	00c587b3          	add	a5,a1,a2
80000bda:	fef571e3          	bgeu	a0,a5,80000bbc <memmove+0xc>
    d += n;
80000bde:	962a                	add	a2,a2,a0
      *--d = *--s;
80000be0:	17fd                	addi	a5,a5,-1
80000be2:	167d                	addi	a2,a2,-1 # fff <_entry-0x7ffff001>
80000be4:	0007c703          	lbu	a4,0(a5)
80000be8:	00e60023          	sb	a4,0(a2)
    while (n-- > 0)
80000bec:	fef59ae3          	bne	a1,a5,80000be0 <memmove+0x30>
80000bf0:	b7c5                	j	80000bd0 <memmove+0x20>

80000bf2 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void *
memcpy(void *dst, const void *src, uint n)
{
80000bf2:	1141                	addi	sp,sp,-16
80000bf4:	c606                	sw	ra,12(sp)
80000bf6:	c422                	sw	s0,8(sp)
80000bf8:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
80000bfa:	3f5d                	jal	80000bb0 <memmove>
}
80000bfc:	40b2                	lw	ra,12(sp)
80000bfe:	4422                	lw	s0,8(sp)
80000c00:	0141                	addi	sp,sp,16
80000c02:	8082                	ret

80000c04 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
80000c04:	1141                	addi	sp,sp,-16
80000c06:	c622                	sw	s0,12(sp)
80000c08:	0800                	addi	s0,sp,16
  while (n > 0 && *p && *p == *q)
80000c0a:	ce11                	beqz	a2,80000c26 <strncmp+0x22>
80000c0c:	00054783          	lbu	a5,0(a0)
80000c10:	cf89                	beqz	a5,80000c2a <strncmp+0x26>
80000c12:	0005c703          	lbu	a4,0(a1)
80000c16:	00f71a63          	bne	a4,a5,80000c2a <strncmp+0x26>
    n--, p++, q++;
80000c1a:	167d                	addi	a2,a2,-1
80000c1c:	0505                	addi	a0,a0,1
80000c1e:	0585                	addi	a1,a1,1
  while (n > 0 && *p && *p == *q)
80000c20:	f675                	bnez	a2,80000c0c <strncmp+0x8>
  if (n == 0)
    return 0;
80000c22:	4501                	li	a0,0
80000c24:	a801                	j	80000c34 <strncmp+0x30>
80000c26:	4501                	li	a0,0
80000c28:	a031                	j	80000c34 <strncmp+0x30>
  return (uchar)*p - (uchar)*q;
80000c2a:	00054503          	lbu	a0,0(a0)
80000c2e:	0005c783          	lbu	a5,0(a1)
80000c32:	8d1d                	sub	a0,a0,a5
}
80000c34:	4432                	lw	s0,12(sp)
80000c36:	0141                	addi	sp,sp,16
80000c38:	8082                	ret

80000c3a <strncpy>:

char *
strncpy(char *s, const char *t, int n)
{
80000c3a:	1141                	addi	sp,sp,-16
80000c3c:	c622                	sw	s0,12(sp)
80000c3e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while (n-- > 0 && (*s++ = *t++) != 0)
80000c40:	87aa                	mv	a5,a0
80000c42:	86b2                	mv	a3,a2
80000c44:	167d                	addi	a2,a2,-1
80000c46:	02d05563          	blez	a3,80000c70 <strncpy+0x36>
80000c4a:	0585                	addi	a1,a1,1
80000c4c:	0785                	addi	a5,a5,1
80000c4e:	fff5c703          	lbu	a4,-1(a1)
80000c52:	fee78fa3          	sb	a4,-1(a5)
80000c56:	f775                	bnez	a4,80000c42 <strncpy+0x8>
    ;
  while (n-- > 0)
80000c58:	873e                	mv	a4,a5
80000c5a:	97b6                	add	a5,a5,a3
80000c5c:	17fd                	addi	a5,a5,-1
80000c5e:	00c05963          	blez	a2,80000c70 <strncpy+0x36>
    *s++ = 0;
80000c62:	0705                	addi	a4,a4,1 # fffff001 <end+0x7ff2ea85>
80000c64:	fe070fa3          	sb	zero,-1(a4)
  while (n-- > 0)
80000c68:	40e786b3          	sub	a3,a5,a4
80000c6c:	fed04be3          	bgtz	a3,80000c62 <strncpy+0x28>
  return os;
}
80000c70:	4432                	lw	s0,12(sp)
80000c72:	0141                	addi	sp,sp,16
80000c74:	8082                	ret

80000c76 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char *
safestrcpy(char *s, const char *t, int n)
{
80000c76:	1141                	addi	sp,sp,-16
80000c78:	c622                	sw	s0,12(sp)
80000c7a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if (n <= 0)
80000c7c:	02c05163          	blez	a2,80000c9e <safestrcpy+0x28>
80000c80:	167d                	addi	a2,a2,-1
80000c82:	00c586b3          	add	a3,a1,a2
80000c86:	87aa                	mv	a5,a0
    return os;
  while (--n > 0 && (*s++ = *t++) != 0)
80000c88:	00d58963          	beq	a1,a3,80000c9a <safestrcpy+0x24>
80000c8c:	0585                	addi	a1,a1,1
80000c8e:	0785                	addi	a5,a5,1
80000c90:	fff5c703          	lbu	a4,-1(a1)
80000c94:	fee78fa3          	sb	a4,-1(a5)
80000c98:	fb65                	bnez	a4,80000c88 <safestrcpy+0x12>
    ;
  *s = 0;
80000c9a:	00078023          	sb	zero,0(a5)
  return os;
}
80000c9e:	4432                	lw	s0,12(sp)
80000ca0:	0141                	addi	sp,sp,16
80000ca2:	8082                	ret

80000ca4 <strlen>:

int
strlen(const char *s)
{
80000ca4:	1141                	addi	sp,sp,-16
80000ca6:	c622                	sw	s0,12(sp)
80000ca8:	0800                	addi	s0,sp,16
  int n;

  for (n = 0; s[n]; n++)
80000caa:	00054783          	lbu	a5,0(a0)
80000cae:	cf81                	beqz	a5,80000cc6 <strlen+0x22>
80000cb0:	872a                	mv	a4,a0
80000cb2:	4501                	li	a0,0
80000cb4:	0505                	addi	a0,a0,1
80000cb6:	00a707b3          	add	a5,a4,a0
80000cba:	0007c783          	lbu	a5,0(a5)
80000cbe:	fbfd                	bnez	a5,80000cb4 <strlen+0x10>
    ;
  return n;
}
80000cc0:	4432                	lw	s0,12(sp)
80000cc2:	0141                	addi	sp,sp,16
80000cc4:	8082                	ret
  for (n = 0; s[n]; n++)
80000cc6:	4501                	li	a0,0
  return n;
80000cc8:	bfe5                	j	80000cc0 <strlen+0x1c>

80000cca <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
80000cca:	1141                	addi	sp,sp,-16
80000ccc:	c606                	sw	ra,12(sp)
80000cce:	c422                	sw	s0,8(sp)
80000cd0:	0800                	addi	s0,sp,16
  if (cpuid() == 0) {
80000cd2:	151000ef          	jal	80001622 <cpuid>
    virtio_disk_init(); // emulated hard disk
    userinit();         // first user process
    __atomic_thread_fence(__ATOMIC_SEQ_CST);
    started = 1;
  } else {
    while (started == 0)
80000cd6:	000b2717          	auipc	a4,0xb2
80000cda:	1d270713          	addi	a4,a4,466 # 800b2ea8 <started>
  if (cpuid() == 0) {
80000cde:	c50d                	beqz	a0,80000d08 <main+0x3e>
    while (started == 0)
80000ce0:	431c                	lw	a5,0(a4)
80000ce2:	dffd                	beqz	a5,80000ce0 <main+0x16>
      ;
    __atomic_thread_fence(__ATOMIC_SEQ_CST);
80000ce4:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
80000ce8:	13b000ef          	jal	80001622 <cpuid>
80000cec:	85aa                	mv	a1,a0
80000cee:	0000a517          	auipc	a0,0xa
80000cf2:	39a50513          	addi	a0,a0,922 # 8000b088 <etext+0x88>
80000cf6:	feeff0ef          	jal	800004e4 <printf>
    kvminithart();  // turn on paging
80000cfa:	289d                	jal	80000d70 <kvminithart>
    trapinithart(); // install kernel trap vector
80000cfc:	48a010ef          	jal	80002186 <trapinithart>
    plicinithart(); // ask PLIC for device interrupts
80000d00:	35c080ef          	jal	8000905c <plicinithart>
  }

  scheduler();
80000d04:	5e3000ef          	jal	80001ae6 <scheduler>
    consoleinit();
80000d08:	ebcff0ef          	jal	800003c4 <consoleinit>
    printfinit();
80000d0c:	34d5                	jal	800007f0 <printfinit>
    printf("\n");
80000d0e:	0000a517          	auipc	a0,0xa
80000d12:	35e50513          	addi	a0,a0,862 # 8000b06c <etext+0x6c>
80000d16:	fceff0ef          	jal	800004e4 <printf>
    printf("xv6 kernel is booting\n");
80000d1a:	0000a517          	auipc	a0,0xa
80000d1e:	35650513          	addi	a0,a0,854 # 8000b070 <etext+0x70>
80000d22:	fc2ff0ef          	jal	800004e4 <printf>
    printf("\n");
80000d26:	0000a517          	auipc	a0,0xa
80000d2a:	34650513          	addi	a0,a0,838 # 8000b06c <etext+0x6c>
80000d2e:	fb6ff0ef          	jal	800004e4 <printf>
    kinit();            // physical page allocator
80000d32:	3151                	jal	800009b6 <kinit>
    kvminit();          // create kernel page table
80000d34:	2c89                	jal	80000f86 <kvminit>
    kvminithart();      // turn on paging
80000d36:	282d                	jal	80000d70 <kvminithart>
    procinit();         // process table
80000d38:	04f000ef          	jal	80001586 <procinit>
    trapinit();         // trap vectors
80000d3c:	426010ef          	jal	80002162 <trapinit>
    trapinithart();     // install kernel trap vector
80000d40:	446010ef          	jal	80002186 <trapinithart>
    plicinit();         // set up interrupt controller
80000d44:	30c080ef          	jal	80009050 <plicinit>
    plicinithart();     // ask PLIC for device interrupts
80000d48:	314080ef          	jal	8000905c <plicinithart>
    binit();            // buffer cache
80000d4c:	243010ef          	jal	8000278e <binit>
    iinit();            // inode table
80000d50:	789010ef          	jal	80002cd8 <iinit>
    fileinit();         // file table
80000d54:	5d3020ef          	jal	80003b26 <fileinit>
    virtio_disk_init(); // emulated hard disk
80000d58:	32a080ef          	jal	80009082 <virtio_disk_init>
    userinit();         // first user process
80000d5c:	38f000ef          	jal	800018ea <userinit>
    __atomic_thread_fence(__ATOMIC_SEQ_CST);
80000d60:	0ff0000f          	fence
    started = 1;
80000d64:	4785                	li	a5,1
80000d66:	000b2717          	auipc	a4,0xb2
80000d6a:	14f72123          	sw	a5,322(a4) # 800b2ea8 <started>
80000d6e:	bf59                	j	80000d04 <main+0x3a>

80000d70 <kvminithart>:

// Switch the current CPU's h/w page table register to
// the kernel's page table, and enable paging.
void
kvminithart()
{
80000d70:	1141                	addi	sp,sp,-16
80000d72:	c622                	sw	s0,12(sp)
80000d74:	0800                	addi	s0,sp,16

// flush the TLB.
static inline void
sfence_vma()
{
  asm volatile("sfence.vma zero, zero");
80000d76:	12000073          	sfence.vma
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();

  w_satp(MAKE_SATP(kernel_pagetable));
80000d7a:	000b2797          	auipc	a5,0xb2
80000d7e:	1327a783          	lw	a5,306(a5) # 800b2eac <kernel_pagetable>
80000d82:	83b1                	srli	a5,a5,0xc
80000d84:	80000737          	lui	a4,0x80000
80000d88:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r"(x));
80000d8a:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma zero, zero");
80000d8e:	12000073          	sfence.vma

  // flush stale entries from the TLB.
  sfence_vma();
}
80000d92:	4432                	lw	s0,12(sp)
80000d94:	0141                	addi	sp,sp,16
80000d96:	8082                	ret

80000d98 <walk>:
//   22..31 -- 10 bits of level-1 index (VPN[1]).
//   12..21 -- 10 bits of level-0 index (VPN[0]).
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint32 va, int alloc)
{
80000d98:	1101                	addi	sp,sp,-32
80000d9a:	ce06                	sw	ra,28(sp)
80000d9c:	cc22                	sw	s0,24(sp)
80000d9e:	ca26                	sw	s1,20(sp)
80000da0:	c84a                	sw	s2,16(sp)
80000da2:	c64e                	sw	s3,12(sp)
80000da4:	1000                	addi	s0,sp,32
80000da6:	84ae                	mv	s1,a1
  // Sv32 has 32-bit virtual addresses, so any va is valid.
  // The walk function handles the actual page table traversal.

  for (int level = 1; level > 0; level--) {
    pte_t *pte = &pagetable[PX(level, va)];
80000da8:	0165d793          	srli	a5,a1,0x16
80000dac:	078a                	slli	a5,a5,0x2
80000dae:	00f509b3          	add	s3,a0,a5
    if (*pte & PTE_V) {
80000db2:	0009a903          	lw	s2,0(s3) # 1000 <_entry-0x7ffff000>
80000db6:	00197793          	andi	a5,s2,1
80000dba:	c38d                	beqz	a5,80000ddc <walk+0x44>
      pagetable = (pagetable_t)PTE2PA(*pte);
80000dbc:	00a95913          	srli	s2,s2,0xa
80000dc0:	0932                	slli	s2,s2,0xc
        return 0;
      memset(pagetable, 0, PGSIZE);
      *pte = PA2PTE(pagetable) | PTE_V;
    }
  }
  return &pagetable[PX(0, va)];
80000dc2:	80b1                	srli	s1,s1,0xc
80000dc4:	3ff4f493          	andi	s1,s1,1023
80000dc8:	048a                	slli	s1,s1,0x2
80000dca:	9926                	add	s2,s2,s1
}
80000dcc:	854a                	mv	a0,s2
80000dce:	40f2                	lw	ra,28(sp)
80000dd0:	4462                	lw	s0,24(sp)
80000dd2:	44d2                	lw	s1,20(sp)
80000dd4:	4942                	lw	s2,16(sp)
80000dd6:	49b2                	lw	s3,12(sp)
80000dd8:	6105                	addi	sp,sp,32
80000dda:	8082                	ret
      if (!alloc || (pagetable = (pde_t *)kalloc()) == 0)
80000ddc:	ce19                	beqz	a2,80000dfa <walk+0x62>
80000dde:	3121                	jal	800009e6 <kalloc>
80000de0:	892a                	mv	s2,a0
80000de2:	d56d                	beqz	a0,80000dcc <walk+0x34>
      memset(pagetable, 0, PGSIZE);
80000de4:	6605                	lui	a2,0x1
80000de6:	4581                	li	a1,0
80000de8:	3bb5                	jal	80000b64 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
80000dea:	00c95793          	srli	a5,s2,0xc
80000dee:	07aa                	slli	a5,a5,0xa
80000df0:	0017e793          	ori	a5,a5,1
80000df4:	00f9a023          	sw	a5,0(s3)
80000df8:	b7e9                	j	80000dc2 <walk+0x2a>
        return 0;
80000dfa:	4901                	li	s2,0
80000dfc:	bfc1                	j	80000dcc <walk+0x34>

80000dfe <walkaddr>:
walkaddr(pagetable_t pagetable, uint32 va)
{
  pte_t *pte;
  uint32 pa;

  if (va >= MAXVA)
80000dfe:	0205c863          	bltz	a1,80000e2e <walkaddr+0x30>
{
80000e02:	1141                	addi	sp,sp,-16
80000e04:	c606                	sw	ra,12(sp)
80000e06:	c422                	sw	s0,8(sp)
80000e08:	0800                	addi	s0,sp,16
    return 0;

  pte = walk(pagetable, va, 0);
80000e0a:	4601                	li	a2,0
80000e0c:	3771                	jal	80000d98 <walk>
  if (pte == 0)
80000e0e:	c115                	beqz	a0,80000e32 <walkaddr+0x34>
    return 0;
  if ((*pte & PTE_V) == 0)
80000e10:	411c                	lw	a5,0(a0)
    return 0;
  if ((*pte & PTE_U) == 0)
80000e12:	0117f693          	andi	a3,a5,17
80000e16:	4745                	li	a4,17
    return 0;
80000e18:	4501                	li	a0,0
  if ((*pte & PTE_U) == 0)
80000e1a:	00e68663          	beq	a3,a4,80000e26 <walkaddr+0x28>
  pa = PTE2PA(*pte);
  return pa;
}
80000e1e:	40b2                	lw	ra,12(sp)
80000e20:	4422                	lw	s0,8(sp)
80000e22:	0141                	addi	sp,sp,16
80000e24:	8082                	ret
  pa = PTE2PA(*pte);
80000e26:	83a9                	srli	a5,a5,0xa
80000e28:	00c79513          	slli	a0,a5,0xc
  return pa;
80000e2c:	bfcd                	j	80000e1e <walkaddr+0x20>
    return 0;
80000e2e:	4501                	li	a0,0
}
80000e30:	8082                	ret
    return 0;
80000e32:	4501                	li	a0,0
80000e34:	b7ed                	j	80000e1e <walkaddr+0x20>

80000e36 <mappages>:
// va and size MUST be page-aligned.
// Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint32 va, uint32 size, uint32 pa, int perm)
{
80000e36:	7179                	addi	sp,sp,-48
80000e38:	d606                	sw	ra,44(sp)
80000e3a:	d422                	sw	s0,40(sp)
80000e3c:	d226                	sw	s1,36(sp)
80000e3e:	d04a                	sw	s2,32(sp)
80000e40:	ce4e                	sw	s3,28(sp)
80000e42:	cc52                	sw	s4,24(sp)
80000e44:	ca56                	sw	s5,20(sp)
80000e46:	c85a                	sw	s6,16(sp)
80000e48:	c65e                	sw	s7,12(sp)
80000e4a:	1800                	addi	s0,sp,48
  uint32 a, last;
  pte_t *pte;

  if ((va % PGSIZE) != 0)
80000e4c:	01459793          	slli	a5,a1,0x14
80000e50:	e7a1                	bnez	a5,80000e98 <mappages+0x62>
80000e52:	8aaa                	mv	s5,a0
80000e54:	8b3a                	mv	s6,a4
    panic("mappages: va not aligned");

  if ((size % PGSIZE) != 0)
80000e56:	01461793          	slli	a5,a2,0x14
80000e5a:	e7a9                	bnez	a5,80000ea4 <mappages+0x6e>
    panic("mappages: size not aligned");

  if (size == 0)
80000e5c:	ca31                	beqz	a2,80000eb0 <mappages+0x7a>
    panic("mappages: size");

  a = va;
  last = va + size - PGSIZE;
80000e5e:	77fd                	lui	a5,0xfffff
80000e60:	963e                	add	a2,a2,a5
80000e62:	00b609b3          	add	s3,a2,a1
  a = va;
80000e66:	892e                	mv	s2,a1
80000e68:	40b68a33          	sub	s4,a3,a1
    if (*pte & PTE_V)
      panic("mappages: remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if (a == last)
      break;
    a += PGSIZE;
80000e6c:	6b85                	lui	s7,0x1
80000e6e:	014904b3          	add	s1,s2,s4
    if ((pte = walk(pagetable, a, 1)) == 0)
80000e72:	4605                	li	a2,1
80000e74:	85ca                	mv	a1,s2
80000e76:	8556                	mv	a0,s5
80000e78:	3705                	jal	80000d98 <walk>
80000e7a:	c539                	beqz	a0,80000ec8 <mappages+0x92>
    if (*pte & PTE_V)
80000e7c:	411c                	lw	a5,0(a0)
80000e7e:	8b85                	andi	a5,a5,1
80000e80:	ef95                	bnez	a5,80000ebc <mappages+0x86>
    *pte = PA2PTE(pa) | perm | PTE_V;
80000e82:	80b1                	srli	s1,s1,0xc
80000e84:	04aa                	slli	s1,s1,0xa
80000e86:	0164e4b3          	or	s1,s1,s6
80000e8a:	0014e493          	ori	s1,s1,1
80000e8e:	c104                	sw	s1,0(a0)
    if (a == last)
80000e90:	05390863          	beq	s2,s3,80000ee0 <mappages+0xaa>
    a += PGSIZE;
80000e94:	995e                	add	s2,s2,s7
    if ((pte = walk(pagetable, a, 1)) == 0)
80000e96:	bfe1                	j	80000e6e <mappages+0x38>
    panic("mappages: va not aligned");
80000e98:	0000a517          	auipc	a0,0xa
80000e9c:	20450513          	addi	a0,a0,516 # 8000b09c <etext+0x9c>
80000ea0:	919ff0ef          	jal	800007b8 <panic>
    panic("mappages: size not aligned");
80000ea4:	0000a517          	auipc	a0,0xa
80000ea8:	21450513          	addi	a0,a0,532 # 8000b0b8 <etext+0xb8>
80000eac:	90dff0ef          	jal	800007b8 <panic>
    panic("mappages: size");
80000eb0:	0000a517          	auipc	a0,0xa
80000eb4:	22450513          	addi	a0,a0,548 # 8000b0d4 <etext+0xd4>
80000eb8:	901ff0ef          	jal	800007b8 <panic>
      panic("mappages: remap");
80000ebc:	0000a517          	auipc	a0,0xa
80000ec0:	22850513          	addi	a0,a0,552 # 8000b0e4 <etext+0xe4>
80000ec4:	8f5ff0ef          	jal	800007b8 <panic>
      return -1;
80000ec8:	557d                	li	a0,-1
    pa += PGSIZE;
  }
  return 0;
}
80000eca:	50b2                	lw	ra,44(sp)
80000ecc:	5422                	lw	s0,40(sp)
80000ece:	5492                	lw	s1,36(sp)
80000ed0:	5902                	lw	s2,32(sp)
80000ed2:	49f2                	lw	s3,28(sp)
80000ed4:	4a62                	lw	s4,24(sp)
80000ed6:	4ad2                	lw	s5,20(sp)
80000ed8:	4b42                	lw	s6,16(sp)
80000eda:	4bb2                	lw	s7,12(sp)
80000edc:	6145                	addi	sp,sp,48
80000ede:	8082                	ret
  return 0;
80000ee0:	4501                	li	a0,0
80000ee2:	b7e5                	j	80000eca <mappages+0x94>

80000ee4 <kvmmap>:
{
80000ee4:	1141                	addi	sp,sp,-16
80000ee6:	c606                	sw	ra,12(sp)
80000ee8:	c422                	sw	s0,8(sp)
80000eea:	0800                	addi	s0,sp,16
80000eec:	87b6                	mv	a5,a3
  if (mappages(kpgtbl, va, sz, pa, perm) != 0)
80000eee:	86b2                	mv	a3,a2
80000ef0:	863e                	mv	a2,a5
80000ef2:	3791                	jal	80000e36 <mappages>
80000ef4:	e509                	bnez	a0,80000efe <kvmmap+0x1a>
}
80000ef6:	40b2                	lw	ra,12(sp)
80000ef8:	4422                	lw	s0,8(sp)
80000efa:	0141                	addi	sp,sp,16
80000efc:	8082                	ret
    panic("kvmmap");
80000efe:	0000a517          	auipc	a0,0xa
80000f02:	1f650513          	addi	a0,a0,502 # 8000b0f4 <etext+0xf4>
80000f06:	8b3ff0ef          	jal	800007b8 <panic>

80000f0a <kvmmake>:
{
80000f0a:	1141                	addi	sp,sp,-16
80000f0c:	c606                	sw	ra,12(sp)
80000f0e:	c422                	sw	s0,8(sp)
80000f10:	c226                	sw	s1,4(sp)
80000f12:	c04a                	sw	s2,0(sp)
80000f14:	0800                	addi	s0,sp,16
  kpgtbl = (pagetable_t)kalloc();
80000f16:	3cc1                	jal	800009e6 <kalloc>
80000f18:	84aa                	mv	s1,a0
  memset(kpgtbl, 0, PGSIZE);
80000f1a:	6605                	lui	a2,0x1
80000f1c:	4581                	li	a1,0
80000f1e:	3199                	jal	80000b64 <memset>
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint32)etext - KERNBASE, PTE_R | PTE_X);
80000f20:	0000a917          	auipc	s2,0xa
80000f24:	0e090913          	addi	s2,s2,224 # 8000b000 <etext>
80000f28:	4729                	li	a4,10
80000f2a:	8000a697          	auipc	a3,0x8000a
80000f2e:	0d668693          	addi	a3,a3,214 # b000 <_entry-0x7fff5000>
80000f32:	80000637          	lui	a2,0x80000
80000f36:	800005b7          	lui	a1,0x80000
80000f3a:	8526                	mv	a0,s1
80000f3c:	3765                	jal	80000ee4 <kvmmap>
  kvmmap(kpgtbl, 0x60000000, 0x60000000, 0x500000, PTE_R | PTE_W);
80000f3e:	4719                	li	a4,6
80000f40:	005006b7          	lui	a3,0x500
80000f44:	60000637          	lui	a2,0x60000
80000f48:	600005b7          	lui	a1,0x60000
80000f4c:	8526                	mv	a0,s1
80000f4e:	3f59                	jal	80000ee4 <kvmmap>
  kvmmap(kpgtbl, (uint32)etext, (uint32)etext, PHYSTOP - (uint32)etext,
80000f50:	4719                	li	a4,6
80000f52:	804006b7          	lui	a3,0x80400
80000f56:	412686b3          	sub	a3,a3,s2
80000f5a:	864a                	mv	a2,s2
80000f5c:	85ca                	mv	a1,s2
80000f5e:	8526                	mv	a0,s1
80000f60:	3751                	jal	80000ee4 <kvmmap>
  kvmmap(kpgtbl, TRAMPOLINE, (uint32)trampoline, PGSIZE, PTE_R | PTE_X);
80000f62:	4729                	li	a4,10
80000f64:	6685                	lui	a3,0x1
80000f66:	00009617          	auipc	a2,0x9
80000f6a:	09a60613          	addi	a2,a2,154 # 8000a000 <_trampoline>
80000f6e:	75fd                	lui	a1,0xfffff
80000f70:	8526                	mv	a0,s1
80000f72:	3f8d                	jal	80000ee4 <kvmmap>
  proc_mapstacks(kpgtbl);
80000f74:	8526                	mv	a0,s1
80000f76:	2b49                	jal	80001508 <proc_mapstacks>
}
80000f78:	8526                	mv	a0,s1
80000f7a:	40b2                	lw	ra,12(sp)
80000f7c:	4422                	lw	s0,8(sp)
80000f7e:	4492                	lw	s1,4(sp)
80000f80:	4902                	lw	s2,0(sp)
80000f82:	0141                	addi	sp,sp,16
80000f84:	8082                	ret

80000f86 <kvminit>:
{
80000f86:	1141                	addi	sp,sp,-16
80000f88:	c606                	sw	ra,12(sp)
80000f8a:	c422                	sw	s0,8(sp)
80000f8c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
80000f8e:	3fb5                	jal	80000f0a <kvmmake>
80000f90:	000b2797          	auipc	a5,0xb2
80000f94:	f0a7ae23          	sw	a0,-228(a5) # 800b2eac <kernel_pagetable>
}
80000f98:	40b2                	lw	ra,12(sp)
80000f9a:	4422                	lw	s0,8(sp)
80000f9c:	0141                	addi	sp,sp,16
80000f9e:	8082                	ret

80000fa0 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
80000fa0:	1141                	addi	sp,sp,-16
80000fa2:	c606                	sw	ra,12(sp)
80000fa4:	c422                	sw	s0,8(sp)
80000fa6:	c226                	sw	s1,4(sp)
80000fa8:	0800                	addi	s0,sp,16
  pagetable_t pagetable;
  pagetable = (pagetable_t)kalloc();
80000faa:	a3dff0ef          	jal	800009e6 <kalloc>
80000fae:	84aa                	mv	s1,a0
  if (pagetable == 0)
80000fb0:	c501                	beqz	a0,80000fb8 <uvmcreate+0x18>
    return 0;
  memset(pagetable, 0, PGSIZE);
80000fb2:	6605                	lui	a2,0x1
80000fb4:	4581                	li	a1,0
80000fb6:	367d                	jal	80000b64 <memset>
  return pagetable;
}
80000fb8:	8526                	mv	a0,s1
80000fba:	40b2                	lw	ra,12(sp)
80000fbc:	4422                	lw	s0,8(sp)
80000fbe:	4492                	lw	s1,4(sp)
80000fc0:	0141                	addi	sp,sp,16
80000fc2:	8082                	ret

80000fc4 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. It's OK if the mappings don't exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint32 va, uint32 npages, int do_free)
{
80000fc4:	7179                	addi	sp,sp,-48
80000fc6:	d606                	sw	ra,44(sp)
80000fc8:	d422                	sw	s0,40(sp)
80000fca:	1800                	addi	s0,sp,48
  uint32 a;
  pte_t *pte;

  if ((va % PGSIZE) != 0)
80000fcc:	01459793          	slli	a5,a1,0x14
80000fd0:	e395                	bnez	a5,80000ff4 <uvmunmap+0x30>
80000fd2:	d04a                	sw	s2,32(sp)
80000fd4:	ce4e                	sw	s3,28(sp)
80000fd6:	cc52                	sw	s4,24(sp)
80000fd8:	ca56                	sw	s5,20(sp)
80000fda:	c85a                	sw	s6,16(sp)
80000fdc:	c65e                	sw	s7,12(sp)
80000fde:	c462                	sw	s8,8(sp)
80000fe0:	8a2a                	mv	s4,a0
80000fe2:	892e                	mv	s2,a1
80000fe4:	8ab6                	mv	s5,a3
    panic("uvmunmap: not aligned");

  a = va;
  for (int i = 0; i < npages; i++, a += PGSIZE) {
80000fe6:	8c32                	mv	s8,a2
80000fe8:	4981                	li	s3,0
    if ((pte = walk(pagetable, a, 0)) == 0)
      panic("uvmunmap: walk");
    if ((*pte & PTE_V) == 0)
      panic("uvmunmap: not mapped");
    if (PTE_FLAGS(*pte) == PTE_V)
80000fea:	4b85                	li	s7,1
  for (int i = 0; i < npages; i++, a += PGSIZE) {
80000fec:	6b05                	lui	s6,0x1
80000fee:	ce3d                	beqz	a2,8000106c <uvmunmap+0xa8>
80000ff0:	d226                	sw	s1,36(sp)
80000ff2:	a0b9                	j	80001040 <uvmunmap+0x7c>
80000ff4:	d226                	sw	s1,36(sp)
80000ff6:	d04a                	sw	s2,32(sp)
80000ff8:	ce4e                	sw	s3,28(sp)
80000ffa:	cc52                	sw	s4,24(sp)
80000ffc:	ca56                	sw	s5,20(sp)
80000ffe:	c85a                	sw	s6,16(sp)
80001000:	c65e                	sw	s7,12(sp)
80001002:	c462                	sw	s8,8(sp)
    panic("uvmunmap: not aligned");
80001004:	0000a517          	auipc	a0,0xa
80001008:	0f850513          	addi	a0,a0,248 # 8000b0fc <etext+0xfc>
8000100c:	facff0ef          	jal	800007b8 <panic>
      panic("uvmunmap: walk");
80001010:	0000a517          	auipc	a0,0xa
80001014:	10450513          	addi	a0,a0,260 # 8000b114 <etext+0x114>
80001018:	fa0ff0ef          	jal	800007b8 <panic>
      panic("uvmunmap: not mapped");
8000101c:	0000a517          	auipc	a0,0xa
80001020:	10850513          	addi	a0,a0,264 # 8000b124 <etext+0x124>
80001024:	f94ff0ef          	jal	800007b8 <panic>
      panic("uvmunmap: not a leaf");
80001028:	0000a517          	auipc	a0,0xa
8000102c:	11450513          	addi	a0,a0,276 # 8000b13c <etext+0x13c>
80001030:	f88ff0ef          	jal	800007b8 <panic>
    if (do_free) {
      uint32 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
80001034:	0004a023          	sw	zero,0(s1)
  for (int i = 0; i < npages; i++, a += PGSIZE) {
80001038:	0985                	addi	s3,s3,1
8000103a:	995a                	add	s2,s2,s6
8000103c:	03898763          	beq	s3,s8,8000106a <uvmunmap+0xa6>
    if ((pte = walk(pagetable, a, 0)) == 0)
80001040:	4601                	li	a2,0
80001042:	85ca                	mv	a1,s2
80001044:	8552                	mv	a0,s4
80001046:	3b89                	jal	80000d98 <walk>
80001048:	84aa                	mv	s1,a0
8000104a:	d179                	beqz	a0,80001010 <uvmunmap+0x4c>
    if ((*pte & PTE_V) == 0)
8000104c:	4108                	lw	a0,0(a0)
8000104e:	00157793          	andi	a5,a0,1
80001052:	d7e9                	beqz	a5,8000101c <uvmunmap+0x58>
    if (PTE_FLAGS(*pte) == PTE_V)
80001054:	3ff57793          	andi	a5,a0,1023
80001058:	fd7788e3          	beq	a5,s7,80001028 <uvmunmap+0x64>
    if (do_free) {
8000105c:	fc0a8ce3          	beqz	s5,80001034 <uvmunmap+0x70>
      uint32 pa = PTE2PA(*pte);
80001060:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
80001062:	0532                	slli	a0,a0,0xc
80001064:	8afff0ef          	jal	80000912 <kfree>
80001068:	b7f1                	j	80001034 <uvmunmap+0x70>
8000106a:	5492                	lw	s1,36(sp)
8000106c:	5902                	lw	s2,32(sp)
8000106e:	49f2                	lw	s3,28(sp)
80001070:	4a62                	lw	s4,24(sp)
80001072:	4ad2                	lw	s5,20(sp)
80001074:	4b42                	lw	s6,16(sp)
80001076:	4bb2                	lw	s7,12(sp)
80001078:	4c22                	lw	s8,8(sp)
  }
}
8000107a:	50b2                	lw	ra,44(sp)
8000107c:	5422                	lw	s0,40(sp)
8000107e:	6145                	addi	sp,sp,48
80001080:	8082                	ret

80001082 <uvmappage>:

// create PTE for user page at va, with physical address pa.
// va is page-aligned.
int
uvmappage(pagetable_t pagetable, uint32 va, uint32 pa, int perm)
{
80001082:	1141                	addi	sp,sp,-16
80001084:	c606                	sw	ra,12(sp)
80001086:	c422                	sw	s0,8(sp)
80001088:	0800                	addi	s0,sp,16
8000108a:	8736                	mv	a4,a3
  return mappages(pagetable, va, PGSIZE, pa, perm);
8000108c:	86b2                	mv	a3,a2
8000108e:	6605                	lui	a2,0x1
80001090:	335d                	jal	80000e36 <mappages>
}
80001092:	40b2                	lw	ra,12(sp)
80001094:	4422                	lw	s0,8(sp)
80001096:	0141                	addi	sp,sp,16
80001098:	8082                	ret

8000109a <uvmalloc>:
// allocate and fill a page table entry for user pages.
// allocate a page of physical memory and map it at va.
// returns new size on success, 0 on failure.
uint32
uvmalloc(pagetable_t pagetable, uint32 va, uint32 sz, int perm)
{
8000109a:	1101                	addi	sp,sp,-32
8000109c:	ce06                	sw	ra,28(sp)
8000109e:	cc22                	sw	s0,24(sp)
800010a0:	ca26                	sw	s1,20(sp)
800010a2:	c84a                	sw	s2,16(sp)
800010a4:	c64e                	sw	s3,12(sp)
800010a6:	c452                	sw	s4,8(sp)
800010a8:	c256                	sw	s5,4(sp)
800010aa:	c05a                	sw	s6,0(sp)
800010ac:	1000                	addi	s0,sp,32
  uint32 a, last;
  uint32 pa;

  if (sz == 0)
800010ae:	c215                	beqz	a2,800010d2 <uvmalloc+0x38>
800010b0:	8a2a                	mv	s4,a0
    panic("uvmalloc");

  // round up to page boundary
  a = PGROUNDUP(va);
800010b2:	6985                	lui	s3,0x1
800010b4:	fff98793          	addi	a5,s3,-1 # fff <_entry-0x7ffff001>
800010b8:	00f58b33          	add	s6,a1,a5
800010bc:	77fd                	lui	a5,0xfffff
800010be:	00fb7933          	and	s2,s6,a5
  last = PGROUNDUP(va + sz) - PGSIZE;
800010c2:	9b32                	add	s6,s6,a2
800010c4:	00fb7b33          	and	s6,s6,a5
800010c8:	413b09b3          	sub	s3,s6,s3
      // out of memory; free what we've allocated
      uvmunmap(pagetable, a, (last - a) / PGSIZE + 1, 1);
      return 0;
    }
    memset((void*)pa, 0, PGSIZE);
    if (mappages(pagetable, a, PGSIZE, pa, PTE_R | PTE_U | perm) != 0) {
800010cc:	0126ea93          	ori	s5,a3,18
800010d0:	a891                	j	80001124 <uvmalloc+0x8a>
    panic("uvmalloc");
800010d2:	0000a517          	auipc	a0,0xa
800010d6:	08250513          	addi	a0,a0,130 # 8000b154 <etext+0x154>
800010da:	edeff0ef          	jal	800007b8 <panic>
      uvmunmap(pagetable, a, (last - a) / PGSIZE + 1, 1);
800010de:	41298633          	sub	a2,s3,s2
800010e2:	8231                	srli	a2,a2,0xc
800010e4:	4685                	li	a3,1
800010e6:	0605                	addi	a2,a2,1 # 1001 <_entry-0x7fffefff>
800010e8:	85ca                	mv	a1,s2
800010ea:	8552                	mv	a0,s4
800010ec:	3de1                	jal	80000fc4 <uvmunmap>
      return 0;
800010ee:	4b01                	li	s6,0
    if (a == last)
      break;
    a += PGSIZE;
  }
  return (PGROUNDUP(va + sz));
}
800010f0:	855a                	mv	a0,s6
800010f2:	40f2                	lw	ra,28(sp)
800010f4:	4462                	lw	s0,24(sp)
800010f6:	44d2                	lw	s1,20(sp)
800010f8:	4942                	lw	s2,16(sp)
800010fa:	49b2                	lw	s3,12(sp)
800010fc:	4a22                	lw	s4,8(sp)
800010fe:	4a92                	lw	s5,4(sp)
80001100:	4b02                	lw	s6,0(sp)
80001102:	6105                	addi	sp,sp,32
80001104:	8082                	ret
      kfree((void*)pa);
80001106:	8526                	mv	a0,s1
80001108:	80bff0ef          	jal	80000912 <kfree>
      uvmunmap(pagetable, a, (last - a) / PGSIZE + 1, 1);
8000110c:	41298633          	sub	a2,s3,s2
80001110:	8231                	srli	a2,a2,0xc
80001112:	4685                	li	a3,1
80001114:	0605                	addi	a2,a2,1
80001116:	85ca                	mv	a1,s2
80001118:	8552                	mv	a0,s4
8000111a:	356d                	jal	80000fc4 <uvmunmap>
      return 0;
8000111c:	4b01                	li	s6,0
8000111e:	bfc9                	j	800010f0 <uvmalloc+0x56>
    a += PGSIZE;
80001120:	6785                	lui	a5,0x1
80001122:	993e                	add	s2,s2,a5
    pa = (uint32)kalloc();
80001124:	8c3ff0ef          	jal	800009e6 <kalloc>
80001128:	84aa                	mv	s1,a0
    if (pa == 0) {
8000112a:	d955                	beqz	a0,800010de <uvmalloc+0x44>
    memset((void*)pa, 0, PGSIZE);
8000112c:	6605                	lui	a2,0x1
8000112e:	4581                	li	a1,0
80001130:	a35ff0ef          	jal	80000b64 <memset>
    if (mappages(pagetable, a, PGSIZE, pa, PTE_R | PTE_U | perm) != 0) {
80001134:	8756                	mv	a4,s5
80001136:	86a6                	mv	a3,s1
80001138:	6605                	lui	a2,0x1
8000113a:	85ca                	mv	a1,s2
8000113c:	8552                	mv	a0,s4
8000113e:	39e5                	jal	80000e36 <mappages>
80001140:	f179                	bnez	a0,80001106 <uvmalloc+0x6c>
    if (a == last)
80001142:	fd391fe3          	bne	s2,s3,80001120 <uvmalloc+0x86>
80001146:	b76d                	j	800010f0 <uvmalloc+0x56>

80001148 <uvmdealloc>:

// free pages between oldsz and newsz.
// returns new size.
uint32
uvmdealloc(pagetable_t pagetable, uint32 oldsz, uint32 newsz)
{
80001148:	872a                	mv	a4,a0
8000114a:	852e                	mv	a0,a1
  if (newsz >= oldsz)
8000114c:	00b66363          	bltu	a2,a1,80001152 <uvmdealloc+0xa>
    return oldsz;
  uvmunmap(pagetable, PGROUNDUP(newsz), (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE, 1);
  return newsz;
}
80001150:	8082                	ret
{
80001152:	1141                	addi	sp,sp,-16
80001154:	c606                	sw	ra,12(sp)
80001156:	c422                	sw	s0,8(sp)
80001158:	c226                	sw	s1,4(sp)
8000115a:	0800                	addi	s0,sp,16
8000115c:	84b2                	mv	s1,a2
  uvmunmap(pagetable, PGROUNDUP(newsz), (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE, 1);
8000115e:	6785                	lui	a5,0x1
80001160:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
80001162:	00f605b3          	add	a1,a2,a5
80001166:	76fd                	lui	a3,0xfffff
80001168:	8df5                	and	a1,a1,a3
8000116a:	97aa                	add	a5,a5,a0
8000116c:	8ff5                	and	a5,a5,a3
8000116e:	8f8d                	sub	a5,a5,a1
80001170:	4685                	li	a3,1
80001172:	00c7d613          	srli	a2,a5,0xc
80001176:	853a                	mv	a0,a4
80001178:	35b1                	jal	80000fc4 <uvmunmap>
  return newsz;
8000117a:	8526                	mv	a0,s1
}
8000117c:	40b2                	lw	ra,12(sp)
8000117e:	4422                	lw	s0,8(sp)
80001180:	4492                	lw	s1,4(sp)
80001182:	0141                	addi	sp,sp,16
80001184:	8082                	ret

80001186 <uvmfree>:

// free all mapped pages in a user page table
void
uvmfree(pagetable_t pagetable, uint32 sz)
{
80001186:	1141                	addi	sp,sp,-16
80001188:	c606                	sw	ra,12(sp)
8000118a:	c422                	sw	s0,8(sp)
8000118c:	c226                	sw	s1,4(sp)
8000118e:	0800                	addi	s0,sp,16
80001190:	84aa                	mv	s1,a0
  if (sz > 0)
80001192:	e989                	bnez	a1,800011a4 <uvmfree+0x1e>
    uvmunmap(pagetable, 0, PGROUNDUP(sz) / PGSIZE, 1);
  kfree((void*)pagetable);
80001194:	8526                	mv	a0,s1
80001196:	f7cff0ef          	jal	80000912 <kfree>
}
8000119a:	40b2                	lw	ra,12(sp)
8000119c:	4422                	lw	s0,8(sp)
8000119e:	4492                	lw	s1,4(sp)
800011a0:	0141                	addi	sp,sp,16
800011a2:	8082                	ret
    uvmunmap(pagetable, 0, PGROUNDUP(sz) / PGSIZE, 1);
800011a4:	6785                	lui	a5,0x1
800011a6:	17fd                	addi	a5,a5,-1 # fff <_entry-0x7ffff001>
800011a8:	95be                	add	a1,a1,a5
800011aa:	4685                	li	a3,1
800011ac:	00c5d613          	srli	a2,a1,0xc
800011b0:	4581                	li	a1,0
800011b2:	3d09                	jal	80000fc4 <uvmunmap>
800011b4:	b7c5                	j	80001194 <uvmfree+0xe>

800011b6 <freewalk>:

// free all mappings and free page table pages recursively
void
freewalk(pagetable_t pagetable)
{
800011b6:	1101                	addi	sp,sp,-32
800011b8:	ce06                	sw	ra,28(sp)
800011ba:	cc22                	sw	s0,24(sp)
800011bc:	ca26                	sw	s1,20(sp)
800011be:	c84a                	sw	s2,16(sp)
800011c0:	c64e                	sw	s3,12(sp)
800011c2:	c452                	sw	s4,8(sp)
800011c4:	1000                	addi	s0,sp,32
800011c6:	8a2a                	mv	s4,a0
  // there are 2^10 = 1024 PTEs in a page table page.
  for (int i = 0; i < 1024; i++) {
800011c8:	84aa                	mv	s1,a0
800011ca:	6905                	lui	s2,0x1
800011cc:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if ((pte & PTE_V) && (pte & (PTE_R | PTE_W | PTE_X)) == 0) {
800011ce:	4985                	li	s3,1
800011d0:	a811                	j	800011e4 <freewalk+0x2e>
      // this PTE points to a lower-level page table.
      uint32 child = PTE2PA(pte);
800011d2:	83a9                	srli	a5,a5,0xa
      freewalk((pagetable_t)child);
800011d4:	00c79513          	slli	a0,a5,0xc
800011d8:	3ff9                	jal	800011b6 <freewalk>
      pagetable[i] = 0;
800011da:	0004a023          	sw	zero,0(s1)
  for (int i = 0; i < 1024; i++) {
800011de:	0491                	addi	s1,s1,4
800011e0:	01248f63          	beq	s1,s2,800011fe <freewalk+0x48>
    pte_t pte = pagetable[i];
800011e4:	409c                	lw	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R | PTE_W | PTE_X)) == 0) {
800011e6:	00f7f713          	andi	a4,a5,15
800011ea:	ff3704e3          	beq	a4,s3,800011d2 <freewalk+0x1c>
    } else if (pte & PTE_V) {
800011ee:	8b85                	andi	a5,a5,1
800011f0:	d7fd                	beqz	a5,800011de <freewalk+0x28>
      panic("freewalk: leaf");
800011f2:	0000a517          	auipc	a0,0xa
800011f6:	f6e50513          	addi	a0,a0,-146 # 8000b160 <etext+0x160>
800011fa:	dbeff0ef          	jal	800007b8 <panic>
    }
  }
  kfree((void*)pagetable);
800011fe:	8552                	mv	a0,s4
80001200:	f12ff0ef          	jal	80000912 <kfree>
}
80001204:	40f2                	lw	ra,28(sp)
80001206:	4462                	lw	s0,24(sp)
80001208:	44d2                	lw	s1,20(sp)
8000120a:	4942                	lw	s2,16(sp)
8000120c:	49b2                	lw	s3,12(sp)
8000120e:	4a22                	lw	s4,8(sp)
80001210:	6105                	addi	sp,sp,32
80001212:	8082                	ret

80001214 <vmfault>:
{
  uint32 pa;
  pte_t *pte;

  // lazy allocation: allocate a page on demand
  if (va >= MAXVA)
80001214:	0605c463          	bltz	a1,8000127c <vmfault+0x68>
{
80001218:	1101                	addi	sp,sp,-32
8000121a:	ce06                	sw	ra,28(sp)
8000121c:	cc22                	sw	s0,24(sp)
8000121e:	ca26                	sw	s1,20(sp)
80001220:	c84a                	sw	s2,16(sp)
80001222:	1000                	addi	s0,sp,32
80001224:	892a                	mv	s2,a0
80001226:	84ae                	mv	s1,a1
    return -1;

  pte = walk(pagetable, va, 0);
80001228:	4601                	li	a2,0
8000122a:	36bd                	jal	80000d98 <walk>
  if (pte == 0 || (*pte & PTE_V) == 0) {
8000122c:	c509                	beqz	a0,80001236 <vmfault+0x22>
8000122e:	411c                	lw	a5,0(a0)
80001230:	0017f713          	andi	a4,a5,1
80001234:	ef1d                	bnez	a4,80001272 <vmfault+0x5e>
80001236:	c64e                	sw	s3,12(sp)
    // page not mapped - lazy allocate
    pa = (uint32)kalloc();
80001238:	faeff0ef          	jal	800009e6 <kalloc>
8000123c:	89aa                	mv	s3,a0
    if (pa == 0) {
8000123e:	c129                	beqz	a0,80001280 <vmfault+0x6c>
      return -1;
    }
    memset((void*)pa, 0, PGSIZE);
80001240:	6605                	lui	a2,0x1
80001242:	4581                	li	a1,0
80001244:	921ff0ef          	jal	80000b64 <memset>
    // round va down to page boundary
    uint32 va_page = PGROUNDDOWN(va);
    if (mappages(pagetable, va_page, PGSIZE, pa, PTE_W | PTE_X | PTE_R | PTE_U) != 0) {
80001248:	4779                	li	a4,30
8000124a:	86ce                	mv	a3,s3
8000124c:	6605                	lui	a2,0x1
8000124e:	75fd                	lui	a1,0xfffff
80001250:	8de5                	and	a1,a1,s1
80001252:	854a                	mv	a0,s2
80001254:	36cd                	jal	80000e36 <mappages>
80001256:	e901                	bnez	a0,80001266 <vmfault+0x52>
80001258:	49b2                	lw	s3,12(sp)
    }
    return 0;
  }
  *pte |= PTE_W;
  return 0;
}
8000125a:	40f2                	lw	ra,28(sp)
8000125c:	4462                	lw	s0,24(sp)
8000125e:	44d2                	lw	s1,20(sp)
80001260:	4942                	lw	s2,16(sp)
80001262:	6105                	addi	sp,sp,32
80001264:	8082                	ret
      kfree((void*)pa);
80001266:	854e                	mv	a0,s3
80001268:	eaaff0ef          	jal	80000912 <kfree>
      return -1;
8000126c:	557d                	li	a0,-1
8000126e:	49b2                	lw	s3,12(sp)
80001270:	b7ed                	j	8000125a <vmfault+0x46>
  *pte |= PTE_W;
80001272:	0047e793          	ori	a5,a5,4
80001276:	c11c                	sw	a5,0(a0)
  return 0;
80001278:	4501                	li	a0,0
8000127a:	b7c5                	j	8000125a <vmfault+0x46>
    return -1;
8000127c:	557d                	li	a0,-1
}
8000127e:	8082                	ret
      return -1;
80001280:	557d                	li	a0,-1
80001282:	49b2                	lw	s3,12(sp)
80001284:	bfd9                	j	8000125a <vmfault+0x46>

80001286 <uvmcopy>:
  uint32 i;
  uint32 va;
  pte_t *pte;
  uint32 pa;

  for (i = 0; i < sz; i += PGSIZE) {
80001286:	c645                	beqz	a2,8000132e <uvmcopy+0xa8>
{
80001288:	7179                	addi	sp,sp,-48
8000128a:	d606                	sw	ra,44(sp)
8000128c:	d422                	sw	s0,40(sp)
8000128e:	d226                	sw	s1,36(sp)
80001290:	d04a                	sw	s2,32(sp)
80001292:	ce4e                	sw	s3,28(sp)
80001294:	cc52                	sw	s4,24(sp)
80001296:	ca56                	sw	s5,20(sp)
80001298:	c85a                	sw	s6,16(sp)
8000129a:	c65e                	sw	s7,12(sp)
8000129c:	1800                	addi	s0,sp,48
8000129e:	8b2a                	mv	s6,a0
800012a0:	8aae                	mv	s5,a1
800012a2:	8a32                	mv	s4,a2
  for (i = 0; i < sz; i += PGSIZE) {
800012a4:	4981                	li	s3,0
    va = i;
    if ((pte = walk(old, va, 0)) == 0)
800012a6:	4601                	li	a2,0
800012a8:	85ce                	mv	a1,s3
800012aa:	855a                	mv	a0,s6
800012ac:	34f5                	jal	80000d98 <walk>
800012ae:	cd1d                	beqz	a0,800012ec <uvmcopy+0x66>
      panic("uvmcopy: pte should exist");
    if ((*pte & PTE_V) == 0)
800012b0:	4118                	lw	a4,0(a0)
800012b2:	00177793          	andi	a5,a4,1
800012b6:	c3a9                	beqz	a5,800012f8 <uvmcopy+0x72>
      panic("uvmcopy: page not present");
    pa = PTE2PA(*pte);
800012b8:	00a75593          	srli	a1,a4,0xa
800012bc:	00c59b93          	slli	s7,a1,0xc
    uint32 flags = PTE_FLAGS(*pte);
800012c0:	3ff77493          	andi	s1,a4,1023
    char *mem = kalloc();
800012c4:	f22ff0ef          	jal	800009e6 <kalloc>
800012c8:	892a                	mv	s2,a0
    if (mem == 0)
800012ca:	c121                	beqz	a0,8000130a <uvmcopy+0x84>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
800012cc:	6605                	lui	a2,0x1
800012ce:	85de                	mv	a1,s7
800012d0:	8e1ff0ef          	jal	80000bb0 <memmove>
    if (mappages(new, va, PGSIZE, (uint32)mem, flags) != 0) {
800012d4:	8726                	mv	a4,s1
800012d6:	86ca                	mv	a3,s2
800012d8:	6605                	lui	a2,0x1
800012da:	85ce                	mv	a1,s3
800012dc:	8556                	mv	a0,s5
800012de:	3ea1                	jal	80000e36 <mappages>
800012e0:	e115                	bnez	a0,80001304 <uvmcopy+0x7e>
  for (i = 0; i < sz; i += PGSIZE) {
800012e2:	6785                	lui	a5,0x1
800012e4:	99be                	add	s3,s3,a5
800012e6:	fd49e0e3          	bltu	s3,s4,800012a6 <uvmcopy+0x20>
800012ea:	a03d                	j	80001318 <uvmcopy+0x92>
      panic("uvmcopy: pte should exist");
800012ec:	0000a517          	auipc	a0,0xa
800012f0:	e8450513          	addi	a0,a0,-380 # 8000b170 <etext+0x170>
800012f4:	cc4ff0ef          	jal	800007b8 <panic>
      panic("uvmcopy: page not present");
800012f8:	0000a517          	auipc	a0,0xa
800012fc:	e9450513          	addi	a0,a0,-364 # 8000b18c <etext+0x18c>
80001300:	cb8ff0ef          	jal	800007b8 <panic>
      kfree(mem);
80001304:	854a                	mv	a0,s2
80001306:	e0cff0ef          	jal	80000912 <kfree>
    }
  }
  return 0;

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
8000130a:	4685                	li	a3,1
8000130c:	00c9d613          	srli	a2,s3,0xc
80001310:	4581                	li	a1,0
80001312:	8556                	mv	a0,s5
80001314:	3945                	jal	80000fc4 <uvmunmap>
  return -1;
80001316:	557d                	li	a0,-1
}
80001318:	50b2                	lw	ra,44(sp)
8000131a:	5422                	lw	s0,40(sp)
8000131c:	5492                	lw	s1,36(sp)
8000131e:	5902                	lw	s2,32(sp)
80001320:	49f2                	lw	s3,28(sp)
80001322:	4a62                	lw	s4,24(sp)
80001324:	4ad2                	lw	s5,20(sp)
80001326:	4b42                	lw	s6,16(sp)
80001328:	4bb2                	lw	s7,12(sp)
8000132a:	6145                	addi	sp,sp,48
8000132c:	8082                	ret
  return 0;
8000132e:	4501                	li	a0,0
}
80001330:	8082                	ret

80001332 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec() for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint32 va)
{
80001332:	1141                	addi	sp,sp,-16
80001334:	c606                	sw	ra,12(sp)
80001336:	c422                	sw	s0,8(sp)
80001338:	0800                	addi	s0,sp,16
  pte_t *pte;

  pte = walk(pagetable, va, 0);
8000133a:	4601                	li	a2,0
8000133c:	3cb1                	jal	80000d98 <walk>
  if (pte == 0)
8000133e:	c901                	beqz	a0,8000134e <uvmclear+0x1c>
    panic("uvmclear");
  *pte &= ~PTE_U;
80001340:	411c                	lw	a5,0(a0)
80001342:	9bbd                	andi	a5,a5,-17
80001344:	c11c                	sw	a5,0(a0)
}
80001346:	40b2                	lw	ra,12(sp)
80001348:	4422                	lw	s0,8(sp)
8000134a:	0141                	addi	sp,sp,16
8000134c:	8082                	ret
    panic("uvmclear");
8000134e:	0000a517          	auipc	a0,0xa
80001352:	e5a50513          	addi	a0,a0,-422 # 8000b1a8 <etext+0x1a8>
80001356:	c62ff0ef          	jal	800007b8 <panic>

8000135a <copyout>:
int
copyout(pagetable_t pagetable, uint32 dstva, char *src, uint32 len)
{
  uint32 n, va0, pa0;

  while (len > 0) {
8000135a:	c2ad                	beqz	a3,800013bc <copyout+0x62>
{
8000135c:	7179                	addi	sp,sp,-48
8000135e:	d606                	sw	ra,44(sp)
80001360:	d422                	sw	s0,40(sp)
80001362:	d226                	sw	s1,36(sp)
80001364:	d04a                	sw	s2,32(sp)
80001366:	ce4e                	sw	s3,28(sp)
80001368:	cc52                	sw	s4,24(sp)
8000136a:	ca56                	sw	s5,20(sp)
8000136c:	c85a                	sw	s6,16(sp)
8000136e:	c65e                	sw	s7,12(sp)
80001370:	c462                	sw	s8,8(sp)
80001372:	1800                	addi	s0,sp,48
80001374:	8b2a                	mv	s6,a0
80001376:	8c2e                	mv	s8,a1
80001378:	8a32                	mv	s4,a2
8000137a:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
8000137c:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if (pa0 == 0)
      return -1;
    n = PGSIZE - (dstva - va0);
8000137e:	6a85                	lui	s5,0x1
80001380:	a839                	j	8000139e <copyout+0x44>
    if (n > len)
      n = len;
    memmove((void*)(pa0 + (dstva - va0)), src, n);
80001382:	9562                	add	a0,a0,s8
80001384:	8626                	mv	a2,s1
80001386:	85d2                	mv	a1,s4
80001388:	41250533          	sub	a0,a0,s2
8000138c:	825ff0ef          	jal	80000bb0 <memmove>

    len -= n;
80001390:	409989b3          	sub	s3,s3,s1
    src += n;
80001394:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
80001396:	01590c33          	add	s8,s2,s5
  while (len > 0) {
8000139a:	00098f63          	beqz	s3,800013b8 <copyout+0x5e>
    va0 = PGROUNDDOWN(dstva);
8000139e:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
800013a2:	85ca                	mv	a1,s2
800013a4:	855a                	mv	a0,s6
800013a6:	3ca1                	jal	80000dfe <walkaddr>
    if (pa0 == 0)
800013a8:	cd01                	beqz	a0,800013c0 <copyout+0x66>
    n = PGSIZE - (dstva - va0);
800013aa:	418904b3          	sub	s1,s2,s8
800013ae:	94d6                	add	s1,s1,s5
    if (n > len)
800013b0:	fc99f9e3          	bgeu	s3,s1,80001382 <copyout+0x28>
800013b4:	84ce                	mv	s1,s3
800013b6:	b7f1                	j	80001382 <copyout+0x28>
  }
  return 0;
800013b8:	4501                	li	a0,0
800013ba:	a021                	j	800013c2 <copyout+0x68>
800013bc:	4501                	li	a0,0
}
800013be:	8082                	ret
      return -1;
800013c0:	557d                	li	a0,-1
}
800013c2:	50b2                	lw	ra,44(sp)
800013c4:	5422                	lw	s0,40(sp)
800013c6:	5492                	lw	s1,36(sp)
800013c8:	5902                	lw	s2,32(sp)
800013ca:	49f2                	lw	s3,28(sp)
800013cc:	4a62                	lw	s4,24(sp)
800013ce:	4ad2                	lw	s5,20(sp)
800013d0:	4b42                	lw	s6,16(sp)
800013d2:	4bb2                	lw	s7,12(sp)
800013d4:	4c22                	lw	s8,8(sp)
800013d6:	6145                	addi	sp,sp,48
800013d8:	8082                	ret

800013da <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint32 srcva, uint32 len)
{
  uint32 n, va0, pa0;

  while (len > 0) {
800013da:	c2b5                	beqz	a3,8000143e <copyin+0x64>
{
800013dc:	7179                	addi	sp,sp,-48
800013de:	d606                	sw	ra,44(sp)
800013e0:	d422                	sw	s0,40(sp)
800013e2:	d226                	sw	s1,36(sp)
800013e4:	d04a                	sw	s2,32(sp)
800013e6:	ce4e                	sw	s3,28(sp)
800013e8:	cc52                	sw	s4,24(sp)
800013ea:	ca56                	sw	s5,20(sp)
800013ec:	c85a                	sw	s6,16(sp)
800013ee:	c65e                	sw	s7,12(sp)
800013f0:	c462                	sw	s8,8(sp)
800013f2:	1800                	addi	s0,sp,48
800013f4:	8b2a                	mv	s6,a0
800013f6:	8a2e                	mv	s4,a1
800013f8:	8c32                	mv	s8,a2
800013fa:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
800013fc:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if (pa0 == 0)
      return -1;
    n = PGSIZE - (srcva - va0);
800013fe:	6a85                	lui	s5,0x1
80001400:	a005                	j	80001420 <copyin+0x46>
    if (n > len)
      n = len;
    memmove(dst, (void*)(pa0 + (srcva - va0)), n);
80001402:	018505b3          	add	a1,a0,s8
80001406:	8626                	mv	a2,s1
80001408:	412585b3          	sub	a1,a1,s2
8000140c:	8552                	mv	a0,s4
8000140e:	fa2ff0ef          	jal	80000bb0 <memmove>

    len -= n;
80001412:	409989b3          	sub	s3,s3,s1
    dst += n;
80001416:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
80001418:	01590c33          	add	s8,s2,s5
  while (len > 0) {
8000141c:	00098f63          	beqz	s3,8000143a <copyin+0x60>
    va0 = PGROUNDDOWN(srcva);
80001420:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
80001424:	85ca                	mv	a1,s2
80001426:	855a                	mv	a0,s6
80001428:	3ad9                	jal	80000dfe <walkaddr>
    if (pa0 == 0)
8000142a:	cd01                	beqz	a0,80001442 <copyin+0x68>
    n = PGSIZE - (srcva - va0);
8000142c:	418904b3          	sub	s1,s2,s8
80001430:	94d6                	add	s1,s1,s5
    if (n > len)
80001432:	fc99f8e3          	bgeu	s3,s1,80001402 <copyin+0x28>
80001436:	84ce                	mv	s1,s3
80001438:	b7e9                	j	80001402 <copyin+0x28>
  }
  return 0;
8000143a:	4501                	li	a0,0
8000143c:	a021                	j	80001444 <copyin+0x6a>
8000143e:	4501                	li	a0,0
}
80001440:	8082                	ret
      return -1;
80001442:	557d                	li	a0,-1
}
80001444:	50b2                	lw	ra,44(sp)
80001446:	5422                	lw	s0,40(sp)
80001448:	5492                	lw	s1,36(sp)
8000144a:	5902                	lw	s2,32(sp)
8000144c:	49f2                	lw	s3,28(sp)
8000144e:	4a62                	lw	s4,24(sp)
80001450:	4ad2                	lw	s5,20(sp)
80001452:	4b42                	lw	s6,16(sp)
80001454:	4bb2                	lw	s7,12(sp)
80001456:	4c22                	lw	s8,8(sp)
80001458:	6145                	addi	sp,sp,48
8000145a:	8082                	ret

8000145c <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint32 srcva, uint32 max)
{
  uint32 n, va0, pa0;
  int got_null = 0;

  while (got_null == 0 && max > 0) {
8000145c:	c2d5                	beqz	a3,80001500 <copyinstr+0xa4>
{
8000145e:	7179                	addi	sp,sp,-48
80001460:	d606                	sw	ra,44(sp)
80001462:	d422                	sw	s0,40(sp)
80001464:	d226                	sw	s1,36(sp)
80001466:	d04a                	sw	s2,32(sp)
80001468:	ce4e                	sw	s3,28(sp)
8000146a:	cc52                	sw	s4,24(sp)
8000146c:	ca56                	sw	s5,20(sp)
8000146e:	c85a                	sw	s6,16(sp)
80001470:	c65e                	sw	s7,12(sp)
80001472:	1800                	addi	s0,sp,48
80001474:	89aa                	mv	s3,a0
80001476:	8b2e                	mv	s6,a1
80001478:	84b2                	mv	s1,a2
8000147a:	8936                	mv	s2,a3
    va0 = PGROUNDDOWN(srcva);
8000147c:	7a7d                	lui	s4,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if (pa0 == 0)
      return -1;
    n = PGSIZE - (srcva - va0);
8000147e:	6a85                	lui	s5,0x1
80001480:	a825                	j	800014b8 <copyinstr+0x5c>
      n = max;

    char *p = (char*)(pa0 + (srcva - va0));
    while (n > 0) {
      if (*p == '\0') {
        *dst = '\0';
80001482:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x7ffff000>
80001486:	4785                	li	a5,1
      n--;
      max--;
    }
  }

  if (got_null) {
80001488:	fff78513          	addi	a0,a5,-1
    return 0;
  } else {
    return -1;
  }
}
8000148c:	50b2                	lw	ra,44(sp)
8000148e:	5422                	lw	s0,40(sp)
80001490:	5492                	lw	s1,36(sp)
80001492:	5902                	lw	s2,32(sp)
80001494:	49f2                	lw	s3,28(sp)
80001496:	4a62                	lw	s4,24(sp)
80001498:	4ad2                	lw	s5,20(sp)
8000149a:	4b42                	lw	s6,16(sp)
8000149c:	4bb2                	lw	s7,12(sp)
8000149e:	6145                	addi	sp,sp,48
800014a0:	8082                	ret
800014a2:	012606b3          	add	a3,a2,s2
      max--;
800014a6:	40f68933          	sub	s2,a3,a5
  while (got_null == 0 && max > 0) {
800014aa:	04d78763          	beq	a5,a3,800014f8 <copyinstr+0x9c>
800014ae:	40c48633          	sub	a2,s1,a2
      srcva++;
800014b2:	00c784b3          	add	s1,a5,a2
800014b6:	8b3e                	mv	s6,a5
    va0 = PGROUNDDOWN(srcva);
800014b8:	0144fbb3          	and	s7,s1,s4
    pa0 = walkaddr(pagetable, va0);
800014bc:	85de                	mv	a1,s7
800014be:	854e                	mv	a0,s3
800014c0:	3a3d                	jal	80000dfe <walkaddr>
    if (pa0 == 0)
800014c2:	cd0d                	beqz	a0,800014fc <copyinstr+0xa0>
    n = PGSIZE - (srcva - va0);
800014c4:	409b86b3          	sub	a3,s7,s1
800014c8:	96d6                	add	a3,a3,s5
    if (n > max)
800014ca:	00d97363          	bgeu	s2,a3,800014d0 <copyinstr+0x74>
800014ce:	86ca                	mv	a3,s2
    char *p = (char*)(pa0 + (srcva - va0));
800014d0:	9526                	add	a0,a0,s1
800014d2:	41750533          	sub	a0,a0,s7
    while (n > 0) {
800014d6:	d2ed                	beqz	a3,800014b8 <copyinstr+0x5c>
800014d8:	87da                	mv	a5,s6
800014da:	865a                	mv	a2,s6
      if (*p == '\0') {
800014dc:	41650833          	sub	a6,a0,s6
    while (n > 0) {
800014e0:	96da                	add	a3,a3,s6
      if (*p == '\0') {
800014e2:	01078733          	add	a4,a5,a6
800014e6:	00074703          	lbu	a4,0(a4) # 80000000 <_entry>
800014ea:	df41                	beqz	a4,80001482 <copyinstr+0x26>
        *dst = *p;
800014ec:	00e78023          	sb	a4,0(a5)
      dst++;
800014f0:	0785                	addi	a5,a5,1
    while (n > 0) {
800014f2:	fef698e3          	bne	a3,a5,800014e2 <copyinstr+0x86>
800014f6:	b775                	j	800014a2 <copyinstr+0x46>
800014f8:	4781                	li	a5,0
800014fa:	b779                	j	80001488 <copyinstr+0x2c>
      return -1;
800014fc:	557d                	li	a0,-1
800014fe:	b779                	j	8000148c <copyinstr+0x30>
  int got_null = 0;
80001500:	4781                	li	a5,0
  if (got_null) {
80001502:	fff78513          	addi	a0,a5,-1
}
80001506:	8082                	ret

80001508 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
80001508:	1101                	addi	sp,sp,-32
8000150a:	ce06                	sw	ra,28(sp)
8000150c:	cc22                	sw	s0,24(sp)
8000150e:	ca26                	sw	s1,20(sp)
80001510:	c84a                	sw	s2,16(sp)
80001512:	c64e                	sw	s3,12(sp)
80001514:	c452                	sw	s4,8(sp)
80001516:	c256                	sw	s5,4(sp)
80001518:	c05a                	sw	s6,0(sp)
8000151a:	1000                	addi	s0,sp,32
8000151c:	89aa                	mv	s3,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
8000151e:	000ba497          	auipc	s1,0xba
80001522:	c9a48493          	addi	s1,s1,-870 # 800bb1b8 <proc>
    char *pa = kalloc();
    if (pa == 0)
      panic("kalloc");
    uint64 va = KSTACK((int)(p - proc));
80001526:	8b26                	mv	s6,s1
80001528:	aaaab937          	lui	s2,0xaaaab
8000152c:	aab90913          	addi	s2,s2,-1365 # aaaaaaab <end+0x2a9da52f>
80001530:	7afd                	lui	s5,0xfffff
  for (p = proc; p < &proc[NPROC]; p++) {
80001532:	000bda17          	auipc	s4,0xbd
80001536:	c86a0a13          	addi	s4,s4,-890 # 800be1b8 <tickslock>
    char *pa = kalloc();
8000153a:	cacff0ef          	jal	800009e6 <kalloc>
8000153e:	862a                	mv	a2,a0
    if (pa == 0)
80001540:	cd0d                	beqz	a0,8000157a <proc_mapstacks+0x72>
    uint64 va = KSTACK((int)(p - proc));
80001542:	416485b3          	sub	a1,s1,s6
80001546:	8599                	srai	a1,a1,0x6
80001548:	032585b3          	mul	a1,a1,s2
8000154c:	0585                	addi	a1,a1,1 # fffff001 <end+0x7ff2ea85>
8000154e:	05b6                	slli	a1,a1,0xd
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
80001550:	4719                	li	a4,6
80001552:	6685                	lui	a3,0x1
80001554:	40ba85b3          	sub	a1,s5,a1
80001558:	854e                	mv	a0,s3
8000155a:	98bff0ef          	jal	80000ee4 <kvmmap>
  for (p = proc; p < &proc[NPROC]; p++) {
8000155e:	0c048493          	addi	s1,s1,192
80001562:	fd449ce3          	bne	s1,s4,8000153a <proc_mapstacks+0x32>
  }
}
80001566:	40f2                	lw	ra,28(sp)
80001568:	4462                	lw	s0,24(sp)
8000156a:	44d2                	lw	s1,20(sp)
8000156c:	4942                	lw	s2,16(sp)
8000156e:	49b2                	lw	s3,12(sp)
80001570:	4a22                	lw	s4,8(sp)
80001572:	4a92                	lw	s5,4(sp)
80001574:	4b02                	lw	s6,0(sp)
80001576:	6105                	addi	sp,sp,32
80001578:	8082                	ret
      panic("kalloc");
8000157a:	0000a517          	auipc	a0,0xa
8000157e:	c3a50513          	addi	a0,a0,-966 # 8000b1b4 <etext+0x1b4>
80001582:	a36ff0ef          	jal	800007b8 <panic>

80001586 <procinit>:

// initialize the proc table.
void
procinit(void)
{
80001586:	1101                	addi	sp,sp,-32
80001588:	ce06                	sw	ra,28(sp)
8000158a:	cc22                	sw	s0,24(sp)
8000158c:	ca26                	sw	s1,20(sp)
8000158e:	c84a                	sw	s2,16(sp)
80001590:	c64e                	sw	s3,12(sp)
80001592:	c452                	sw	s4,8(sp)
80001594:	c256                	sw	s5,4(sp)
80001596:	c05a                	sw	s6,0(sp)
80001598:	1000                	addi	s0,sp,32
  struct proc *p;

  initlock(&pid_lock, "nextpid");
8000159a:	0000a597          	auipc	a1,0xa
8000159e:	c2258593          	addi	a1,a1,-990 # 8000b1bc <etext+0x1bc>
800015a2:	000ba517          	auipc	a0,0xba
800015a6:	9de50513          	addi	a0,a0,-1570 # 800baf80 <pid_lock>
800015aa:	c84ff0ef          	jal	80000a2e <initlock>
  initlock(&wait_lock, "wait_lock");
800015ae:	0000a597          	auipc	a1,0xa
800015b2:	c1658593          	addi	a1,a1,-1002 # 8000b1c4 <etext+0x1c4>
800015b6:	000ba517          	auipc	a0,0xba
800015ba:	9d650513          	addi	a0,a0,-1578 # 800baf8c <wait_lock>
800015be:	c70ff0ef          	jal	80000a2e <initlock>
  for (p = proc; p < &proc[NPROC]; p++) {
800015c2:	000ba497          	auipc	s1,0xba
800015c6:	bf648493          	addi	s1,s1,-1034 # 800bb1b8 <proc>
    initlock(&p->lock, "proc");
800015ca:	0000ab17          	auipc	s6,0xa
800015ce:	c06b0b13          	addi	s6,s6,-1018 # 8000b1d0 <etext+0x1d0>
    p->state = UNUSED;
    p->kstack = KSTACK((int)(p - proc));
800015d2:	8aa6                	mv	s5,s1
800015d4:	aaaab937          	lui	s2,0xaaaab
800015d8:	aab90913          	addi	s2,s2,-1365 # aaaaaaab <end+0x2a9da52f>
800015dc:	7a7d                	lui	s4,0xfffff
  for (p = proc; p < &proc[NPROC]; p++) {
800015de:	000bd997          	auipc	s3,0xbd
800015e2:	bda98993          	addi	s3,s3,-1062 # 800be1b8 <tickslock>
    initlock(&p->lock, "proc");
800015e6:	85da                	mv	a1,s6
800015e8:	8526                	mv	a0,s1
800015ea:	c44ff0ef          	jal	80000a2e <initlock>
    p->state = UNUSED;
800015ee:	0004a623          	sw	zero,12(s1)
    p->kstack = KSTACK((int)(p - proc));
800015f2:	415487b3          	sub	a5,s1,s5
800015f6:	8799                	srai	a5,a5,0x6
800015f8:	032787b3          	mul	a5,a5,s2
800015fc:	0785                	addi	a5,a5,1
800015fe:	07b6                	slli	a5,a5,0xd
80001600:	40fa07b3          	sub	a5,s4,a5
80001604:	d0dc                	sw	a5,36(s1)
  for (p = proc; p < &proc[NPROC]; p++) {
80001606:	0c048493          	addi	s1,s1,192
8000160a:	fd349ee3          	bne	s1,s3,800015e6 <procinit+0x60>
  }
}
8000160e:	40f2                	lw	ra,28(sp)
80001610:	4462                	lw	s0,24(sp)
80001612:	44d2                	lw	s1,20(sp)
80001614:	4942                	lw	s2,16(sp)
80001616:	49b2                	lw	s3,12(sp)
80001618:	4a22                	lw	s4,8(sp)
8000161a:	4a92                	lw	s5,4(sp)
8000161c:	4b02                	lw	s6,0(sp)
8000161e:	6105                	addi	sp,sp,32
80001620:	8082                	ret

80001622 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
80001622:	1141                	addi	sp,sp,-16
80001624:	c622                	sw	s0,12(sp)
80001626:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r"(x));
80001628:	8512                	mv	a0,tp
  int id = r_tp();
  return id;
}
8000162a:	4432                	lw	s0,12(sp)
8000162c:	0141                	addi	sp,sp,16
8000162e:	8082                	ret

80001630 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu *
mycpu(void)
{
80001630:	1141                	addi	sp,sp,-16
80001632:	c622                	sw	s0,12(sp)
80001634:	0800                	addi	s0,sp,16
80001636:	8712                	mv	a4,tp
  int id = cpuid();
  struct cpu *c = &cpus[id];
80001638:	00471793          	slli	a5,a4,0x4
8000163c:	97ba                	add	a5,a5,a4
8000163e:	078a                	slli	a5,a5,0x2
  return c;
}
80001640:	000ba517          	auipc	a0,0xba
80001644:	95850513          	addi	a0,a0,-1704 # 800baf98 <cpus>
80001648:	953e                	add	a0,a0,a5
8000164a:	4432                	lw	s0,12(sp)
8000164c:	0141                	addi	sp,sp,16
8000164e:	8082                	ret

80001650 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc *
myproc(void)
{
80001650:	1141                	addi	sp,sp,-16
80001652:	c606                	sw	ra,12(sp)
80001654:	c422                	sw	s0,8(sp)
80001656:	c226                	sw	s1,4(sp)
80001658:	0800                	addi	s0,sp,16
  push_off();
8000165a:	c14ff0ef          	jal	80000a6e <push_off>
8000165e:	8712                	mv	a4,tp
  struct cpu *c = mycpu();
  struct proc *p = c->proc;
80001660:	00471793          	slli	a5,a4,0x4
80001664:	97ba                	add	a5,a5,a4
80001666:	078a                	slli	a5,a5,0x2
80001668:	000ba717          	auipc	a4,0xba
8000166c:	91870713          	addi	a4,a4,-1768 # 800baf80 <pid_lock>
80001670:	97ba                	add	a5,a5,a4
80001672:	4f84                	lw	s1,24(a5)
  pop_off();
80001674:	c72ff0ef          	jal	80000ae6 <pop_off>
  return p;
}
80001678:	8526                	mv	a0,s1
8000167a:	40b2                	lw	ra,12(sp)
8000167c:	4422                	lw	s0,8(sp)
8000167e:	4492                	lw	s1,4(sp)
80001680:	0141                	addi	sp,sp,16
80001682:	8082                	ret

80001684 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
80001684:	1101                	addi	sp,sp,-32
80001686:	ce06                	sw	ra,28(sp)
80001688:	cc22                	sw	s0,24(sp)
8000168a:	ca26                	sw	s1,20(sp)
8000168c:	1000                	addi	s0,sp,32
  extern char userret[];
  static int first = 1;
  struct proc *p = myproc();
8000168e:	37c9                	jal	80001650 <myproc>
80001690:	84aa                	mv	s1,a0

  // Still holding p->lock from scheduler.
  release(&p->lock);
80001692:	ca0ff0ef          	jal	80000b32 <release>

  if (first) {
80001696:	000b1797          	auipc	a5,0xb1
8000169a:	7ba7a783          	lw	a5,1978(a5) # 800b2e50 <first.1>
8000169e:	cf8d                	beqz	a5,800016d8 <forkret+0x54>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    fsinit(ROOTDEV);
800016a0:	4505                	li	a0,1
800016a2:	2c5010ef          	jal	80003166 <fsinit>

    first = 0;
800016a6:	000b1797          	auipc	a5,0xb1
800016aa:	7a07a523          	sw	zero,1962(a5) # 800b2e50 <first.1>
    // ensure other cores see first=0.
    __atomic_thread_fence(__ATOMIC_SEQ_CST);
800016ae:	0ff0000f          	fence

    // We can invoke kexec() now that file system is initialized.
    // Put the return value (argc) of kexec into a0.
    p->trapframe->a0 = kexec("/init", (char *[]){"/init", 0});
800016b2:	0000a517          	auipc	a0,0xa
800016b6:	b2650513          	addi	a0,a0,-1242 # 8000b1d8 <etext+0x1d8>
800016ba:	fea42423          	sw	a0,-24(s0)
800016be:	fe042623          	sw	zero,-20(s0)
800016c2:	fe840593          	addi	a1,s0,-24
800016c6:	311020ef          	jal	800041d6 <kexec>
800016ca:	589c                	lw	a5,48(s1)
800016cc:	df88                	sw	a0,56(a5)
    if (p->trapframe->a0 == -1) {
800016ce:	589c                	lw	a5,48(s1)
800016d0:	5f98                	lw	a4,56(a5)
800016d2:	57fd                	li	a5,-1
800016d4:	02f70a63          	beq	a4,a5,80001708 <forkret+0x84>
      panic("exec");
    }
  }

  // return to user space, mimicing usertrap()'s return.
  prepare_return();
800016d8:	2c7000ef          	jal	8000219e <prepare_return>
  uint64 satp = MAKE_SATP(p->pagetable);
800016dc:	54d8                	lw	a4,44(s1)
800016de:	8331                	srli	a4,a4,0xc
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
800016e0:	00009797          	auipc	a5,0x9
800016e4:	9b678793          	addi	a5,a5,-1610 # 8000a096 <userret>
800016e8:	00009697          	auipc	a3,0x9
800016ec:	91868693          	addi	a3,a3,-1768 # 8000a000 <_trampoline>
800016f0:	8f95                	sub	a5,a5,a3
800016f2:	76fd                	lui	a3,0xfffff
800016f4:	97b6                	add	a5,a5,a3
  ((void (*)(uint64))trampoline_userret)(satp);
800016f6:	80000537          	lui	a0,0x80000
800016fa:	8d59                	or	a0,a0,a4
800016fc:	9782                	jalr	a5
}
800016fe:	40f2                	lw	ra,28(sp)
80001700:	4462                	lw	s0,24(sp)
80001702:	44d2                	lw	s1,20(sp)
80001704:	6105                	addi	sp,sp,32
80001706:	8082                	ret
      panic("exec");
80001708:	0000a517          	auipc	a0,0xa
8000170c:	ad850513          	addi	a0,a0,-1320 # 8000b1e0 <etext+0x1e0>
80001710:	8a8ff0ef          	jal	800007b8 <panic>

80001714 <allocpid>:
{
80001714:	1141                	addi	sp,sp,-16
80001716:	c606                	sw	ra,12(sp)
80001718:	c422                	sw	s0,8(sp)
8000171a:	c226                	sw	s1,4(sp)
8000171c:	c04a                	sw	s2,0(sp)
8000171e:	0800                	addi	s0,sp,16
  acquire(&pid_lock);
80001720:	000ba917          	auipc	s2,0xba
80001724:	86090913          	addi	s2,s2,-1952 # 800baf80 <pid_lock>
80001728:	854a                	mv	a0,s2
8000172a:	b84ff0ef          	jal	80000aae <acquire>
  pid = nextpid;
8000172e:	000b1797          	auipc	a5,0xb1
80001732:	72678793          	addi	a5,a5,1830 # 800b2e54 <nextpid>
80001736:	4384                	lw	s1,0(a5)
  nextpid = nextpid + 1;
80001738:	00148713          	addi	a4,s1,1
8000173c:	c398                	sw	a4,0(a5)
  release(&pid_lock);
8000173e:	854a                	mv	a0,s2
80001740:	bf2ff0ef          	jal	80000b32 <release>
}
80001744:	8526                	mv	a0,s1
80001746:	40b2                	lw	ra,12(sp)
80001748:	4422                	lw	s0,8(sp)
8000174a:	4492                	lw	s1,4(sp)
8000174c:	4902                	lw	s2,0(sp)
8000174e:	0141                	addi	sp,sp,16
80001750:	8082                	ret

80001752 <proc_pagetable>:
{
80001752:	1141                	addi	sp,sp,-16
80001754:	c606                	sw	ra,12(sp)
80001756:	c422                	sw	s0,8(sp)
80001758:	c226                	sw	s1,4(sp)
8000175a:	c04a                	sw	s2,0(sp)
8000175c:	0800                	addi	s0,sp,16
8000175e:	892a                	mv	s2,a0
  pagetable = uvmcreate();
80001760:	841ff0ef          	jal	80000fa0 <uvmcreate>
80001764:	84aa                	mv	s1,a0
  if (pagetable == 0)
80001766:	c515                	beqz	a0,80001792 <proc_pagetable+0x40>
  if (mappages(pagetable, TRAMPOLINE, PGSIZE, (uint64)trampoline,
80001768:	4729                	li	a4,10
8000176a:	00009697          	auipc	a3,0x9
8000176e:	89668693          	addi	a3,a3,-1898 # 8000a000 <_trampoline>
80001772:	6605                	lui	a2,0x1
80001774:	75fd                	lui	a1,0xfffff
80001776:	ec0ff0ef          	jal	80000e36 <mappages>
8000177a:	02054363          	bltz	a0,800017a0 <proc_pagetable+0x4e>
  if (mappages(pagetable, TRAPFRAME, PGSIZE, (uint64)(p->trapframe),
8000177e:	4719                	li	a4,6
80001780:	03092683          	lw	a3,48(s2)
80001784:	6605                	lui	a2,0x1
80001786:	75f9                	lui	a1,0xffffe
80001788:	8526                	mv	a0,s1
8000178a:	eacff0ef          	jal	80000e36 <mappages>
8000178e:	00054f63          	bltz	a0,800017ac <proc_pagetable+0x5a>
}
80001792:	8526                	mv	a0,s1
80001794:	40b2                	lw	ra,12(sp)
80001796:	4422                	lw	s0,8(sp)
80001798:	4492                	lw	s1,4(sp)
8000179a:	4902                	lw	s2,0(sp)
8000179c:	0141                	addi	sp,sp,16
8000179e:	8082                	ret
    uvmfree(pagetable, 0);
800017a0:	4581                	li	a1,0
800017a2:	8526                	mv	a0,s1
800017a4:	9e3ff0ef          	jal	80001186 <uvmfree>
    return 0;
800017a8:	4481                	li	s1,0
800017aa:	b7e5                	j	80001792 <proc_pagetable+0x40>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
800017ac:	4681                	li	a3,0
800017ae:	4605                	li	a2,1
800017b0:	75fd                	lui	a1,0xfffff
800017b2:	8526                	mv	a0,s1
800017b4:	811ff0ef          	jal	80000fc4 <uvmunmap>
    uvmfree(pagetable, 0);
800017b8:	4581                	li	a1,0
800017ba:	8526                	mv	a0,s1
800017bc:	9cbff0ef          	jal	80001186 <uvmfree>
    return 0;
800017c0:	4481                	li	s1,0
800017c2:	bfc1                	j	80001792 <proc_pagetable+0x40>

800017c4 <proc_freepagetable>:
{
800017c4:	1141                	addi	sp,sp,-16
800017c6:	c606                	sw	ra,12(sp)
800017c8:	c422                	sw	s0,8(sp)
800017ca:	c226                	sw	s1,4(sp)
800017cc:	c04a                	sw	s2,0(sp)
800017ce:	0800                	addi	s0,sp,16
800017d0:	84aa                	mv	s1,a0
800017d2:	892e                	mv	s2,a1
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
800017d4:	4681                	li	a3,0
800017d6:	4605                	li	a2,1
800017d8:	75fd                	lui	a1,0xfffff
800017da:	feaff0ef          	jal	80000fc4 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
800017de:	4681                	li	a3,0
800017e0:	4605                	li	a2,1
800017e2:	75f9                	lui	a1,0xffffe
800017e4:	8526                	mv	a0,s1
800017e6:	fdeff0ef          	jal	80000fc4 <uvmunmap>
  uvmfree(pagetable, sz);
800017ea:	85ca                	mv	a1,s2
800017ec:	8526                	mv	a0,s1
800017ee:	999ff0ef          	jal	80001186 <uvmfree>
}
800017f2:	40b2                	lw	ra,12(sp)
800017f4:	4422                	lw	s0,8(sp)
800017f6:	4492                	lw	s1,4(sp)
800017f8:	4902                	lw	s2,0(sp)
800017fa:	0141                	addi	sp,sp,16
800017fc:	8082                	ret

800017fe <freeproc>:
{
800017fe:	1141                	addi	sp,sp,-16
80001800:	c606                	sw	ra,12(sp)
80001802:	c422                	sw	s0,8(sp)
80001804:	c226                	sw	s1,4(sp)
80001806:	0800                	addi	s0,sp,16
80001808:	84aa                	mv	s1,a0
  if (p->trapframe)
8000180a:	5908                	lw	a0,48(a0)
8000180c:	c119                	beqz	a0,80001812 <freeproc+0x14>
    kfree((void *)p->trapframe);
8000180e:	904ff0ef          	jal	80000912 <kfree>
  p->trapframe = 0;
80001812:	0204a823          	sw	zero,48(s1)
  if (p->pagetable)
80001816:	54c8                	lw	a0,44(s1)
80001818:	c119                	beqz	a0,8000181e <freeproc+0x20>
    proc_freepagetable(p->pagetable, p->sz);
8000181a:	548c                	lw	a1,40(s1)
8000181c:	3765                	jal	800017c4 <proc_freepagetable>
  p->pagetable = 0;
8000181e:	0204a623          	sw	zero,44(s1)
  p->sz = 0;
80001822:	0204a423          	sw	zero,40(s1)
  p->pid = 0;
80001826:	0004ae23          	sw	zero,28(s1)
  p->parent = 0;
8000182a:	0204a023          	sw	zero,32(s1)
  p->name[0] = 0;
8000182e:	0a048823          	sb	zero,176(s1)
  p->chan = 0;
80001832:	0004a823          	sw	zero,16(s1)
  p->killed = 0;
80001836:	0004aa23          	sw	zero,20(s1)
  p->xstate = 0;
8000183a:	0004ac23          	sw	zero,24(s1)
  p->state = UNUSED;
8000183e:	0004a623          	sw	zero,12(s1)
}
80001842:	40b2                	lw	ra,12(sp)
80001844:	4422                	lw	s0,8(sp)
80001846:	4492                	lw	s1,4(sp)
80001848:	0141                	addi	sp,sp,16
8000184a:	8082                	ret

8000184c <allocproc>:
{
8000184c:	1141                	addi	sp,sp,-16
8000184e:	c606                	sw	ra,12(sp)
80001850:	c422                	sw	s0,8(sp)
80001852:	c226                	sw	s1,4(sp)
80001854:	c04a                	sw	s2,0(sp)
80001856:	0800                	addi	s0,sp,16
  for (p = proc; p < &proc[NPROC]; p++) {
80001858:	000ba497          	auipc	s1,0xba
8000185c:	96048493          	addi	s1,s1,-1696 # 800bb1b8 <proc>
80001860:	000bd917          	auipc	s2,0xbd
80001864:	95890913          	addi	s2,s2,-1704 # 800be1b8 <tickslock>
    acquire(&p->lock);
80001868:	8526                	mv	a0,s1
8000186a:	a44ff0ef          	jal	80000aae <acquire>
    if (p->state == UNUSED) {
8000186e:	44dc                	lw	a5,12(s1)
80001870:	cb91                	beqz	a5,80001884 <allocproc+0x38>
      release(&p->lock);
80001872:	8526                	mv	a0,s1
80001874:	abeff0ef          	jal	80000b32 <release>
  for (p = proc; p < &proc[NPROC]; p++) {
80001878:	0c048493          	addi	s1,s1,192
8000187c:	ff2496e3          	bne	s1,s2,80001868 <allocproc+0x1c>
  return 0;
80001880:	4481                	li	s1,0
80001882:	a83d                	j	800018c0 <allocproc+0x74>
  p->pid = allocpid();
80001884:	3d41                	jal	80001714 <allocpid>
80001886:	ccc8                	sw	a0,28(s1)
  p->state = USED;
80001888:	4785                	li	a5,1
8000188a:	c4dc                	sw	a5,12(s1)
  if ((p->trapframe = (struct trapframe *)kalloc()) == 0) {
8000188c:	95aff0ef          	jal	800009e6 <kalloc>
80001890:	892a                	mv	s2,a0
80001892:	d888                	sw	a0,48(s1)
80001894:	cd0d                	beqz	a0,800018ce <allocproc+0x82>
  p->pagetable = proc_pagetable(p);
80001896:	8526                	mv	a0,s1
80001898:	3d6d                	jal	80001752 <proc_pagetable>
8000189a:	892a                	mv	s2,a0
8000189c:	d4c8                	sw	a0,44(s1)
  if (p->pagetable == 0) {
8000189e:	cd1d                	beqz	a0,800018dc <allocproc+0x90>
  memset(&p->context, 0, sizeof(p->context));
800018a0:	03800613          	li	a2,56
800018a4:	4581                	li	a1,0
800018a6:	03448513          	addi	a0,s1,52
800018aa:	abaff0ef          	jal	80000b64 <memset>
  p->context.ra = (uint64)forkret;
800018ae:	00000797          	auipc	a5,0x0
800018b2:	dd678793          	addi	a5,a5,-554 # 80001684 <forkret>
800018b6:	d8dc                	sw	a5,52(s1)
  p->context.sp = p->kstack + PGSIZE;
800018b8:	50dc                	lw	a5,36(s1)
800018ba:	6705                	lui	a4,0x1
800018bc:	97ba                	add	a5,a5,a4
800018be:	dc9c                	sw	a5,56(s1)
}
800018c0:	8526                	mv	a0,s1
800018c2:	40b2                	lw	ra,12(sp)
800018c4:	4422                	lw	s0,8(sp)
800018c6:	4492                	lw	s1,4(sp)
800018c8:	4902                	lw	s2,0(sp)
800018ca:	0141                	addi	sp,sp,16
800018cc:	8082                	ret
    freeproc(p);
800018ce:	8526                	mv	a0,s1
800018d0:	373d                	jal	800017fe <freeproc>
    release(&p->lock);
800018d2:	8526                	mv	a0,s1
800018d4:	a5eff0ef          	jal	80000b32 <release>
    return 0;
800018d8:	84ca                	mv	s1,s2
800018da:	b7dd                	j	800018c0 <allocproc+0x74>
    freeproc(p);
800018dc:	8526                	mv	a0,s1
800018de:	3705                	jal	800017fe <freeproc>
    release(&p->lock);
800018e0:	8526                	mv	a0,s1
800018e2:	a50ff0ef          	jal	80000b32 <release>
    return 0;
800018e6:	84ca                	mv	s1,s2
800018e8:	bfe1                	j	800018c0 <allocproc+0x74>

800018ea <userinit>:
{
800018ea:	1141                	addi	sp,sp,-16
800018ec:	c606                	sw	ra,12(sp)
800018ee:	c422                	sw	s0,8(sp)
800018f0:	c226                	sw	s1,4(sp)
800018f2:	0800                	addi	s0,sp,16
  p = allocproc();
800018f4:	3fa1                	jal	8000184c <allocproc>
800018f6:	84aa                	mv	s1,a0
  initproc = p;
800018f8:	000b1797          	auipc	a5,0xb1
800018fc:	5aa7ac23          	sw	a0,1464(a5) # 800b2eb0 <initproc>
  uint64 sz = uvmalloc(p->pagetable, 0, PGSIZE, PTE_W | PTE_X | PTE_R | PTE_U);
80001900:	46f9                	li	a3,30
80001902:	6605                	lui	a2,0x1
80001904:	4581                	li	a1,0
80001906:	5548                	lw	a0,44(a0)
80001908:	f92ff0ef          	jal	8000109a <uvmalloc>
  if (sz == 0)
8000190c:	c135                	beqz	a0,80001970 <userinit+0x86>
  uint64 pa = walkaddr(p->pagetable, 0);
8000190e:	4581                	li	a1,0
80001910:	54c8                	lw	a0,44(s1)
80001912:	cecff0ef          	jal	80000dfe <walkaddr>
  if (pa == 0)
80001916:	c13d                	beqz	a0,8000197c <userinit+0x92>
  memmove((void *)pa, initcode_start, initcode_size);
80001918:	000b1617          	auipc	a2,0xb1
8000191c:	54062603          	lw	a2,1344(a2) # 800b2e58 <initcode_size>
80001920:	000b1597          	auipc	a1,0xb1
80001924:	54058593          	addi	a1,a1,1344 # 800b2e60 <initcode_start>
80001928:	a88ff0ef          	jal	80000bb0 <memmove>
  p->sz = PGSIZE;
8000192c:	6785                	lui	a5,0x1
8000192e:	d49c                	sw	a5,40(s1)
  p->trapframe->epc = 0;
80001930:	5898                	lw	a4,48(s1)
80001932:	00072623          	sw	zero,12(a4) # 100c <_entry-0x7fffeff4>
  p->trapframe->sp = PGSIZE;
80001936:	5898                	lw	a4,48(s1)
80001938:	cf1c                	sw	a5,24(a4)
  safestrcpy(p->name, "initcode", sizeof(p->name));
8000193a:	4641                	li	a2,16
8000193c:	0000a597          	auipc	a1,0xa
80001940:	8d458593          	addi	a1,a1,-1836 # 8000b210 <etext+0x210>
80001944:	0b048513          	addi	a0,s1,176
80001948:	b2eff0ef          	jal	80000c76 <safestrcpy>
  p->cwd = namei("/");
8000194c:	0000a517          	auipc	a0,0xa
80001950:	8d050513          	addi	a0,a0,-1840 # 8000b21c <etext+0x21c>
80001954:	4cb010ef          	jal	8000361e <namei>
80001958:	0aa4a623          	sw	a0,172(s1)
  p->state = RUNNABLE;
8000195c:	478d                	li	a5,3
8000195e:	c4dc                	sw	a5,12(s1)
  release(&p->lock);
80001960:	8526                	mv	a0,s1
80001962:	9d0ff0ef          	jal	80000b32 <release>
}
80001966:	40b2                	lw	ra,12(sp)
80001968:	4422                	lw	s0,8(sp)
8000196a:	4492                	lw	s1,4(sp)
8000196c:	0141                	addi	sp,sp,16
8000196e:	8082                	ret
    panic("userinit: uvmalloc");
80001970:	0000a517          	auipc	a0,0xa
80001974:	87850513          	addi	a0,a0,-1928 # 8000b1e8 <etext+0x1e8>
80001978:	e41fe0ef          	jal	800007b8 <panic>
    panic("userinit: walkaddr");
8000197c:	0000a517          	auipc	a0,0xa
80001980:	88050513          	addi	a0,a0,-1920 # 8000b1fc <etext+0x1fc>
80001984:	e35fe0ef          	jal	800007b8 <panic>

80001988 <growproc>:
{
80001988:	1141                	addi	sp,sp,-16
8000198a:	c606                	sw	ra,12(sp)
8000198c:	c422                	sw	s0,8(sp)
8000198e:	c226                	sw	s1,4(sp)
80001990:	c04a                	sw	s2,0(sp)
80001992:	0800                	addi	s0,sp,16
80001994:	84aa                	mv	s1,a0
  struct proc *p = myproc();
80001996:	396d                	jal	80001650 <myproc>
80001998:	892a                	mv	s2,a0
  sz = p->sz;
8000199a:	550c                	lw	a1,40(a0)
  if (n > 0) {
8000199c:	02905663          	blez	s1,800019c8 <growproc+0x40>
    if (sz + n > TRAPFRAME) {
800019a0:	00b48633          	add	a2,s1,a1
800019a4:	77f9                	lui	a5,0xffffe
800019a6:	02c7ea63          	bltu	a5,a2,800019da <growproc+0x52>
    if ((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
800019aa:	4691                	li	a3,4
800019ac:	5548                	lw	a0,44(a0)
800019ae:	eecff0ef          	jal	8000109a <uvmalloc>
800019b2:	85aa                	mv	a1,a0
800019b4:	c50d                	beqz	a0,800019de <growproc+0x56>
  p->sz = sz;
800019b6:	02b92423          	sw	a1,40(s2)
  return 0;
800019ba:	4501                	li	a0,0
}
800019bc:	40b2                	lw	ra,12(sp)
800019be:	4422                	lw	s0,8(sp)
800019c0:	4492                	lw	s1,4(sp)
800019c2:	4902                	lw	s2,0(sp)
800019c4:	0141                	addi	sp,sp,16
800019c6:	8082                	ret
  } else if (n < 0) {
800019c8:	fe04d7e3          	bgez	s1,800019b6 <growproc+0x2e>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
800019cc:	00b48633          	add	a2,s1,a1
800019d0:	5548                	lw	a0,44(a0)
800019d2:	f76ff0ef          	jal	80001148 <uvmdealloc>
800019d6:	85aa                	mv	a1,a0
800019d8:	bff9                	j	800019b6 <growproc+0x2e>
      return -1;
800019da:	557d                	li	a0,-1
800019dc:	b7c5                	j	800019bc <growproc+0x34>
      return -1;
800019de:	557d                	li	a0,-1
800019e0:	bff1                	j	800019bc <growproc+0x34>

800019e2 <kfork>:
{
800019e2:	1101                	addi	sp,sp,-32
800019e4:	ce06                	sw	ra,28(sp)
800019e6:	cc22                	sw	s0,24(sp)
800019e8:	c84a                	sw	s2,16(sp)
800019ea:	c256                	sw	s5,4(sp)
800019ec:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
800019ee:	318d                	jal	80001650 <myproc>
800019f0:	8aaa                	mv	s5,a0
  if ((np = allocproc()) == 0) {
800019f2:	3da9                	jal	8000184c <allocproc>
800019f4:	0e050763          	beqz	a0,80001ae2 <kfork+0x100>
800019f8:	c452                	sw	s4,8(sp)
800019fa:	8a2a                	mv	s4,a0
  if (uvmcopy(p->pagetable, np->pagetable, p->sz) < 0) {
800019fc:	028aa603          	lw	a2,40(s5) # fffff028 <end+0x7ff2eaac>
80001a00:	554c                	lw	a1,44(a0)
80001a02:	02caa503          	lw	a0,44(s5)
80001a06:	881ff0ef          	jal	80001286 <uvmcopy>
80001a0a:	04054863          	bltz	a0,80001a5a <kfork+0x78>
80001a0e:	ca26                	sw	s1,20(sp)
80001a10:	c64e                	sw	s3,12(sp)
  np->sz = p->sz;
80001a12:	028aa783          	lw	a5,40(s5)
80001a16:	02fa2423          	sw	a5,40(s4) # fffff028 <end+0x7ff2eaac>
  *(np->trapframe) = *(p->trapframe);
80001a1a:	030aa683          	lw	a3,48(s5)
80001a1e:	87b6                	mv	a5,a3
80001a20:	030a2703          	lw	a4,48(s4)
80001a24:	09068693          	addi	a3,a3,144
80001a28:	0007a803          	lw	a6,0(a5) # ffffe000 <end+0x7ff2da84>
80001a2c:	43c8                	lw	a0,4(a5)
80001a2e:	478c                	lw	a1,8(a5)
80001a30:	47d0                	lw	a2,12(a5)
80001a32:	01072023          	sw	a6,0(a4)
80001a36:	c348                	sw	a0,4(a4)
80001a38:	c70c                	sw	a1,8(a4)
80001a3a:	c750                	sw	a2,12(a4)
80001a3c:	07c1                	addi	a5,a5,16
80001a3e:	0741                	addi	a4,a4,16
80001a40:	fed794e3          	bne	a5,a3,80001a28 <kfork+0x46>
  np->trapframe->a0 = 0;
80001a44:	030a2783          	lw	a5,48(s4)
80001a48:	0207ac23          	sw	zero,56(a5)
  for (i = 0; i < NOFILE; i++)
80001a4c:	06ca8493          	addi	s1,s5,108
80001a50:	06ca0913          	addi	s2,s4,108
80001a54:	0aca8993          	addi	s3,s5,172
80001a58:	a829                	j	80001a72 <kfork+0x90>
    freeproc(np);
80001a5a:	8552                	mv	a0,s4
80001a5c:	334d                	jal	800017fe <freeproc>
    release(&np->lock);
80001a5e:	8552                	mv	a0,s4
80001a60:	8d2ff0ef          	jal	80000b32 <release>
    return -1;
80001a64:	597d                	li	s2,-1
80001a66:	4a22                	lw	s4,8(sp)
80001a68:	a0b5                	j	80001ad4 <kfork+0xf2>
  for (i = 0; i < NOFILE; i++)
80001a6a:	0491                	addi	s1,s1,4
80001a6c:	0911                	addi	s2,s2,4
80001a6e:	01348963          	beq	s1,s3,80001a80 <kfork+0x9e>
    if (p->ofile[i])
80001a72:	4088                	lw	a0,0(s1)
80001a74:	d97d                	beqz	a0,80001a6a <kfork+0x88>
      np->ofile[i] = filedup(p->ofile[i]);
80001a76:	130020ef          	jal	80003ba6 <filedup>
80001a7a:	00a92023          	sw	a0,0(s2)
80001a7e:	b7f5                	j	80001a6a <kfork+0x88>
  np->cwd = idup(p->cwd);
80001a80:	0acaa503          	lw	a0,172(s5)
80001a84:	3dc010ef          	jal	80002e60 <idup>
80001a88:	0aaa2623          	sw	a0,172(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
80001a8c:	4641                	li	a2,16
80001a8e:	0b0a8593          	addi	a1,s5,176
80001a92:	0b0a0513          	addi	a0,s4,176
80001a96:	9e0ff0ef          	jal	80000c76 <safestrcpy>
  pid = np->pid;
80001a9a:	01ca2903          	lw	s2,28(s4)
  release(&np->lock);
80001a9e:	8552                	mv	a0,s4
80001aa0:	892ff0ef          	jal	80000b32 <release>
  acquire(&wait_lock);
80001aa4:	000b9497          	auipc	s1,0xb9
80001aa8:	4e848493          	addi	s1,s1,1256 # 800baf8c <wait_lock>
80001aac:	8526                	mv	a0,s1
80001aae:	800ff0ef          	jal	80000aae <acquire>
  np->parent = p;
80001ab2:	035a2023          	sw	s5,32(s4)
  release(&wait_lock);
80001ab6:	8526                	mv	a0,s1
80001ab8:	87aff0ef          	jal	80000b32 <release>
  acquire(&np->lock);
80001abc:	8552                	mv	a0,s4
80001abe:	ff1fe0ef          	jal	80000aae <acquire>
  np->state = RUNNABLE;
80001ac2:	478d                	li	a5,3
80001ac4:	00fa2623          	sw	a5,12(s4)
  release(&np->lock);
80001ac8:	8552                	mv	a0,s4
80001aca:	868ff0ef          	jal	80000b32 <release>
  return pid;
80001ace:	44d2                	lw	s1,20(sp)
80001ad0:	49b2                	lw	s3,12(sp)
80001ad2:	4a22                	lw	s4,8(sp)
}
80001ad4:	854a                	mv	a0,s2
80001ad6:	40f2                	lw	ra,28(sp)
80001ad8:	4462                	lw	s0,24(sp)
80001ada:	4942                	lw	s2,16(sp)
80001adc:	4a92                	lw	s5,4(sp)
80001ade:	6105                	addi	sp,sp,32
80001ae0:	8082                	ret
    return -1;
80001ae2:	597d                	li	s2,-1
80001ae4:	bfc5                	j	80001ad4 <kfork+0xf2>

80001ae6 <scheduler>:
{
80001ae6:	7179                	addi	sp,sp,-48
80001ae8:	d606                	sw	ra,44(sp)
80001aea:	d422                	sw	s0,40(sp)
80001aec:	d226                	sw	s1,36(sp)
80001aee:	d04a                	sw	s2,32(sp)
80001af0:	ce4e                	sw	s3,28(sp)
80001af2:	cc52                	sw	s4,24(sp)
80001af4:	ca56                	sw	s5,20(sp)
80001af6:	c85a                	sw	s6,16(sp)
80001af8:	c65e                	sw	s7,12(sp)
80001afa:	c462                	sw	s8,8(sp)
80001afc:	1800                	addi	s0,sp,48
80001afe:	8712                	mv	a4,tp
  c->proc = 0;
80001b00:	00471793          	slli	a5,a4,0x4
80001b04:	00e78633          	add	a2,a5,a4
80001b08:	060a                	slli	a2,a2,0x2
80001b0a:	000b9697          	auipc	a3,0xb9
80001b0e:	47668693          	addi	a3,a3,1142 # 800baf80 <pid_lock>
80001b12:	96b2                	add	a3,a3,a2
80001b14:	0006ac23          	sw	zero,24(a3)
        swtch(&c->context, &p->context);
80001b18:	000b9797          	auipc	a5,0xb9
80001b1c:	48478793          	addi	a5,a5,1156 # 800baf9c <cpus+0x4>
80001b20:	00f60bb3          	add	s7,a2,a5
    int found = 0;
80001b24:	4c01                	li	s8,0
        c->proc = p;
80001b26:	8a36                	mv	s4,a3
    for (p = proc; p < &proc[NPROC]; p++) {
80001b28:	000bc997          	auipc	s3,0xbc
80001b2c:	69098993          	addi	s3,s3,1680 # 800be1b8 <tickslock>
80001b30:	a835                	j	80001b6c <scheduler+0x86>
      release(&p->lock);
80001b32:	8526                	mv	a0,s1
80001b34:	ffffe0ef          	jal	80000b32 <release>
    for (p = proc; p < &proc[NPROC]; p++) {
80001b38:	0c048493          	addi	s1,s1,192
80001b3c:	03348463          	beq	s1,s3,80001b64 <scheduler+0x7e>
      acquire(&p->lock);
80001b40:	8526                	mv	a0,s1
80001b42:	f6dfe0ef          	jal	80000aae <acquire>
      if (p->state == RUNNABLE) {
80001b46:	44dc                	lw	a5,12(s1)
80001b48:	ff2795e3          	bne	a5,s2,80001b32 <scheduler+0x4c>
        p->state = RUNNING;
80001b4c:	0164a623          	sw	s6,12(s1)
        c->proc = p;
80001b50:	009a2c23          	sw	s1,24(s4)
        swtch(&c->context, &p->context);
80001b54:	03448593          	addi	a1,s1,52
80001b58:	855e                	mv	a0,s7
80001b5a:	2b79                	jal	800020f8 <swtch>
        c->proc = 0;
80001b5c:	000a2c23          	sw	zero,24(s4)
        found = 1;
80001b60:	4a85                	li	s5,1
80001b62:	bfc1                	j	80001b32 <scheduler+0x4c>
    if (found == 0) {
80001b64:	000a9463          	bnez	s5,80001b6c <scheduler+0x86>
      asm volatile("wfi");
80001b68:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r"(x));
80001b6c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
80001b70:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r"(x));
80001b74:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sstatus" : "=r"(x));
80001b78:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
80001b7c:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r"(x));
80001b7e:	10079073          	csrw	sstatus,a5
    int found = 0;
80001b82:	8ae2                	mv	s5,s8
    for (p = proc; p < &proc[NPROC]; p++) {
80001b84:	000b9497          	auipc	s1,0xb9
80001b88:	63448493          	addi	s1,s1,1588 # 800bb1b8 <proc>
      if (p->state == RUNNABLE) {
80001b8c:	490d                	li	s2,3
        p->state = RUNNING;
80001b8e:	4b11                	li	s6,4
80001b90:	bf45                	j	80001b40 <scheduler+0x5a>

80001b92 <sched>:
{
80001b92:	1101                	addi	sp,sp,-32
80001b94:	ce06                	sw	ra,28(sp)
80001b96:	cc22                	sw	s0,24(sp)
80001b98:	ca26                	sw	s1,20(sp)
80001b9a:	c84a                	sw	s2,16(sp)
80001b9c:	c64e                	sw	s3,12(sp)
80001b9e:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
80001ba0:	3c45                	jal	80001650 <myproc>
80001ba2:	84aa                	mv	s1,a0
  if (!holding(&p->lock))
80001ba4:	ea1fe0ef          	jal	80000a44 <holding>
80001ba8:	cd3d                	beqz	a0,80001c26 <sched+0x94>
  asm volatile("mv %0, tp" : "=r"(x));
80001baa:	8712                	mv	a4,tp
  if (mycpu()->noff != 1)
80001bac:	00471793          	slli	a5,a4,0x4
80001bb0:	97ba                	add	a5,a5,a4
80001bb2:	078a                	slli	a5,a5,0x2
80001bb4:	000b9717          	auipc	a4,0xb9
80001bb8:	3cc70713          	addi	a4,a4,972 # 800baf80 <pid_lock>
80001bbc:	97ba                	add	a5,a5,a4
80001bbe:	4bf8                	lw	a4,84(a5)
80001bc0:	4785                	li	a5,1
80001bc2:	06f71863          	bne	a4,a5,80001c32 <sched+0xa0>
  if (p->state == RUNNING)
80001bc6:	44d8                	lw	a4,12(s1)
80001bc8:	4791                	li	a5,4
80001bca:	06f70a63          	beq	a4,a5,80001c3e <sched+0xac>
  asm volatile("csrr %0, sstatus" : "=r"(x));
80001bce:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
80001bd2:	8b89                	andi	a5,a5,2
  if (intr_get())
80001bd4:	ebbd                	bnez	a5,80001c4a <sched+0xb8>
  asm volatile("mv %0, tp" : "=r"(x));
80001bd6:	8712                	mv	a4,tp
  intena = mycpu()->intena;
80001bd8:	000b9917          	auipc	s2,0xb9
80001bdc:	3a890913          	addi	s2,s2,936 # 800baf80 <pid_lock>
80001be0:	00471793          	slli	a5,a4,0x4
80001be4:	97ba                	add	a5,a5,a4
80001be6:	078a                	slli	a5,a5,0x2
80001be8:	97ca                	add	a5,a5,s2
80001bea:	0587a983          	lw	s3,88(a5)
80001bee:	8712                	mv	a4,tp
  swtch(&p->context, &mycpu()->context);
80001bf0:	00471793          	slli	a5,a4,0x4
80001bf4:	97ba                	add	a5,a5,a4
80001bf6:	078a                	slli	a5,a5,0x2
80001bf8:	000b9597          	auipc	a1,0xb9
80001bfc:	3a458593          	addi	a1,a1,932 # 800baf9c <cpus+0x4>
80001c00:	95be                	add	a1,a1,a5
80001c02:	03448513          	addi	a0,s1,52
80001c06:	29cd                	jal	800020f8 <swtch>
80001c08:	8712                	mv	a4,tp
  mycpu()->intena = intena;
80001c0a:	00471793          	slli	a5,a4,0x4
80001c0e:	97ba                	add	a5,a5,a4
80001c10:	078a                	slli	a5,a5,0x2
80001c12:	993e                	add	s2,s2,a5
80001c14:	05392c23          	sw	s3,88(s2)
}
80001c18:	40f2                	lw	ra,28(sp)
80001c1a:	4462                	lw	s0,24(sp)
80001c1c:	44d2                	lw	s1,20(sp)
80001c1e:	4942                	lw	s2,16(sp)
80001c20:	49b2                	lw	s3,12(sp)
80001c22:	6105                	addi	sp,sp,32
80001c24:	8082                	ret
    panic("sched p->lock");
80001c26:	00009517          	auipc	a0,0x9
80001c2a:	5fa50513          	addi	a0,a0,1530 # 8000b220 <etext+0x220>
80001c2e:	b8bfe0ef          	jal	800007b8 <panic>
    panic("sched locks");
80001c32:	00009517          	auipc	a0,0x9
80001c36:	5fe50513          	addi	a0,a0,1534 # 8000b230 <etext+0x230>
80001c3a:	b7ffe0ef          	jal	800007b8 <panic>
    panic("sched RUNNING");
80001c3e:	00009517          	auipc	a0,0x9
80001c42:	5fe50513          	addi	a0,a0,1534 # 8000b23c <etext+0x23c>
80001c46:	b73fe0ef          	jal	800007b8 <panic>
    panic("sched interruptible");
80001c4a:	00009517          	auipc	a0,0x9
80001c4e:	60250513          	addi	a0,a0,1538 # 8000b24c <etext+0x24c>
80001c52:	b67fe0ef          	jal	800007b8 <panic>

80001c56 <yield>:
{
80001c56:	1141                	addi	sp,sp,-16
80001c58:	c606                	sw	ra,12(sp)
80001c5a:	c422                	sw	s0,8(sp)
80001c5c:	c226                	sw	s1,4(sp)
80001c5e:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
80001c60:	3ac5                	jal	80001650 <myproc>
80001c62:	84aa                	mv	s1,a0
  acquire(&p->lock);
80001c64:	e4bfe0ef          	jal	80000aae <acquire>
  p->state = RUNNABLE;
80001c68:	478d                	li	a5,3
80001c6a:	c4dc                	sw	a5,12(s1)
  sched();
80001c6c:	371d                	jal	80001b92 <sched>
  release(&p->lock);
80001c6e:	8526                	mv	a0,s1
80001c70:	ec3fe0ef          	jal	80000b32 <release>
}
80001c74:	40b2                	lw	ra,12(sp)
80001c76:	4422                	lw	s0,8(sp)
80001c78:	4492                	lw	s1,4(sp)
80001c7a:	0141                	addi	sp,sp,16
80001c7c:	8082                	ret

80001c7e <sleep>:

// Sleep on channel chan, releasing condition lock lk.
// Re-acquires lk when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80001c7e:	1101                	addi	sp,sp,-32
80001c80:	ce06                	sw	ra,28(sp)
80001c82:	cc22                	sw	s0,24(sp)
80001c84:	ca26                	sw	s1,20(sp)
80001c86:	c84a                	sw	s2,16(sp)
80001c88:	c64e                	sw	s3,12(sp)
80001c8a:	1000                	addi	s0,sp,32
80001c8c:	89aa                	mv	s3,a0
80001c8e:	892e                	mv	s2,a1
  struct proc *p = myproc();
80001c90:	32c1                	jal	80001650 <myproc>
80001c92:	84aa                	mv	s1,a0
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock); //DOC: sleeplock1
80001c94:	e1bfe0ef          	jal	80000aae <acquire>
  release(lk);
80001c98:	854a                	mv	a0,s2
80001c9a:	e99fe0ef          	jal	80000b32 <release>

  // Go to sleep.
  p->chan = chan;
80001c9e:	0134a823          	sw	s3,16(s1)
  p->state = SLEEPING;
80001ca2:	4789                	li	a5,2
80001ca4:	c4dc                	sw	a5,12(s1)

  sched();
80001ca6:	35f5                	jal	80001b92 <sched>

  // Tidy up.
  p->chan = 0;
80001ca8:	0004a823          	sw	zero,16(s1)

  // Reacquire original lock.
  release(&p->lock);
80001cac:	8526                	mv	a0,s1
80001cae:	e85fe0ef          	jal	80000b32 <release>
  acquire(lk);
80001cb2:	854a                	mv	a0,s2
80001cb4:	dfbfe0ef          	jal	80000aae <acquire>
}
80001cb8:	40f2                	lw	ra,28(sp)
80001cba:	4462                	lw	s0,24(sp)
80001cbc:	44d2                	lw	s1,20(sp)
80001cbe:	4942                	lw	s2,16(sp)
80001cc0:	49b2                	lw	s3,12(sp)
80001cc2:	6105                	addi	sp,sp,32
80001cc4:	8082                	ret

80001cc6 <wakeup>:

// Wake up all processes sleeping on channel chan.
// Caller should hold the condition lock.
void
wakeup(void *chan)
{
80001cc6:	1101                	addi	sp,sp,-32
80001cc8:	ce06                	sw	ra,28(sp)
80001cca:	cc22                	sw	s0,24(sp)
80001ccc:	ca26                	sw	s1,20(sp)
80001cce:	c84a                	sw	s2,16(sp)
80001cd0:	c64e                	sw	s3,12(sp)
80001cd2:	c452                	sw	s4,8(sp)
80001cd4:	c256                	sw	s5,4(sp)
80001cd6:	1000                	addi	s0,sp,32
80001cd8:	8a2a                	mv	s4,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
80001cda:	000b9497          	auipc	s1,0xb9
80001cde:	4de48493          	addi	s1,s1,1246 # 800bb1b8 <proc>
    if (p != myproc()) {
      acquire(&p->lock);
      if (p->state == SLEEPING && p->chan == chan) {
80001ce2:	4989                	li	s3,2
        p->state = RUNNABLE;
80001ce4:	4a8d                	li	s5,3
  for (p = proc; p < &proc[NPROC]; p++) {
80001ce6:	000bc917          	auipc	s2,0xbc
80001cea:	4d290913          	addi	s2,s2,1234 # 800be1b8 <tickslock>
80001cee:	a801                	j	80001cfe <wakeup+0x38>
      }
      release(&p->lock);
80001cf0:	8526                	mv	a0,s1
80001cf2:	e41fe0ef          	jal	80000b32 <release>
  for (p = proc; p < &proc[NPROC]; p++) {
80001cf6:	0c048493          	addi	s1,s1,192
80001cfa:	03248263          	beq	s1,s2,80001d1e <wakeup+0x58>
    if (p != myproc()) {
80001cfe:	953ff0ef          	jal	80001650 <myproc>
80001d02:	fea48ae3          	beq	s1,a0,80001cf6 <wakeup+0x30>
      acquire(&p->lock);
80001d06:	8526                	mv	a0,s1
80001d08:	da7fe0ef          	jal	80000aae <acquire>
      if (p->state == SLEEPING && p->chan == chan) {
80001d0c:	44dc                	lw	a5,12(s1)
80001d0e:	ff3791e3          	bne	a5,s3,80001cf0 <wakeup+0x2a>
80001d12:	489c                	lw	a5,16(s1)
80001d14:	fd479ee3          	bne	a5,s4,80001cf0 <wakeup+0x2a>
        p->state = RUNNABLE;
80001d18:	0154a623          	sw	s5,12(s1)
80001d1c:	bfd1                	j	80001cf0 <wakeup+0x2a>
    }
  }
}
80001d1e:	40f2                	lw	ra,28(sp)
80001d20:	4462                	lw	s0,24(sp)
80001d22:	44d2                	lw	s1,20(sp)
80001d24:	4942                	lw	s2,16(sp)
80001d26:	49b2                	lw	s3,12(sp)
80001d28:	4a22                	lw	s4,8(sp)
80001d2a:	4a92                	lw	s5,4(sp)
80001d2c:	6105                	addi	sp,sp,32
80001d2e:	8082                	ret

80001d30 <reparent>:
{
80001d30:	1101                	addi	sp,sp,-32
80001d32:	ce06                	sw	ra,28(sp)
80001d34:	cc22                	sw	s0,24(sp)
80001d36:	ca26                	sw	s1,20(sp)
80001d38:	c84a                	sw	s2,16(sp)
80001d3a:	c64e                	sw	s3,12(sp)
80001d3c:	c452                	sw	s4,8(sp)
80001d3e:	1000                	addi	s0,sp,32
80001d40:	892a                	mv	s2,a0
  for (pp = proc; pp < &proc[NPROC]; pp++) {
80001d42:	000b9497          	auipc	s1,0xb9
80001d46:	47648493          	addi	s1,s1,1142 # 800bb1b8 <proc>
      pp->parent = initproc;
80001d4a:	000b1a17          	auipc	s4,0xb1
80001d4e:	166a0a13          	addi	s4,s4,358 # 800b2eb0 <initproc>
  for (pp = proc; pp < &proc[NPROC]; pp++) {
80001d52:	000bc997          	auipc	s3,0xbc
80001d56:	46698993          	addi	s3,s3,1126 # 800be1b8 <tickslock>
80001d5a:	a029                	j	80001d64 <reparent+0x34>
80001d5c:	0c048493          	addi	s1,s1,192
80001d60:	01348a63          	beq	s1,s3,80001d74 <reparent+0x44>
    if (pp->parent == p) {
80001d64:	509c                	lw	a5,32(s1)
80001d66:	ff279be3          	bne	a5,s2,80001d5c <reparent+0x2c>
      pp->parent = initproc;
80001d6a:	000a2503          	lw	a0,0(s4)
80001d6e:	d088                	sw	a0,32(s1)
      wakeup(initproc);
80001d70:	3f99                	jal	80001cc6 <wakeup>
80001d72:	b7ed                	j	80001d5c <reparent+0x2c>
}
80001d74:	40f2                	lw	ra,28(sp)
80001d76:	4462                	lw	s0,24(sp)
80001d78:	44d2                	lw	s1,20(sp)
80001d7a:	4942                	lw	s2,16(sp)
80001d7c:	49b2                	lw	s3,12(sp)
80001d7e:	4a22                	lw	s4,8(sp)
80001d80:	6105                	addi	sp,sp,32
80001d82:	8082                	ret

80001d84 <kexit>:
{
80001d84:	1101                	addi	sp,sp,-32
80001d86:	ce06                	sw	ra,28(sp)
80001d88:	cc22                	sw	s0,24(sp)
80001d8a:	ca26                	sw	s1,20(sp)
80001d8c:	c84a                	sw	s2,16(sp)
80001d8e:	c64e                	sw	s3,12(sp)
80001d90:	c452                	sw	s4,8(sp)
80001d92:	1000                	addi	s0,sp,32
80001d94:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
80001d96:	8bbff0ef          	jal	80001650 <myproc>
80001d9a:	89aa                	mv	s3,a0
  if (p == initproc)
80001d9c:	000b1797          	auipc	a5,0xb1
80001da0:	1147a783          	lw	a5,276(a5) # 800b2eb0 <initproc>
80001da4:	06c50493          	addi	s1,a0,108
80001da8:	0ac50913          	addi	s2,a0,172
80001dac:	00a79f63          	bne	a5,a0,80001dca <kexit+0x46>
    panic("init exiting");
80001db0:	00009517          	auipc	a0,0x9
80001db4:	4b050513          	addi	a0,a0,1200 # 8000b260 <etext+0x260>
80001db8:	a01fe0ef          	jal	800007b8 <panic>
      fileclose(f);
80001dbc:	631010ef          	jal	80003bec <fileclose>
      p->ofile[fd] = 0;
80001dc0:	0004a023          	sw	zero,0(s1)
  for (int fd = 0; fd < NOFILE; fd++) {
80001dc4:	0491                	addi	s1,s1,4
80001dc6:	01248563          	beq	s1,s2,80001dd0 <kexit+0x4c>
    if (p->ofile[fd]) {
80001dca:	4088                	lw	a0,0(s1)
80001dcc:	f965                	bnez	a0,80001dbc <kexit+0x38>
80001dce:	bfdd                	j	80001dc4 <kexit+0x40>
  begin_op();
80001dd0:	219010ef          	jal	800037e8 <begin_op>
  iput(p->cwd);
80001dd4:	0ac9a503          	lw	a0,172(s3)
80001dd8:	236010ef          	jal	8000300e <iput>
  end_op();
80001ddc:	275010ef          	jal	80003850 <end_op>
  p->cwd = 0;
80001de0:	0a09a623          	sw	zero,172(s3)
  acquire(&wait_lock);
80001de4:	000b9497          	auipc	s1,0xb9
80001de8:	1a848493          	addi	s1,s1,424 # 800baf8c <wait_lock>
80001dec:	8526                	mv	a0,s1
80001dee:	cc1fe0ef          	jal	80000aae <acquire>
  reparent(p);
80001df2:	854e                	mv	a0,s3
80001df4:	3f35                	jal	80001d30 <reparent>
  wakeup(p->parent);
80001df6:	0209a503          	lw	a0,32(s3)
80001dfa:	35f1                	jal	80001cc6 <wakeup>
  acquire(&p->lock);
80001dfc:	854e                	mv	a0,s3
80001dfe:	cb1fe0ef          	jal	80000aae <acquire>
  p->xstate = status;
80001e02:	0149ac23          	sw	s4,24(s3)
  p->state = ZOMBIE;
80001e06:	4795                	li	a5,5
80001e08:	00f9a623          	sw	a5,12(s3)
  release(&wait_lock);
80001e0c:	8526                	mv	a0,s1
80001e0e:	d25fe0ef          	jal	80000b32 <release>
  sched();
80001e12:	3341                	jal	80001b92 <sched>
  panic("zombie exit");
80001e14:	00009517          	auipc	a0,0x9
80001e18:	45c50513          	addi	a0,a0,1116 # 8000b270 <etext+0x270>
80001e1c:	99dfe0ef          	jal	800007b8 <panic>

80001e20 <kkill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kkill(int pid)
{
80001e20:	1101                	addi	sp,sp,-32
80001e22:	ce06                	sw	ra,28(sp)
80001e24:	cc22                	sw	s0,24(sp)
80001e26:	ca26                	sw	s1,20(sp)
80001e28:	c84a                	sw	s2,16(sp)
80001e2a:	c64e                	sw	s3,12(sp)
80001e2c:	1000                	addi	s0,sp,32
80001e2e:	892a                	mv	s2,a0
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
80001e30:	000b9497          	auipc	s1,0xb9
80001e34:	38848493          	addi	s1,s1,904 # 800bb1b8 <proc>
80001e38:	000bc997          	auipc	s3,0xbc
80001e3c:	38098993          	addi	s3,s3,896 # 800be1b8 <tickslock>
    acquire(&p->lock);
80001e40:	8526                	mv	a0,s1
80001e42:	c6dfe0ef          	jal	80000aae <acquire>
    if (p->pid == pid) {
80001e46:	4cdc                	lw	a5,28(s1)
80001e48:	01278b63          	beq	a5,s2,80001e5e <kkill+0x3e>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
80001e4c:	8526                	mv	a0,s1
80001e4e:	ce5fe0ef          	jal	80000b32 <release>
  for (p = proc; p < &proc[NPROC]; p++) {
80001e52:	0c048493          	addi	s1,s1,192
80001e56:	ff3495e3          	bne	s1,s3,80001e40 <kkill+0x20>
  }
  return -1;
80001e5a:	557d                	li	a0,-1
80001e5c:	a819                	j	80001e72 <kkill+0x52>
      p->killed = 1;
80001e5e:	4785                	li	a5,1
80001e60:	c8dc                	sw	a5,20(s1)
      if (p->state == SLEEPING) {
80001e62:	44d8                	lw	a4,12(s1)
80001e64:	4789                	li	a5,2
80001e66:	00f70d63          	beq	a4,a5,80001e80 <kkill+0x60>
      release(&p->lock);
80001e6a:	8526                	mv	a0,s1
80001e6c:	cc7fe0ef          	jal	80000b32 <release>
      return 0;
80001e70:	4501                	li	a0,0
}
80001e72:	40f2                	lw	ra,28(sp)
80001e74:	4462                	lw	s0,24(sp)
80001e76:	44d2                	lw	s1,20(sp)
80001e78:	4942                	lw	s2,16(sp)
80001e7a:	49b2                	lw	s3,12(sp)
80001e7c:	6105                	addi	sp,sp,32
80001e7e:	8082                	ret
        p->state = RUNNABLE;
80001e80:	478d                	li	a5,3
80001e82:	c4dc                	sw	a5,12(s1)
80001e84:	b7dd                	j	80001e6a <kkill+0x4a>

80001e86 <setkilled>:

void
setkilled(struct proc *p)
{
80001e86:	1141                	addi	sp,sp,-16
80001e88:	c606                	sw	ra,12(sp)
80001e8a:	c422                	sw	s0,8(sp)
80001e8c:	c226                	sw	s1,4(sp)
80001e8e:	0800                	addi	s0,sp,16
80001e90:	84aa                	mv	s1,a0
  acquire(&p->lock);
80001e92:	c1dfe0ef          	jal	80000aae <acquire>
  p->killed = 1;
80001e96:	4785                	li	a5,1
80001e98:	c8dc                	sw	a5,20(s1)
  release(&p->lock);
80001e9a:	8526                	mv	a0,s1
80001e9c:	c97fe0ef          	jal	80000b32 <release>
}
80001ea0:	40b2                	lw	ra,12(sp)
80001ea2:	4422                	lw	s0,8(sp)
80001ea4:	4492                	lw	s1,4(sp)
80001ea6:	0141                	addi	sp,sp,16
80001ea8:	8082                	ret

80001eaa <killed>:

int
killed(struct proc *p)
{
80001eaa:	1141                	addi	sp,sp,-16
80001eac:	c606                	sw	ra,12(sp)
80001eae:	c422                	sw	s0,8(sp)
80001eb0:	c226                	sw	s1,4(sp)
80001eb2:	c04a                	sw	s2,0(sp)
80001eb4:	0800                	addi	s0,sp,16
80001eb6:	84aa                	mv	s1,a0
  int k;

  acquire(&p->lock);
80001eb8:	bf7fe0ef          	jal	80000aae <acquire>
  k = p->killed;
80001ebc:	0144a903          	lw	s2,20(s1)
  release(&p->lock);
80001ec0:	8526                	mv	a0,s1
80001ec2:	c71fe0ef          	jal	80000b32 <release>
  return k;
}
80001ec6:	854a                	mv	a0,s2
80001ec8:	40b2                	lw	ra,12(sp)
80001eca:	4422                	lw	s0,8(sp)
80001ecc:	4492                	lw	s1,4(sp)
80001ece:	4902                	lw	s2,0(sp)
80001ed0:	0141                	addi	sp,sp,16
80001ed2:	8082                	ret

80001ed4 <kwait>:
{
80001ed4:	7179                	addi	sp,sp,-48
80001ed6:	d606                	sw	ra,44(sp)
80001ed8:	d422                	sw	s0,40(sp)
80001eda:	d226                	sw	s1,36(sp)
80001edc:	d04a                	sw	s2,32(sp)
80001ede:	ce4e                	sw	s3,28(sp)
80001ee0:	cc52                	sw	s4,24(sp)
80001ee2:	ca56                	sw	s5,20(sp)
80001ee4:	c85a                	sw	s6,16(sp)
80001ee6:	c65e                	sw	s7,12(sp)
80001ee8:	c462                	sw	s8,8(sp)
80001eea:	1800                	addi	s0,sp,48
80001eec:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
80001eee:	f62ff0ef          	jal	80001650 <myproc>
80001ef2:	892a                	mv	s2,a0
  acquire(&wait_lock);
80001ef4:	000b9517          	auipc	a0,0xb9
80001ef8:	09850513          	addi	a0,a0,152 # 800baf8c <wait_lock>
80001efc:	bb3fe0ef          	jal	80000aae <acquire>
    havekids = 0;
80001f00:	4b81                	li	s7,0
        if (pp->state == ZOMBIE) {
80001f02:	4a15                	li	s4,5
        havekids = 1;
80001f04:	4a85                	li	s5,1
    for (pp = proc; pp < &proc[NPROC]; pp++) {
80001f06:	000bc997          	auipc	s3,0xbc
80001f0a:	2b298993          	addi	s3,s3,690 # 800be1b8 <tickslock>
    sleep(p, &wait_lock); //DOC: wait-sleep
80001f0e:	000b9c17          	auipc	s8,0xb9
80001f12:	07ec0c13          	addi	s8,s8,126 # 800baf8c <wait_lock>
80001f16:	a861                	j	80001fae <kwait+0xda>
          pid = pp->pid;
80001f18:	01c4a983          	lw	s3,28(s1)
          if (addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
80001f1c:	000b0c63          	beqz	s6,80001f34 <kwait+0x60>
80001f20:	4691                	li	a3,4
80001f22:	01848613          	addi	a2,s1,24
80001f26:	85da                	mv	a1,s6
80001f28:	02c92503          	lw	a0,44(s2)
80001f2c:	c2eff0ef          	jal	8000135a <copyout>
80001f30:	02054b63          	bltz	a0,80001f66 <kwait+0x92>
          freeproc(pp);
80001f34:	8526                	mv	a0,s1
80001f36:	8c9ff0ef          	jal	800017fe <freeproc>
          release(&pp->lock);
80001f3a:	8526                	mv	a0,s1
80001f3c:	bf7fe0ef          	jal	80000b32 <release>
          release(&wait_lock);
80001f40:	000b9517          	auipc	a0,0xb9
80001f44:	04c50513          	addi	a0,a0,76 # 800baf8c <wait_lock>
80001f48:	bebfe0ef          	jal	80000b32 <release>
}
80001f4c:	854e                	mv	a0,s3
80001f4e:	50b2                	lw	ra,44(sp)
80001f50:	5422                	lw	s0,40(sp)
80001f52:	5492                	lw	s1,36(sp)
80001f54:	5902                	lw	s2,32(sp)
80001f56:	49f2                	lw	s3,28(sp)
80001f58:	4a62                	lw	s4,24(sp)
80001f5a:	4ad2                	lw	s5,20(sp)
80001f5c:	4b42                	lw	s6,16(sp)
80001f5e:	4bb2                	lw	s7,12(sp)
80001f60:	4c22                	lw	s8,8(sp)
80001f62:	6145                	addi	sp,sp,48
80001f64:	8082                	ret
            release(&pp->lock);
80001f66:	8526                	mv	a0,s1
80001f68:	bcbfe0ef          	jal	80000b32 <release>
            release(&wait_lock);
80001f6c:	000b9517          	auipc	a0,0xb9
80001f70:	02050513          	addi	a0,a0,32 # 800baf8c <wait_lock>
80001f74:	bbffe0ef          	jal	80000b32 <release>
            return -1;
80001f78:	59fd                	li	s3,-1
80001f7a:	bfc9                	j	80001f4c <kwait+0x78>
    for (pp = proc; pp < &proc[NPROC]; pp++) {
80001f7c:	0c048493          	addi	s1,s1,192
80001f80:	03348063          	beq	s1,s3,80001fa0 <kwait+0xcc>
      if (pp->parent == p) {
80001f84:	509c                	lw	a5,32(s1)
80001f86:	ff279be3          	bne	a5,s2,80001f7c <kwait+0xa8>
        acquire(&pp->lock);
80001f8a:	8526                	mv	a0,s1
80001f8c:	b23fe0ef          	jal	80000aae <acquire>
        if (pp->state == ZOMBIE) {
80001f90:	44dc                	lw	a5,12(s1)
80001f92:	f94783e3          	beq	a5,s4,80001f18 <kwait+0x44>
        release(&pp->lock);
80001f96:	8526                	mv	a0,s1
80001f98:	b9bfe0ef          	jal	80000b32 <release>
        havekids = 1;
80001f9c:	8756                	mv	a4,s5
80001f9e:	bff9                	j	80001f7c <kwait+0xa8>
    if (!havekids || killed(p)) {
80001fa0:	cf09                	beqz	a4,80001fba <kwait+0xe6>
80001fa2:	854a                	mv	a0,s2
80001fa4:	3719                	jal	80001eaa <killed>
80001fa6:	e911                	bnez	a0,80001fba <kwait+0xe6>
    sleep(p, &wait_lock); //DOC: wait-sleep
80001fa8:	85e2                	mv	a1,s8
80001faa:	854a                	mv	a0,s2
80001fac:	39c9                	jal	80001c7e <sleep>
    havekids = 0;
80001fae:	875e                	mv	a4,s7
    for (pp = proc; pp < &proc[NPROC]; pp++) {
80001fb0:	000b9497          	auipc	s1,0xb9
80001fb4:	20848493          	addi	s1,s1,520 # 800bb1b8 <proc>
80001fb8:	b7f1                	j	80001f84 <kwait+0xb0>
      release(&wait_lock);
80001fba:	000b9517          	auipc	a0,0xb9
80001fbe:	fd250513          	addi	a0,a0,-46 # 800baf8c <wait_lock>
80001fc2:	b71fe0ef          	jal	80000b32 <release>
      return -1;
80001fc6:	59fd                	li	s3,-1
80001fc8:	b751                	j	80001f4c <kwait+0x78>

80001fca <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
80001fca:	1101                	addi	sp,sp,-32
80001fcc:	ce06                	sw	ra,28(sp)
80001fce:	cc22                	sw	s0,24(sp)
80001fd0:	ca26                	sw	s1,20(sp)
80001fd2:	c84a                	sw	s2,16(sp)
80001fd4:	c64e                	sw	s3,12(sp)
80001fd6:	c452                	sw	s4,8(sp)
80001fd8:	1000                	addi	s0,sp,32
80001fda:	84aa                	mv	s1,a0
80001fdc:	892e                	mv	s2,a1
80001fde:	89b2                	mv	s3,a2
80001fe0:	8a36                	mv	s4,a3
  struct proc *p = myproc();
80001fe2:	e6eff0ef          	jal	80001650 <myproc>
  if (user_dst) {
80001fe6:	cc99                	beqz	s1,80002004 <either_copyout+0x3a>
    return copyout(p->pagetable, dst, src, len);
80001fe8:	86d2                	mv	a3,s4
80001fea:	864e                	mv	a2,s3
80001fec:	85ca                	mv	a1,s2
80001fee:	5548                	lw	a0,44(a0)
80001ff0:	b6aff0ef          	jal	8000135a <copyout>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
80001ff4:	40f2                	lw	ra,28(sp)
80001ff6:	4462                	lw	s0,24(sp)
80001ff8:	44d2                	lw	s1,20(sp)
80001ffa:	4942                	lw	s2,16(sp)
80001ffc:	49b2                	lw	s3,12(sp)
80001ffe:	4a22                	lw	s4,8(sp)
80002000:	6105                	addi	sp,sp,32
80002002:	8082                	ret
    memmove((char *)dst, src, len);
80002004:	8652                	mv	a2,s4
80002006:	85ce                	mv	a1,s3
80002008:	854a                	mv	a0,s2
8000200a:	ba7fe0ef          	jal	80000bb0 <memmove>
    return 0;
8000200e:	8526                	mv	a0,s1
80002010:	b7d5                	j	80001ff4 <either_copyout+0x2a>

80002012 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
80002012:	1101                	addi	sp,sp,-32
80002014:	ce06                	sw	ra,28(sp)
80002016:	cc22                	sw	s0,24(sp)
80002018:	ca26                	sw	s1,20(sp)
8000201a:	c84a                	sw	s2,16(sp)
8000201c:	c64e                	sw	s3,12(sp)
8000201e:	c452                	sw	s4,8(sp)
80002020:	1000                	addi	s0,sp,32
80002022:	892a                	mv	s2,a0
80002024:	84ae                	mv	s1,a1
80002026:	89b2                	mv	s3,a2
80002028:	8a36                	mv	s4,a3
  struct proc *p = myproc();
8000202a:	e26ff0ef          	jal	80001650 <myproc>
  if (user_src) {
8000202e:	cc99                	beqz	s1,8000204c <either_copyin+0x3a>
    return copyin(p->pagetable, dst, src, len);
80002030:	86d2                	mv	a3,s4
80002032:	864e                	mv	a2,s3
80002034:	85ca                	mv	a1,s2
80002036:	5548                	lw	a0,44(a0)
80002038:	ba2ff0ef          	jal	800013da <copyin>
  } else {
    memmove(dst, (char *)src, len);
    return 0;
  }
}
8000203c:	40f2                	lw	ra,28(sp)
8000203e:	4462                	lw	s0,24(sp)
80002040:	44d2                	lw	s1,20(sp)
80002042:	4942                	lw	s2,16(sp)
80002044:	49b2                	lw	s3,12(sp)
80002046:	4a22                	lw	s4,8(sp)
80002048:	6105                	addi	sp,sp,32
8000204a:	8082                	ret
    memmove(dst, (char *)src, len);
8000204c:	8652                	mv	a2,s4
8000204e:	85ce                	mv	a1,s3
80002050:	854a                	mv	a0,s2
80002052:	b5ffe0ef          	jal	80000bb0 <memmove>
    return 0;
80002056:	8526                	mv	a0,s1
80002058:	b7d5                	j	8000203c <either_copyin+0x2a>

8000205a <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
8000205a:	7179                	addi	sp,sp,-48
8000205c:	d606                	sw	ra,44(sp)
8000205e:	d422                	sw	s0,40(sp)
80002060:	d226                	sw	s1,36(sp)
80002062:	d04a                	sw	s2,32(sp)
80002064:	ce4e                	sw	s3,28(sp)
80002066:	cc52                	sw	s4,24(sp)
80002068:	ca56                	sw	s5,20(sp)
8000206a:	c85a                	sw	s6,16(sp)
8000206c:	c65e                	sw	s7,12(sp)
8000206e:	1800                	addi	s0,sp,48
    // clang-format on
  };
  struct proc *p;
  char *state;

  printf("\n");
80002070:	00009517          	auipc	a0,0x9
80002074:	ffc50513          	addi	a0,a0,-4 # 8000b06c <etext+0x6c>
80002078:	c6cfe0ef          	jal	800004e4 <printf>
  for (p = proc; p < &proc[NPROC]; p++) {
8000207c:	000b9497          	auipc	s1,0xb9
80002080:	1ec48493          	addi	s1,s1,492 # 800bb268 <proc+0xb0>
80002084:	000bc917          	auipc	s2,0xbc
80002088:	1e490913          	addi	s2,s2,484 # 800be268 <bcache+0xa4>
    if (p->state == UNUSED)
      continue;
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
8000208c:	4b15                	li	s6,5
      state = states[p->state];
    else
      state = "???";
8000208e:	00009997          	auipc	s3,0x9
80002092:	1ee98993          	addi	s3,s3,494 # 8000b27c <etext+0x27c>
    printf("%d %s %s", p->pid, state, p->name);
80002096:	00009a97          	auipc	s5,0x9
8000209a:	1eaa8a93          	addi	s5,s5,490 # 8000b280 <etext+0x280>
    printf("\n");
8000209e:	00009a17          	auipc	s4,0x9
800020a2:	fcea0a13          	addi	s4,s4,-50 # 8000b06c <etext+0x6c>
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
800020a6:	00009b97          	auipc	s7,0x9
800020aa:	57ab8b93          	addi	s7,s7,1402 # 8000b620 <states.0>
800020ae:	a829                	j	800020c8 <procdump+0x6e>
    printf("%d %s %s", p->pid, state, p->name);
800020b0:	f6c6a583          	lw	a1,-148(a3)
800020b4:	8556                	mv	a0,s5
800020b6:	c2efe0ef          	jal	800004e4 <printf>
    printf("\n");
800020ba:	8552                	mv	a0,s4
800020bc:	c28fe0ef          	jal	800004e4 <printf>
  for (p = proc; p < &proc[NPROC]; p++) {
800020c0:	0c048493          	addi	s1,s1,192
800020c4:	01248f63          	beq	s1,s2,800020e2 <procdump+0x88>
    if (p->state == UNUSED)
800020c8:	86a6                	mv	a3,s1
800020ca:	f5c4a783          	lw	a5,-164(s1)
800020ce:	dbed                	beqz	a5,800020c0 <procdump+0x66>
      state = "???";
800020d0:	864e                	mv	a2,s3
    if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
800020d2:	fcfb6fe3          	bltu	s6,a5,800020b0 <procdump+0x56>
800020d6:	078a                	slli	a5,a5,0x2
800020d8:	97de                	add	a5,a5,s7
800020da:	4390                	lw	a2,0(a5)
800020dc:	fa71                	bnez	a2,800020b0 <procdump+0x56>
      state = "???";
800020de:	864e                	mv	a2,s3
800020e0:	bfc1                	j	800020b0 <procdump+0x56>
  }
}
800020e2:	50b2                	lw	ra,44(sp)
800020e4:	5422                	lw	s0,40(sp)
800020e6:	5492                	lw	s1,36(sp)
800020e8:	5902                	lw	s2,32(sp)
800020ea:	49f2                	lw	s3,28(sp)
800020ec:	4a62                	lw	s4,24(sp)
800020ee:	4ad2                	lw	s5,20(sp)
800020f0:	4b42                	lw	s6,16(sp)
800020f2:	4bb2                	lw	s7,12(sp)
800020f4:	6145                	addi	sp,sp,48
800020f6:	8082                	ret

800020f8 <swtch>:
# struct context (all uint32 on RV32):
#   ra, sp, s0-s11  = 14 * 4 = 56 bytes

.globl swtch
swtch:
        sw ra, 0(a0)
800020f8:	00152023          	sw	ra,0(a0)
        sw sp, 4(a0)
800020fc:	00252223          	sw	sp,4(a0)
        sw s0, 8(a0)
80002100:	c500                	sw	s0,8(a0)
        sw s1, 12(a0)
80002102:	c544                	sw	s1,12(a0)
        sw s2, 16(a0)
80002104:	01252823          	sw	s2,16(a0)
        sw s3, 20(a0)
80002108:	01352a23          	sw	s3,20(a0)
        sw s4, 24(a0)
8000210c:	01452c23          	sw	s4,24(a0)
        sw s5, 28(a0)
80002110:	01552e23          	sw	s5,28(a0)
        sw s6, 32(a0)
80002114:	03652023          	sw	s6,32(a0)
        sw s7, 36(a0)
80002118:	03752223          	sw	s7,36(a0)
        sw s8, 40(a0)
8000211c:	03852423          	sw	s8,40(a0)
        sw s9, 44(a0)
80002120:	03952623          	sw	s9,44(a0)
        sw s10, 48(a0)
80002124:	03a52823          	sw	s10,48(a0)
        sw s11, 52(a0)
80002128:	03b52a23          	sw	s11,52(a0)

        lw ra, 0(a1)
8000212c:	0005a083          	lw	ra,0(a1)
        lw sp, 4(a1)
80002130:	0045a103          	lw	sp,4(a1)
        lw s0, 8(a1)
80002134:	4580                	lw	s0,8(a1)
        lw s1, 12(a1)
80002136:	45c4                	lw	s1,12(a1)
        lw s2, 16(a1)
80002138:	0105a903          	lw	s2,16(a1)
        lw s3, 20(a1)
8000213c:	0145a983          	lw	s3,20(a1)
        lw s4, 24(a1)
80002140:	0185aa03          	lw	s4,24(a1)
        lw s5, 28(a1)
80002144:	01c5aa83          	lw	s5,28(a1)
        lw s6, 32(a1)
80002148:	0205ab03          	lw	s6,32(a1)
        lw s7, 36(a1)
8000214c:	0245ab83          	lw	s7,36(a1)
        lw s8, 40(a1)
80002150:	0285ac03          	lw	s8,40(a1)
        lw s9, 44(a1)
80002154:	02c5ac83          	lw	s9,44(a1)
        lw s10, 48(a1)
80002158:	0305ad03          	lw	s10,48(a1)
        lw s11, 52(a1)
8000215c:	0345ad83          	lw	s11,52(a1)
        
        ret
80002160:	8082                	ret

80002162 <trapinit>:

extern int devintr();

void
trapinit(void)
{
80002162:	1141                	addi	sp,sp,-16
80002164:	c606                	sw	ra,12(sp)
80002166:	c422                	sw	s0,8(sp)
80002168:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
8000216a:	00009597          	auipc	a1,0x9
8000216e:	15258593          	addi	a1,a1,338 # 8000b2bc <etext+0x2bc>
80002172:	000bc517          	auipc	a0,0xbc
80002176:	04650513          	addi	a0,a0,70 # 800be1b8 <tickslock>
8000217a:	8b5fe0ef          	jal	80000a2e <initlock>
}
8000217e:	40b2                	lw	ra,12(sp)
80002180:	4422                	lw	s0,8(sp)
80002182:	0141                	addi	sp,sp,16
80002184:	8082                	ret

80002186 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
80002186:	1141                	addi	sp,sp,-16
80002188:	c622                	sw	s0,12(sp)
8000218a:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r"(x));
8000218c:	00003797          	auipc	a5,0x3
80002190:	f0478793          	addi	a5,a5,-252 # 80005090 <kernelvec>
80002194:	10579073          	csrw	stvec,a5
  w_stvec((uint32)kernelvec);
}
80002198:	4432                	lw	s0,12(sp)
8000219a:	0141                	addi	sp,sp,16
8000219c:	8082                	ret

8000219e <prepare_return>:
//
// set up trapframe and control registers for a return to user space
//
void
prepare_return(void)
{
8000219e:	1141                	addi	sp,sp,-16
800021a0:	c606                	sw	ra,12(sp)
800021a2:	c422                	sw	s0,8(sp)
800021a4:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
800021a6:	caaff0ef          	jal	80001650 <myproc>
  asm volatile("csrr %0, sstatus" : "=r"(x));
800021aa:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
800021ae:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r"(x));
800021b0:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(). because a trap from kernel
  // code to usertrap would be a disaster, turn off interrupts.
  intr_off();

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint32 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
800021b4:	00008797          	auipc	a5,0x8
800021b8:	e4c78793          	addi	a5,a5,-436 # 8000a000 <_trampoline>
800021bc:	00008717          	auipc	a4,0x8
800021c0:	e4470713          	addi	a4,a4,-444 # 8000a000 <_trampoline>
800021c4:	8f99                	sub	a5,a5,a4
800021c6:	777d                	lui	a4,0xfffff
800021c8:	97ba                	add	a5,a5,a4
  asm volatile("csrw stvec, %0" : : "r"(x));
800021ca:	10579073          	csrw	stvec,a5
  w_stvec(trampoline_uservec);

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
800021ce:	591c                	lw	a5,48(a0)
  asm volatile("csrr %0, satp" : "=r"(x));
800021d0:	18002773          	csrr	a4,satp
800021d4:	c398                	sw	a4,0(a5)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
800021d6:	5918                	lw	a4,48(a0)
800021d8:	515c                	lw	a5,36(a0)
800021da:	6685                	lui	a3,0x1
800021dc:	97b6                	add	a5,a5,a3
800021de:	c35c                	sw	a5,4(a4)
  p->trapframe->kernel_trap = (uint32)usertrap;
800021e0:	591c                	lw	a5,48(a0)
800021e2:	00000717          	auipc	a4,0x0
800021e6:	0c070713          	addi	a4,a4,192 # 800022a2 <usertrap>
800021ea:	c798                	sw	a4,8(a5)
  p->trapframe->kernel_hartid = r_tp(); // hartid for cpuid()
800021ec:	591c                	lw	a5,48(a0)
  asm volatile("mv %0, tp" : "=r"(x));
800021ee:	8712                	mv	a4,tp
800021f0:	cb98                	sw	a4,16(a5)
  asm volatile("csrr %0, sstatus" : "=r"(x));
800021f2:	100027f3          	csrr	a5,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.

  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
800021f6:	eff7f793          	andi	a5,a5,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
800021fa:	0207e793          	ori	a5,a5,32
  asm volatile("csrw sstatus, %0" : : "r"(x));
800021fe:	10079073          	csrw	sstatus,a5
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
80002202:	591c                	lw	a5,48(a0)
  asm volatile("csrw sepc, %0" : : "r"(x));
80002204:	47dc                	lw	a5,12(a5)
80002206:	14179073          	csrw	sepc,a5
}
8000220a:	40b2                	lw	ra,12(sp)
8000220c:	4422                	lw	s0,8(sp)
8000220e:	0141                	addi	sp,sp,16
80002210:	8082                	ret

80002212 <clockintr>:
  w_sstatus(sstatus);
}

void
clockintr()
{
80002212:	1141                	addi	sp,sp,-16
80002214:	c606                	sw	ra,12(sp)
80002216:	c422                	sw	s0,8(sp)
80002218:	0800                	addi	s0,sp,16
  if (cpuid() == 0) {
8000221a:	c08ff0ef          	jal	80001622 <cpuid>
8000221e:	c11d                	beqz	a0,80002244 <clockintr+0x32>
  }

  // ask for the next timer interrupt via SBI.
  // Use SBI TIME set_timer (ext=0x54494D45, fid=0)
  uint32 now;
  asm volatile("csrr %0, time" : "=r"(now));
80002220:	c0102573          	rdtime	a0
  uint32 next = now + 100000;
80002224:	67e1                	lui	a5,0x18
80002226:	6a078793          	addi	a5,a5,1696 # 186a0 <_entry-0x7ffe7960>
8000222a:	953e                	add	a0,a0,a5

  register uint32 r0 asm("a0") = next;
  register uint32 r1 asm("a1") = 0;
8000222c:	4581                	li	a1,0
  register uint32 r6 asm("a6") = 0;
8000222e:	4801                	li	a6,0
  register uint32 r7 asm("a7") = 0x54494D45;
80002230:	544958b7          	lui	a7,0x54495
80002234:	d4588893          	addi	a7,a7,-699 # 54494d45 <_entry-0x2bb6b2bb>
  asm volatile("ecall"
80002238:	00000073          	ecall
    : "+r"(r0), "+r"(r1)
    : "r"(r6), "r"(r7)
    : "memory");
}
8000223c:	40b2                	lw	ra,12(sp)
8000223e:	4422                	lw	s0,8(sp)
80002240:	0141                	addi	sp,sp,16
80002242:	8082                	ret
80002244:	c226                	sw	s1,4(sp)
    acquire(&tickslock);
80002246:	000bc497          	auipc	s1,0xbc
8000224a:	f7248493          	addi	s1,s1,-142 # 800be1b8 <tickslock>
8000224e:	8526                	mv	a0,s1
80002250:	85ffe0ef          	jal	80000aae <acquire>
    ticks++;
80002254:	000b1517          	auipc	a0,0xb1
80002258:	c6050513          	addi	a0,a0,-928 # 800b2eb4 <ticks>
8000225c:	411c                	lw	a5,0(a0)
8000225e:	0785                	addi	a5,a5,1
80002260:	c11c                	sw	a5,0(a0)
    wakeup(&ticks);
80002262:	a65ff0ef          	jal	80001cc6 <wakeup>
    release(&tickslock);
80002266:	8526                	mv	a0,s1
80002268:	8cbfe0ef          	jal	80000b32 <release>
8000226c:	4492                	lw	s1,4(sp)
8000226e:	bf4d                	j	80002220 <clockintr+0xe>

80002270 <devintr>:
  asm volatile("csrr %0, scause" : "=r"(x));
80002270:	14202773          	csrr	a4,scause
devintr()
{
  uint32 scause = r_scause();

  // RV32: supervisor external interrupt = 0x80000009 (bit 31 set = interrupt, code 9)
  if (scause == 0x80000009) {
80002274:	800007b7          	lui	a5,0x80000
80002278:	07a5                	addi	a5,a5,9 # 80000009 <_entry+0x9>
    // this is a supervisor external interrupt.
    return 1; // no PLIC/UART in emulator, but acknowledge
8000227a:	4505                	li	a0,1
  if (scause == 0x80000009) {
8000227c:	00f70863          	beq	a4,a5,8000228c <devintr+0x1c>
  } else if (scause == 0x80000005) {
80002280:	800007b7          	lui	a5,0x80000
80002284:	0795                	addi	a5,a5,5 # 80000005 <_entry+0x5>
    // RV32: supervisor timer interrupt
    clockintr();
    return 2;
  } else {
    return 0;
80002286:	4501                	li	a0,0
  } else if (scause == 0x80000005) {
80002288:	00f70363          	beq	a4,a5,8000228e <devintr+0x1e>
  }
}
8000228c:	8082                	ret
{
8000228e:	1141                	addi	sp,sp,-16
80002290:	c606                	sw	ra,12(sp)
80002292:	c422                	sw	s0,8(sp)
80002294:	0800                	addi	s0,sp,16
    clockintr();
80002296:	3fb5                	jal	80002212 <clockintr>
    return 2;
80002298:	4509                	li	a0,2
}
8000229a:	40b2                	lw	ra,12(sp)
8000229c:	4422                	lw	s0,8(sp)
8000229e:	0141                	addi	sp,sp,16
800022a0:	8082                	ret

800022a2 <usertrap>:
{
800022a2:	1141                	addi	sp,sp,-16
800022a4:	c606                	sw	ra,12(sp)
800022a6:	c422                	sw	s0,8(sp)
800022a8:	c226                	sw	s1,4(sp)
800022aa:	c04a                	sw	s2,0(sp)
800022ac:	0800                	addi	s0,sp,16
  asm volatile("csrr %0, sstatus" : "=r"(x));
800022ae:	100027f3          	csrr	a5,sstatus
  if ((r_sstatus() & SSTATUS_SPP) != 0)
800022b2:	1007f793          	andi	a5,a5,256
800022b6:	eb9d                	bnez	a5,800022ec <usertrap+0x4a>
  asm volatile("csrw stvec, %0" : : "r"(x));
800022b8:	00003797          	auipc	a5,0x3
800022bc:	dd878793          	addi	a5,a5,-552 # 80005090 <kernelvec>
800022c0:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
800022c4:	b8cff0ef          	jal	80001650 <myproc>
800022c8:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
800022ca:	591c                	lw	a5,48(a0)
  asm volatile("csrr %0, sepc" : "=r"(x));
800022cc:	14102773          	csrr	a4,sepc
800022d0:	c7d8                	sw	a4,12(a5)
  asm volatile("csrr %0, scause" : "=r"(x));
800022d2:	14202773          	csrr	a4,scause
  if (r_scause() == 8) {
800022d6:	47a1                	li	a5,8
800022d8:	02f70063          	beq	a4,a5,800022f8 <usertrap+0x56>
  } else if ((which_dev = devintr()) != 0) {
800022dc:	3f51                	jal	80002270 <devintr>
800022de:	892a                	mv	s2,a0
800022e0:	c52d                	beqz	a0,8000234a <usertrap+0xa8>
  if (killed(p))
800022e2:	8526                	mv	a0,s1
800022e4:	bc7ff0ef          	jal	80001eaa <killed>
800022e8:	cd15                	beqz	a0,80002324 <usertrap+0x82>
800022ea:	a815                	j	8000231e <usertrap+0x7c>
    panic("usertrap: not from user mode");
800022ec:	00009517          	auipc	a0,0x9
800022f0:	fd850513          	addi	a0,a0,-40 # 8000b2c4 <etext+0x2c4>
800022f4:	cc4fe0ef          	jal	800007b8 <panic>
    if (killed(p))
800022f8:	bb3ff0ef          	jal	80001eaa <killed>
800022fc:	e139                	bnez	a0,80002342 <usertrap+0xa0>
    p->trapframe->epc += 4;
800022fe:	5898                	lw	a4,48(s1)
80002300:	475c                	lw	a5,12(a4)
80002302:	0791                	addi	a5,a5,4
80002304:	c75c                	sw	a5,12(a4)
  asm volatile("csrr %0, sstatus" : "=r"(x));
80002306:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
8000230a:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r"(x));
8000230e:	10079073          	csrw	sstatus,a5
    syscall();
80002312:	2491                	jal	80002556 <syscall>
  if (killed(p))
80002314:	8526                	mv	a0,s1
80002316:	b95ff0ef          	jal	80001eaa <killed>
8000231a:	c901                	beqz	a0,8000232a <usertrap+0x88>
8000231c:	4901                	li	s2,0
    kexit(-1);
8000231e:	557d                	li	a0,-1
80002320:	a65ff0ef          	jal	80001d84 <kexit>
  if (which_dev == 2)
80002324:	4789                	li	a5,2
80002326:	04f90963          	beq	s2,a5,80002378 <usertrap+0xd6>
  prepare_return();
8000232a:	3d95                	jal	8000219e <prepare_return>
  uint32 satp = MAKE_SATP(p->pagetable);
8000232c:	54c8                	lw	a0,44(s1)
8000232e:	8131                	srli	a0,a0,0xc
80002330:	800007b7          	lui	a5,0x80000
80002334:	8d5d                	or	a0,a0,a5
}
80002336:	40b2                	lw	ra,12(sp)
80002338:	4422                	lw	s0,8(sp)
8000233a:	4492                	lw	s1,4(sp)
8000233c:	4902                	lw	s2,0(sp)
8000233e:	0141                	addi	sp,sp,16
80002340:	8082                	ret
      kexit(-1);
80002342:	557d                	li	a0,-1
80002344:	a41ff0ef          	jal	80001d84 <kexit>
80002348:	bf5d                	j	800022fe <usertrap+0x5c>
  asm volatile("csrr %0, scause" : "=r"(x));
8000234a:	142025f3          	csrr	a1,scause
    printf("usertrap(): unexpected scause 0x%x pid=%d\n", r_scause(), p->pid);
8000234e:	4cd0                	lw	a2,28(s1)
80002350:	00009517          	auipc	a0,0x9
80002354:	f9450513          	addi	a0,a0,-108 # 8000b2e4 <etext+0x2e4>
80002358:	98cfe0ef          	jal	800004e4 <printf>
  asm volatile("csrr %0, sepc" : "=r"(x));
8000235c:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r"(x));
80002360:	14302673          	csrr	a2,stval
    printf("            sepc=0x%x stval=0x%x\n", r_sepc(), r_stval());
80002364:	00009517          	auipc	a0,0x9
80002368:	fac50513          	addi	a0,a0,-84 # 8000b310 <etext+0x310>
8000236c:	978fe0ef          	jal	800004e4 <printf>
    setkilled(p);
80002370:	8526                	mv	a0,s1
80002372:	b15ff0ef          	jal	80001e86 <setkilled>
80002376:	bf79                	j	80002314 <usertrap+0x72>
    yield();
80002378:	8dfff0ef          	jal	80001c56 <yield>
8000237c:	b77d                	j	8000232a <usertrap+0x88>

8000237e <kerneltrap>:
{
8000237e:	1101                	addi	sp,sp,-32
80002380:	ce06                	sw	ra,28(sp)
80002382:	cc22                	sw	s0,24(sp)
80002384:	ca26                	sw	s1,20(sp)
80002386:	c84a                	sw	s2,16(sp)
80002388:	c64e                	sw	s3,12(sp)
8000238a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r"(x));
8000238c:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r"(x));
80002390:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r"(x));
80002394:	142029f3          	csrr	s3,scause
  if ((sstatus & SSTATUS_SPP) == 0)
80002398:	1004f793          	andi	a5,s1,256
8000239c:	c78d                	beqz	a5,800023c6 <kerneltrap+0x48>
  asm volatile("csrr %0, sstatus" : "=r"(x));
8000239e:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
800023a2:	8b89                	andi	a5,a5,2
  if (intr_get() != 0)
800023a4:	e79d                	bnez	a5,800023d2 <kerneltrap+0x54>
  if ((which_dev = devintr()) == 0) {
800023a6:	35e9                	jal	80002270 <devintr>
800023a8:	c91d                	beqz	a0,800023de <kerneltrap+0x60>
  if (which_dev == 2 && myproc() != 0)
800023aa:	4789                	li	a5,2
800023ac:	04f50a63          	beq	a0,a5,80002400 <kerneltrap+0x82>
  asm volatile("csrw sepc, %0" : : "r"(x));
800023b0:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r"(x));
800023b4:	10049073          	csrw	sstatus,s1
}
800023b8:	40f2                	lw	ra,28(sp)
800023ba:	4462                	lw	s0,24(sp)
800023bc:	44d2                	lw	s1,20(sp)
800023be:	4942                	lw	s2,16(sp)
800023c0:	49b2                	lw	s3,12(sp)
800023c2:	6105                	addi	sp,sp,32
800023c4:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
800023c6:	00009517          	auipc	a0,0x9
800023ca:	f6e50513          	addi	a0,a0,-146 # 8000b334 <etext+0x334>
800023ce:	beafe0ef          	jal	800007b8 <panic>
    panic("kerneltrap: interrupts enabled");
800023d2:	00009517          	auipc	a0,0x9
800023d6:	f8a50513          	addi	a0,a0,-118 # 8000b35c <etext+0x35c>
800023da:	bdefe0ef          	jal	800007b8 <panic>
  asm volatile("csrr %0, sepc" : "=r"(x));
800023de:	14102673          	csrr	a2,sepc
  asm volatile("csrr %0, stval" : "=r"(x));
800023e2:	143026f3          	csrr	a3,stval
    printf("scause=0x%x sepc=0x%x stval=0x%x\n", scause, r_sepc(), r_stval());
800023e6:	85ce                	mv	a1,s3
800023e8:	00009517          	auipc	a0,0x9
800023ec:	f9450513          	addi	a0,a0,-108 # 8000b37c <etext+0x37c>
800023f0:	8f4fe0ef          	jal	800004e4 <printf>
    panic("kerneltrap");
800023f4:	00009517          	auipc	a0,0x9
800023f8:	fac50513          	addi	a0,a0,-84 # 8000b3a0 <etext+0x3a0>
800023fc:	bbcfe0ef          	jal	800007b8 <panic>
  if (which_dev == 2 && myproc() != 0)
80002400:	a50ff0ef          	jal	80001650 <myproc>
80002404:	d555                	beqz	a0,800023b0 <kerneltrap+0x32>
    yield();
80002406:	851ff0ef          	jal	80001c56 <yield>
8000240a:	b75d                	j	800023b0 <kerneltrap+0x32>

8000240c <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
8000240c:	1141                	addi	sp,sp,-16
8000240e:	c606                	sw	ra,12(sp)
80002410:	c422                	sw	s0,8(sp)
80002412:	c226                	sw	s1,4(sp)
80002414:	0800                	addi	s0,sp,16
80002416:	84aa                	mv	s1,a0
  struct proc *p = myproc();
80002418:	a38ff0ef          	jal	80001650 <myproc>
  switch (n) {
8000241c:	4795                	li	a5,5
8000241e:	0497e163          	bltu	a5,s1,80002460 <argraw+0x54>
80002422:	048a                	slli	s1,s1,0x2
80002424:	00009717          	auipc	a4,0x9
80002428:	21470713          	addi	a4,a4,532 # 8000b638 <states.0+0x18>
8000242c:	94ba                	add	s1,s1,a4
8000242e:	409c                	lw	a5,0(s1)
80002430:	97ba                	add	a5,a5,a4
80002432:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
80002434:	591c                	lw	a5,48(a0)
80002436:	5f88                	lw	a0,56(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
80002438:	40b2                	lw	ra,12(sp)
8000243a:	4422                	lw	s0,8(sp)
8000243c:	4492                	lw	s1,4(sp)
8000243e:	0141                	addi	sp,sp,16
80002440:	8082                	ret
    return p->trapframe->a1;
80002442:	591c                	lw	a5,48(a0)
80002444:	5fc8                	lw	a0,60(a5)
80002446:	bfcd                	j	80002438 <argraw+0x2c>
    return p->trapframe->a2;
80002448:	591c                	lw	a5,48(a0)
8000244a:	43a8                	lw	a0,64(a5)
8000244c:	b7f5                	j	80002438 <argraw+0x2c>
    return p->trapframe->a3;
8000244e:	591c                	lw	a5,48(a0)
80002450:	43e8                	lw	a0,68(a5)
80002452:	b7dd                	j	80002438 <argraw+0x2c>
    return p->trapframe->a4;
80002454:	591c                	lw	a5,48(a0)
80002456:	47a8                	lw	a0,72(a5)
80002458:	b7c5                	j	80002438 <argraw+0x2c>
    return p->trapframe->a5;
8000245a:	591c                	lw	a5,48(a0)
8000245c:	47e8                	lw	a0,76(a5)
8000245e:	bfe9                	j	80002438 <argraw+0x2c>
  panic("argraw");
80002460:	00009517          	auipc	a0,0x9
80002464:	f4c50513          	addi	a0,a0,-180 # 8000b3ac <etext+0x3ac>
80002468:	b50fe0ef          	jal	800007b8 <panic>

8000246c <fetchaddr>:
{
8000246c:	1141                	addi	sp,sp,-16
8000246e:	c606                	sw	ra,12(sp)
80002470:	c422                	sw	s0,8(sp)
80002472:	c226                	sw	s1,4(sp)
80002474:	c04a                	sw	s2,0(sp)
80002476:	0800                	addi	s0,sp,16
80002478:	84aa                	mv	s1,a0
8000247a:	892e                	mv	s2,a1
  struct proc *p = myproc();
8000247c:	9d4ff0ef          	jal	80001650 <myproc>
  if (addr >= p->sz ||
80002480:	551c                	lw	a5,40(a0)
80002482:	02f4f663          	bgeu	s1,a5,800024ae <fetchaddr+0x42>
      addr + sizeof(uint64) > p->sz) // both tests needed, in case of overflow
80002486:	00448713          	addi	a4,s1,4
  if (addr >= p->sz ||
8000248a:	02e7e463          	bltu	a5,a4,800024b2 <fetchaddr+0x46>
  if (copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
8000248e:	4691                	li	a3,4
80002490:	8626                	mv	a2,s1
80002492:	85ca                	mv	a1,s2
80002494:	5548                	lw	a0,44(a0)
80002496:	f45fe0ef          	jal	800013da <copyin>
8000249a:	00a03533          	snez	a0,a0
8000249e:	40a00533          	neg	a0,a0
}
800024a2:	40b2                	lw	ra,12(sp)
800024a4:	4422                	lw	s0,8(sp)
800024a6:	4492                	lw	s1,4(sp)
800024a8:	4902                	lw	s2,0(sp)
800024aa:	0141                	addi	sp,sp,16
800024ac:	8082                	ret
    return -1;
800024ae:	557d                	li	a0,-1
800024b0:	bfcd                	j	800024a2 <fetchaddr+0x36>
800024b2:	557d                	li	a0,-1
800024b4:	b7fd                	j	800024a2 <fetchaddr+0x36>

800024b6 <fetchstr>:
{
800024b6:	1101                	addi	sp,sp,-32
800024b8:	ce06                	sw	ra,28(sp)
800024ba:	cc22                	sw	s0,24(sp)
800024bc:	ca26                	sw	s1,20(sp)
800024be:	c84a                	sw	s2,16(sp)
800024c0:	c64e                	sw	s3,12(sp)
800024c2:	1000                	addi	s0,sp,32
800024c4:	892a                	mv	s2,a0
800024c6:	84ae                	mv	s1,a1
800024c8:	89b2                	mv	s3,a2
  struct proc *p = myproc();
800024ca:	986ff0ef          	jal	80001650 <myproc>
  if (copyinstr(p->pagetable, buf, addr, max) < 0)
800024ce:	86ce                	mv	a3,s3
800024d0:	864a                	mv	a2,s2
800024d2:	85a6                	mv	a1,s1
800024d4:	5548                	lw	a0,44(a0)
800024d6:	f87fe0ef          	jal	8000145c <copyinstr>
800024da:	00054c63          	bltz	a0,800024f2 <fetchstr+0x3c>
  return strlen(buf);
800024de:	8526                	mv	a0,s1
800024e0:	fc4fe0ef          	jal	80000ca4 <strlen>
}
800024e4:	40f2                	lw	ra,28(sp)
800024e6:	4462                	lw	s0,24(sp)
800024e8:	44d2                	lw	s1,20(sp)
800024ea:	4942                	lw	s2,16(sp)
800024ec:	49b2                	lw	s3,12(sp)
800024ee:	6105                	addi	sp,sp,32
800024f0:	8082                	ret
    return -1;
800024f2:	557d                	li	a0,-1
800024f4:	bfc5                	j	800024e4 <fetchstr+0x2e>

800024f6 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
800024f6:	1141                	addi	sp,sp,-16
800024f8:	c606                	sw	ra,12(sp)
800024fa:	c422                	sw	s0,8(sp)
800024fc:	c226                	sw	s1,4(sp)
800024fe:	0800                	addi	s0,sp,16
80002500:	84ae                	mv	s1,a1
  *ip = argraw(n);
80002502:	3729                	jal	8000240c <argraw>
80002504:	c088                	sw	a0,0(s1)
}
80002506:	40b2                	lw	ra,12(sp)
80002508:	4422                	lw	s0,8(sp)
8000250a:	4492                	lw	s1,4(sp)
8000250c:	0141                	addi	sp,sp,16
8000250e:	8082                	ret

80002510 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
80002510:	1141                	addi	sp,sp,-16
80002512:	c606                	sw	ra,12(sp)
80002514:	c422                	sw	s0,8(sp)
80002516:	c226                	sw	s1,4(sp)
80002518:	0800                	addi	s0,sp,16
8000251a:	84ae                	mv	s1,a1
  *ip = argraw(n);
8000251c:	3dc5                	jal	8000240c <argraw>
8000251e:	c088                	sw	a0,0(s1)
}
80002520:	40b2                	lw	ra,12(sp)
80002522:	4422                	lw	s0,8(sp)
80002524:	4492                	lw	s1,4(sp)
80002526:	0141                	addi	sp,sp,16
80002528:	8082                	ret

8000252a <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (not including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
8000252a:	1101                	addi	sp,sp,-32
8000252c:	ce06                	sw	ra,28(sp)
8000252e:	cc22                	sw	s0,24(sp)
80002530:	ca26                	sw	s1,20(sp)
80002532:	c84a                	sw	s2,16(sp)
80002534:	1000                	addi	s0,sp,32
80002536:	84ae                	mv	s1,a1
80002538:	8932                	mv	s2,a2
  uint64 addr;
  argaddr(n, &addr);
8000253a:	fec40593          	addi	a1,s0,-20
8000253e:	3fc9                	jal	80002510 <argaddr>
  return fetchstr(addr, buf, max);
80002540:	864a                	mv	a2,s2
80002542:	85a6                	mv	a1,s1
80002544:	fec42503          	lw	a0,-20(s0)
80002548:	37bd                	jal	800024b6 <fetchstr>
}
8000254a:	40f2                	lw	ra,28(sp)
8000254c:	4462                	lw	s0,24(sp)
8000254e:	44d2                	lw	s1,20(sp)
80002550:	4942                	lw	s2,16(sp)
80002552:	6105                	addi	sp,sp,32
80002554:	8082                	ret

80002556 <syscall>:
  // clang-format on
};

void
syscall(void)
{
80002556:	1141                	addi	sp,sp,-16
80002558:	c606                	sw	ra,12(sp)
8000255a:	c422                	sw	s0,8(sp)
8000255c:	c226                	sw	s1,4(sp)
8000255e:	c04a                	sw	s2,0(sp)
80002560:	0800                	addi	s0,sp,16
  int num;
  struct proc *p = myproc();
80002562:	8eeff0ef          	jal	80001650 <myproc>
80002566:	84aa                	mv	s1,a0

  num = p->trapframe->a7;
80002568:	03052903          	lw	s2,48(a0)
8000256c:	05492683          	lw	a3,84(s2)
  if (num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80002570:	fff68713          	addi	a4,a3,-1 # fff <_entry-0x7ffff001>
80002574:	47d1                	li	a5,20
80002576:	00e7ef63          	bltu	a5,a4,80002594 <syscall+0x3e>
8000257a:	00269713          	slli	a4,a3,0x2
8000257e:	00009797          	auipc	a5,0x9
80002582:	0d278793          	addi	a5,a5,210 # 8000b650 <syscalls>
80002586:	97ba                	add	a5,a5,a4
80002588:	439c                	lw	a5,0(a5)
8000258a:	c789                	beqz	a5,80002594 <syscall+0x3e>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
8000258c:	9782                	jalr	a5
8000258e:	02a92c23          	sw	a0,56(s2)
80002592:	a829                	j	800025ac <syscall+0x56>
  } else {
    printf("%d %s: unknown sys call %d\n", p->pid, p->name, num);
80002594:	0b048613          	addi	a2,s1,176
80002598:	4ccc                	lw	a1,28(s1)
8000259a:	00009517          	auipc	a0,0x9
8000259e:	e1a50513          	addi	a0,a0,-486 # 8000b3b4 <etext+0x3b4>
800025a2:	f43fd0ef          	jal	800004e4 <printf>
    p->trapframe->a0 = -1;
800025a6:	589c                	lw	a5,48(s1)
800025a8:	577d                	li	a4,-1
800025aa:	df98                	sw	a4,56(a5)
  }
}
800025ac:	40b2                	lw	ra,12(sp)
800025ae:	4422                	lw	s0,8(sp)
800025b0:	4492                	lw	s1,4(sp)
800025b2:	4902                	lw	s2,0(sp)
800025b4:	0141                	addi	sp,sp,16
800025b6:	8082                	ret

800025b8 <sys_exit>:
#include "proc.h"
#include "vm.h"

uint64
sys_exit(void)
{
800025b8:	1101                	addi	sp,sp,-32
800025ba:	ce06                	sw	ra,28(sp)
800025bc:	cc22                	sw	s0,24(sp)
800025be:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
800025c0:	fec40593          	addi	a1,s0,-20
800025c4:	4501                	li	a0,0
800025c6:	3f05                	jal	800024f6 <argint>
  kexit(n);
800025c8:	fec42503          	lw	a0,-20(s0)
800025cc:	fb8ff0ef          	jal	80001d84 <kexit>
  return 0; // not reached
}
800025d0:	4501                	li	a0,0
800025d2:	40f2                	lw	ra,28(sp)
800025d4:	4462                	lw	s0,24(sp)
800025d6:	6105                	addi	sp,sp,32
800025d8:	8082                	ret

800025da <sys_getpid>:

uint64
sys_getpid(void)
{
800025da:	1141                	addi	sp,sp,-16
800025dc:	c606                	sw	ra,12(sp)
800025de:	c422                	sw	s0,8(sp)
800025e0:	0800                	addi	s0,sp,16
  return myproc()->pid;
800025e2:	86eff0ef          	jal	80001650 <myproc>
}
800025e6:	4d48                	lw	a0,28(a0)
800025e8:	40b2                	lw	ra,12(sp)
800025ea:	4422                	lw	s0,8(sp)
800025ec:	0141                	addi	sp,sp,16
800025ee:	8082                	ret

800025f0 <sys_fork>:

uint64
sys_fork(void)
{
800025f0:	1141                	addi	sp,sp,-16
800025f2:	c606                	sw	ra,12(sp)
800025f4:	c422                	sw	s0,8(sp)
800025f6:	0800                	addi	s0,sp,16
  return kfork();
800025f8:	beaff0ef          	jal	800019e2 <kfork>
}
800025fc:	40b2                	lw	ra,12(sp)
800025fe:	4422                	lw	s0,8(sp)
80002600:	0141                	addi	sp,sp,16
80002602:	8082                	ret

80002604 <sys_wait>:

uint64
sys_wait(void)
{
80002604:	1101                	addi	sp,sp,-32
80002606:	ce06                	sw	ra,28(sp)
80002608:	cc22                	sw	s0,24(sp)
8000260a:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
8000260c:	fec40593          	addi	a1,s0,-20
80002610:	4501                	li	a0,0
80002612:	3dfd                	jal	80002510 <argaddr>
  return kwait(p);
80002614:	fec42503          	lw	a0,-20(s0)
80002618:	8bdff0ef          	jal	80001ed4 <kwait>
}
8000261c:	40f2                	lw	ra,28(sp)
8000261e:	4462                	lw	s0,24(sp)
80002620:	6105                	addi	sp,sp,32
80002622:	8082                	ret

80002624 <sys_sbrk>:

uint64
sys_sbrk(void)
{
80002624:	1101                	addi	sp,sp,-32
80002626:	ce06                	sw	ra,28(sp)
80002628:	cc22                	sw	s0,24(sp)
8000262a:	ca26                	sw	s1,20(sp)
8000262c:	1000                	addi	s0,sp,32
  uint64 addr;
  int t;
  int n;

  argint(0, &n);
8000262e:	fe840593          	addi	a1,s0,-24
80002632:	4501                	li	a0,0
80002634:	35c9                	jal	800024f6 <argint>
  argint(1, &t);
80002636:	fec40593          	addi	a1,s0,-20
8000263a:	4505                	li	a0,1
8000263c:	3d6d                	jal	800024f6 <argint>
  addr = myproc()->sz;
8000263e:	812ff0ef          	jal	80001650 <myproc>
80002642:	5504                	lw	s1,40(a0)

  if (t == SBRK_EAGER || n < 0) {
80002644:	fec42703          	lw	a4,-20(s0)
80002648:	4785                	li	a5,1
8000264a:	02f70463          	beq	a4,a5,80002672 <sys_sbrk+0x4e>
8000264e:	fe842783          	lw	a5,-24(s0)
80002652:	0207c063          	bltz	a5,80002672 <sys_sbrk+0x4e>
    }
  } else {
    // Lazily allocate memory for this process: increase its memory
    // size but don't allocate memory. If the processes uses the
    // memory, vmfault() will allocate it.
    if (addr + n < addr)
80002656:	97a6                	add	a5,a5,s1
80002658:	0297eb63          	bltu	a5,s1,8000268e <sys_sbrk+0x6a>
      return -1;
    if (addr + n > TRAPFRAME)
8000265c:	7779                	lui	a4,0xffffe
8000265e:	02f76a63          	bltu	a4,a5,80002692 <sys_sbrk+0x6e>
      return -1;
    myproc()->sz += n;
80002662:	feffe0ef          	jal	80001650 <myproc>
80002666:	551c                	lw	a5,40(a0)
80002668:	fe842703          	lw	a4,-24(s0)
8000266c:	97ba                	add	a5,a5,a4
8000266e:	d51c                	sw	a5,40(a0)
80002670:	a039                	j	8000267e <sys_sbrk+0x5a>
    if (growproc(n) < 0) {
80002672:	fe842503          	lw	a0,-24(s0)
80002676:	b12ff0ef          	jal	80001988 <growproc>
8000267a:	00054863          	bltz	a0,8000268a <sys_sbrk+0x66>
  }
  return addr;
}
8000267e:	8526                	mv	a0,s1
80002680:	40f2                	lw	ra,28(sp)
80002682:	4462                	lw	s0,24(sp)
80002684:	44d2                	lw	s1,20(sp)
80002686:	6105                	addi	sp,sp,32
80002688:	8082                	ret
      return -1;
8000268a:	54fd                	li	s1,-1
8000268c:	bfcd                	j	8000267e <sys_sbrk+0x5a>
      return -1;
8000268e:	54fd                	li	s1,-1
80002690:	b7fd                	j	8000267e <sys_sbrk+0x5a>
      return -1;
80002692:	54fd                	li	s1,-1
80002694:	b7ed                	j	8000267e <sys_sbrk+0x5a>

80002696 <sys_pause>:

uint64
sys_pause(void)
{
80002696:	7179                	addi	sp,sp,-48
80002698:	d606                	sw	ra,44(sp)
8000269a:	d422                	sw	s0,40(sp)
8000269c:	d04a                	sw	s2,32(sp)
8000269e:	1800                	addi	s0,sp,48
  int n;
  uint ticks0;

  argint(0, &n);
800026a0:	fdc40593          	addi	a1,s0,-36
800026a4:	4501                	li	a0,0
800026a6:	e51ff0ef          	jal	800024f6 <argint>
  if (n < 0)
800026aa:	fdc42783          	lw	a5,-36(s0)
800026ae:	0607c763          	bltz	a5,8000271c <sys_pause+0x86>
    n = 0;
  acquire(&tickslock);
800026b2:	000bc517          	auipc	a0,0xbc
800026b6:	b0650513          	addi	a0,a0,-1274 # 800be1b8 <tickslock>
800026ba:	bf4fe0ef          	jal	80000aae <acquire>
  ticks0 = ticks;
800026be:	000b0917          	auipc	s2,0xb0
800026c2:	7f692903          	lw	s2,2038(s2) # 800b2eb4 <ticks>
  while (ticks - ticks0 < n) {
800026c6:	fdc42783          	lw	a5,-36(s0)
800026ca:	cf8d                	beqz	a5,80002704 <sys_pause+0x6e>
800026cc:	d226                	sw	s1,36(sp)
800026ce:	ce4e                	sw	s3,28(sp)
    if (killed(myproc())) {
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
800026d0:	000bc997          	auipc	s3,0xbc
800026d4:	ae898993          	addi	s3,s3,-1304 # 800be1b8 <tickslock>
800026d8:	000b0497          	auipc	s1,0xb0
800026dc:	7dc48493          	addi	s1,s1,2012 # 800b2eb4 <ticks>
    if (killed(myproc())) {
800026e0:	f71fe0ef          	jal	80001650 <myproc>
800026e4:	fc6ff0ef          	jal	80001eaa <killed>
800026e8:	ed0d                	bnez	a0,80002722 <sys_pause+0x8c>
    sleep(&ticks, &tickslock);
800026ea:	85ce                	mv	a1,s3
800026ec:	8526                	mv	a0,s1
800026ee:	d90ff0ef          	jal	80001c7e <sleep>
  while (ticks - ticks0 < n) {
800026f2:	409c                	lw	a5,0(s1)
800026f4:	412787b3          	sub	a5,a5,s2
800026f8:	fdc42703          	lw	a4,-36(s0)
800026fc:	fee7e2e3          	bltu	a5,a4,800026e0 <sys_pause+0x4a>
80002700:	5492                	lw	s1,36(sp)
80002702:	49f2                	lw	s3,28(sp)
  }
  release(&tickslock);
80002704:	000bc517          	auipc	a0,0xbc
80002708:	ab450513          	addi	a0,a0,-1356 # 800be1b8 <tickslock>
8000270c:	c26fe0ef          	jal	80000b32 <release>
  return 0;
80002710:	4501                	li	a0,0
}
80002712:	50b2                	lw	ra,44(sp)
80002714:	5422                	lw	s0,40(sp)
80002716:	5902                	lw	s2,32(sp)
80002718:	6145                	addi	sp,sp,48
8000271a:	8082                	ret
    n = 0;
8000271c:	fc042e23          	sw	zero,-36(s0)
80002720:	bf49                	j	800026b2 <sys_pause+0x1c>
      release(&tickslock);
80002722:	000bc517          	auipc	a0,0xbc
80002726:	a9650513          	addi	a0,a0,-1386 # 800be1b8 <tickslock>
8000272a:	c08fe0ef          	jal	80000b32 <release>
      return -1;
8000272e:	557d                	li	a0,-1
80002730:	5492                	lw	s1,36(sp)
80002732:	49f2                	lw	s3,28(sp)
80002734:	bff9                	j	80002712 <sys_pause+0x7c>

80002736 <sys_kill>:

uint64
sys_kill(void)
{
80002736:	1101                	addi	sp,sp,-32
80002738:	ce06                	sw	ra,28(sp)
8000273a:	cc22                	sw	s0,24(sp)
8000273c:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
8000273e:	fec40593          	addi	a1,s0,-20
80002742:	4501                	li	a0,0
80002744:	db3ff0ef          	jal	800024f6 <argint>
  return kkill(pid);
80002748:	fec42503          	lw	a0,-20(s0)
8000274c:	ed4ff0ef          	jal	80001e20 <kkill>
}
80002750:	40f2                	lw	ra,28(sp)
80002752:	4462                	lw	s0,24(sp)
80002754:	6105                	addi	sp,sp,32
80002756:	8082                	ret

80002758 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
80002758:	1141                	addi	sp,sp,-16
8000275a:	c606                	sw	ra,12(sp)
8000275c:	c422                	sw	s0,8(sp)
8000275e:	c226                	sw	s1,4(sp)
80002760:	0800                	addi	s0,sp,16
  uint xticks;

  acquire(&tickslock);
80002762:	000bc517          	auipc	a0,0xbc
80002766:	a5650513          	addi	a0,a0,-1450 # 800be1b8 <tickslock>
8000276a:	b44fe0ef          	jal	80000aae <acquire>
  xticks = ticks;
8000276e:	000b0497          	auipc	s1,0xb0
80002772:	7464a483          	lw	s1,1862(s1) # 800b2eb4 <ticks>
  release(&tickslock);
80002776:	000bc517          	auipc	a0,0xbc
8000277a:	a4250513          	addi	a0,a0,-1470 # 800be1b8 <tickslock>
8000277e:	bb4fe0ef          	jal	80000b32 <release>
  return xticks;
}
80002782:	8526                	mv	a0,s1
80002784:	40b2                	lw	ra,12(sp)
80002786:	4422                	lw	s0,8(sp)
80002788:	4492                	lw	s1,4(sp)
8000278a:	0141                	addi	sp,sp,16
8000278c:	8082                	ret

8000278e <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
8000278e:	1101                	addi	sp,sp,-32
80002790:	ce06                	sw	ra,28(sp)
80002792:	cc22                	sw	s0,24(sp)
80002794:	ca26                	sw	s1,20(sp)
80002796:	c84a                	sw	s2,16(sp)
80002798:	c64e                	sw	s3,12(sp)
8000279a:	c452                	sw	s4,8(sp)
8000279c:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8000279e:	00009597          	auipc	a1,0x9
800027a2:	c3258593          	addi	a1,a1,-974 # 8000b3d0 <etext+0x3d0>
800027a6:	000bc517          	auipc	a0,0xbc
800027aa:	a1e50513          	addi	a0,a0,-1506 # 800be1c4 <bcache>
800027ae:	a80fe0ef          	jal	80000a2e <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
800027b2:	000c4797          	auipc	a5,0xc4
800027b6:	a1278793          	addi	a5,a5,-1518 # 800c61c4 <bcache+0x8000>
800027ba:	000c4717          	auipc	a4,0xc4
800027be:	82e70713          	addi	a4,a4,-2002 # 800c5fe8 <bcache+0x7e24>
800027c2:	e4e7a823          	sw	a4,-432(a5)
  bcache.head.next = &bcache.head;
800027c6:	e4e7aa23          	sw	a4,-428(a5)
  for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
800027ca:	000bc497          	auipc	s1,0xbc
800027ce:	a0648493          	addi	s1,s1,-1530 # 800be1d0 <bcache+0xc>
    b->next = bcache.head.next;
800027d2:	893e                	mv	s2,a5
    b->prev = &bcache.head;
800027d4:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
800027d6:	00009a17          	auipc	s4,0x9
800027da:	c02a0a13          	addi	s4,s4,-1022 # 8000b3d8 <etext+0x3d8>
    b->next = bcache.head.next;
800027de:	e5492783          	lw	a5,-428(s2)
800027e2:	d89c                	sw	a5,48(s1)
    b->prev = &bcache.head;
800027e4:	0334a623          	sw	s3,44(s1)
    initsleeplock(&b->lock, "buffer");
800027e8:	85d2                	mv	a1,s4
800027ea:	01048513          	addi	a0,s1,16
800027ee:	23a010ef          	jal	80003a28 <initsleeplock>
    bcache.head.next->prev = b;
800027f2:	e5492783          	lw	a5,-428(s2)
800027f6:	d7c4                	sw	s1,44(a5)
    bcache.head.next = b;
800027f8:	e4992a23          	sw	s1,-428(s2)
  for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
800027fc:	43448493          	addi	s1,s1,1076
80002800:	fd349fe3          	bne	s1,s3,800027de <binit+0x50>
  }
}
80002804:	40f2                	lw	ra,28(sp)
80002806:	4462                	lw	s0,24(sp)
80002808:	44d2                	lw	s1,20(sp)
8000280a:	4942                	lw	s2,16(sp)
8000280c:	49b2                	lw	s3,12(sp)
8000280e:	4a22                	lw	s4,8(sp)
80002810:	6105                	addi	sp,sp,32
80002812:	8082                	ret

80002814 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf *
bread(uint dev, uint blockno)
{
80002814:	1101                	addi	sp,sp,-32
80002816:	ce06                	sw	ra,28(sp)
80002818:	cc22                	sw	s0,24(sp)
8000281a:	ca26                	sw	s1,20(sp)
8000281c:	c84a                	sw	s2,16(sp)
8000281e:	c64e                	sw	s3,12(sp)
80002820:	1000                	addi	s0,sp,32
80002822:	892a                	mv	s2,a0
80002824:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
80002826:	000bc517          	auipc	a0,0xbc
8000282a:	99e50513          	addi	a0,a0,-1634 # 800be1c4 <bcache>
8000282e:	a80fe0ef          	jal	80000aae <acquire>
  for (b = bcache.head.next; b != &bcache.head; b = b->next) {
80002832:	000c3497          	auipc	s1,0xc3
80002836:	7e64a483          	lw	s1,2022(s1) # 800c6018 <bcache+0x7e54>
8000283a:	000c3797          	auipc	a5,0xc3
8000283e:	7ae78793          	addi	a5,a5,1966 # 800c5fe8 <bcache+0x7e24>
80002842:	02f48b63          	beq	s1,a5,80002878 <bread+0x64>
80002846:	873e                	mv	a4,a5
80002848:	a021                	j	80002850 <bread+0x3c>
8000284a:	5884                	lw	s1,48(s1)
8000284c:	02e48663          	beq	s1,a4,80002878 <bread+0x64>
    if (b->dev == dev && b->blockno == blockno) {
80002850:	449c                	lw	a5,8(s1)
80002852:	fef91ce3          	bne	s2,a5,8000284a <bread+0x36>
80002856:	44dc                	lw	a5,12(s1)
80002858:	fef999e3          	bne	s3,a5,8000284a <bread+0x36>
      b->refcnt++;
8000285c:	549c                	lw	a5,40(s1)
8000285e:	0785                	addi	a5,a5,1
80002860:	d49c                	sw	a5,40(s1)
      release(&bcache.lock);
80002862:	000bc517          	auipc	a0,0xbc
80002866:	96250513          	addi	a0,a0,-1694 # 800be1c4 <bcache>
8000286a:	ac8fe0ef          	jal	80000b32 <release>
      acquiresleep(&b->lock);
8000286e:	01048513          	addi	a0,s1,16
80002872:	1ec010ef          	jal	80003a5e <acquiresleep>
      return b;
80002876:	a889                	j	800028c8 <bread+0xb4>
  for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
80002878:	000c3497          	auipc	s1,0xc3
8000287c:	79c4a483          	lw	s1,1948(s1) # 800c6014 <bcache+0x7e50>
80002880:	000c3797          	auipc	a5,0xc3
80002884:	76878793          	addi	a5,a5,1896 # 800c5fe8 <bcache+0x7e24>
80002888:	00f48863          	beq	s1,a5,80002898 <bread+0x84>
8000288c:	873e                	mv	a4,a5
    if (b->refcnt == 0) {
8000288e:	549c                	lw	a5,40(s1)
80002890:	cb91                	beqz	a5,800028a4 <bread+0x90>
  for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
80002892:	54c4                	lw	s1,44(s1)
80002894:	fee49de3          	bne	s1,a4,8000288e <bread+0x7a>
  panic("bget: no buffers");
80002898:	00009517          	auipc	a0,0x9
8000289c:	b4850513          	addi	a0,a0,-1208 # 8000b3e0 <etext+0x3e0>
800028a0:	f19fd0ef          	jal	800007b8 <panic>
      b->dev = dev;
800028a4:	0124a423          	sw	s2,8(s1)
      b->blockno = blockno;
800028a8:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
800028ac:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
800028b0:	4785                	li	a5,1
800028b2:	d49c                	sw	a5,40(s1)
      release(&bcache.lock);
800028b4:	000bc517          	auipc	a0,0xbc
800028b8:	91050513          	addi	a0,a0,-1776 # 800be1c4 <bcache>
800028bc:	a76fe0ef          	jal	80000b32 <release>
      acquiresleep(&b->lock);
800028c0:	01048513          	addi	a0,s1,16
800028c4:	19a010ef          	jal	80003a5e <acquiresleep>
  struct buf *b;

  b = bget(dev, blockno);
  if (!b->valid) {
800028c8:	409c                	lw	a5,0(s1)
800028ca:	cb89                	beqz	a5,800028dc <bread+0xc8>
    virtio_disk_rw(b, 0);
    b->valid = 1;
  }
  return b;
}
800028cc:	8526                	mv	a0,s1
800028ce:	40f2                	lw	ra,28(sp)
800028d0:	4462                	lw	s0,24(sp)
800028d2:	44d2                	lw	s1,20(sp)
800028d4:	4942                	lw	s2,16(sp)
800028d6:	49b2                	lw	s3,12(sp)
800028d8:	6105                	addi	sp,sp,32
800028da:	8082                	ret
    virtio_disk_rw(b, 0);
800028dc:	4581                	li	a1,0
800028de:	8526                	mv	a0,s1
800028e0:	7ae060ef          	jal	8000908e <virtio_disk_rw>
    b->valid = 1;
800028e4:	4785                	li	a5,1
800028e6:	c09c                	sw	a5,0(s1)
  return b;
800028e8:	b7d5                	j	800028cc <bread+0xb8>

800028ea <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
800028ea:	1141                	addi	sp,sp,-16
800028ec:	c606                	sw	ra,12(sp)
800028ee:	c422                	sw	s0,8(sp)
800028f0:	c226                	sw	s1,4(sp)
800028f2:	0800                	addi	s0,sp,16
800028f4:	84aa                	mv	s1,a0
  if (!holdingsleep(&b->lock))
800028f6:	0541                	addi	a0,a0,16
800028f8:	1e4010ef          	jal	80003adc <holdingsleep>
800028fc:	c911                	beqz	a0,80002910 <bwrite+0x26>
    panic("bwrite");
  virtio_disk_rw(b, 1);
800028fe:	4585                	li	a1,1
80002900:	8526                	mv	a0,s1
80002902:	78c060ef          	jal	8000908e <virtio_disk_rw>
}
80002906:	40b2                	lw	ra,12(sp)
80002908:	4422                	lw	s0,8(sp)
8000290a:	4492                	lw	s1,4(sp)
8000290c:	0141                	addi	sp,sp,16
8000290e:	8082                	ret
    panic("bwrite");
80002910:	00009517          	auipc	a0,0x9
80002914:	ae450513          	addi	a0,a0,-1308 # 8000b3f4 <etext+0x3f4>
80002918:	ea1fd0ef          	jal	800007b8 <panic>

8000291c <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
8000291c:	1141                	addi	sp,sp,-16
8000291e:	c606                	sw	ra,12(sp)
80002920:	c422                	sw	s0,8(sp)
80002922:	c226                	sw	s1,4(sp)
80002924:	c04a                	sw	s2,0(sp)
80002926:	0800                	addi	s0,sp,16
80002928:	84aa                	mv	s1,a0
  if (!holdingsleep(&b->lock))
8000292a:	01050913          	addi	s2,a0,16
8000292e:	854a                	mv	a0,s2
80002930:	1ac010ef          	jal	80003adc <holdingsleep>
80002934:	c125                	beqz	a0,80002994 <brelse+0x78>
    panic("brelse");

  releasesleep(&b->lock);
80002936:	854a                	mv	a0,s2
80002938:	16c010ef          	jal	80003aa4 <releasesleep>

  acquire(&bcache.lock);
8000293c:	000bc517          	auipc	a0,0xbc
80002940:	88850513          	addi	a0,a0,-1912 # 800be1c4 <bcache>
80002944:	96afe0ef          	jal	80000aae <acquire>
  b->refcnt--;
80002948:	549c                	lw	a5,40(s1)
8000294a:	17fd                	addi	a5,a5,-1
8000294c:	d49c                	sw	a5,40(s1)
  if (b->refcnt == 0) {
8000294e:	e79d                	bnez	a5,8000297c <brelse+0x60>
    // no one is waiting for it.
    b->next->prev = b->prev;
80002950:	5898                	lw	a4,48(s1)
80002952:	54dc                	lw	a5,44(s1)
80002954:	d75c                	sw	a5,44(a4)
    b->prev->next = b->next;
80002956:	5898                	lw	a4,48(s1)
80002958:	db98                	sw	a4,48(a5)
    b->next = bcache.head.next;
8000295a:	000c4797          	auipc	a5,0xc4
8000295e:	86a78793          	addi	a5,a5,-1942 # 800c61c4 <bcache+0x8000>
80002962:	e547a703          	lw	a4,-428(a5)
80002966:	d898                	sw	a4,48(s1)
    b->prev = &bcache.head;
80002968:	000c3717          	auipc	a4,0xc3
8000296c:	68070713          	addi	a4,a4,1664 # 800c5fe8 <bcache+0x7e24>
80002970:	d4d8                	sw	a4,44(s1)
    bcache.head.next->prev = b;
80002972:	e547a703          	lw	a4,-428(a5)
80002976:	d744                	sw	s1,44(a4)
    bcache.head.next = b;
80002978:	e497aa23          	sw	s1,-428(a5)
  }

  release(&bcache.lock);
8000297c:	000bc517          	auipc	a0,0xbc
80002980:	84850513          	addi	a0,a0,-1976 # 800be1c4 <bcache>
80002984:	9aefe0ef          	jal	80000b32 <release>
}
80002988:	40b2                	lw	ra,12(sp)
8000298a:	4422                	lw	s0,8(sp)
8000298c:	4492                	lw	s1,4(sp)
8000298e:	4902                	lw	s2,0(sp)
80002990:	0141                	addi	sp,sp,16
80002992:	8082                	ret
    panic("brelse");
80002994:	00009517          	auipc	a0,0x9
80002998:	a6850513          	addi	a0,a0,-1432 # 8000b3fc <etext+0x3fc>
8000299c:	e1dfd0ef          	jal	800007b8 <panic>

800029a0 <bpin>:

void
bpin(struct buf *b)
{
800029a0:	1141                	addi	sp,sp,-16
800029a2:	c606                	sw	ra,12(sp)
800029a4:	c422                	sw	s0,8(sp)
800029a6:	c226                	sw	s1,4(sp)
800029a8:	0800                	addi	s0,sp,16
800029aa:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
800029ac:	000bc517          	auipc	a0,0xbc
800029b0:	81850513          	addi	a0,a0,-2024 # 800be1c4 <bcache>
800029b4:	8fafe0ef          	jal	80000aae <acquire>
  b->refcnt++;
800029b8:	549c                	lw	a5,40(s1)
800029ba:	0785                	addi	a5,a5,1
800029bc:	d49c                	sw	a5,40(s1)
  release(&bcache.lock);
800029be:	000bc517          	auipc	a0,0xbc
800029c2:	80650513          	addi	a0,a0,-2042 # 800be1c4 <bcache>
800029c6:	96cfe0ef          	jal	80000b32 <release>
}
800029ca:	40b2                	lw	ra,12(sp)
800029cc:	4422                	lw	s0,8(sp)
800029ce:	4492                	lw	s1,4(sp)
800029d0:	0141                	addi	sp,sp,16
800029d2:	8082                	ret

800029d4 <bunpin>:

void
bunpin(struct buf *b)
{
800029d4:	1141                	addi	sp,sp,-16
800029d6:	c606                	sw	ra,12(sp)
800029d8:	c422                	sw	s0,8(sp)
800029da:	c226                	sw	s1,4(sp)
800029dc:	0800                	addi	s0,sp,16
800029de:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
800029e0:	000bb517          	auipc	a0,0xbb
800029e4:	7e450513          	addi	a0,a0,2020 # 800be1c4 <bcache>
800029e8:	8c6fe0ef          	jal	80000aae <acquire>
  b->refcnt--;
800029ec:	549c                	lw	a5,40(s1)
800029ee:	17fd                	addi	a5,a5,-1
800029f0:	d49c                	sw	a5,40(s1)
  release(&bcache.lock);
800029f2:	000bb517          	auipc	a0,0xbb
800029f6:	7d250513          	addi	a0,a0,2002 # 800be1c4 <bcache>
800029fa:	938fe0ef          	jal	80000b32 <release>
}
800029fe:	40b2                	lw	ra,12(sp)
80002a00:	4422                	lw	s0,8(sp)
80002a02:	4492                	lw	s1,4(sp)
80002a04:	0141                	addi	sp,sp,16
80002a06:	8082                	ret

80002a08 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80002a08:	1141                	addi	sp,sp,-16
80002a0a:	c606                	sw	ra,12(sp)
80002a0c:	c422                	sw	s0,8(sp)
80002a0e:	c226                	sw	s1,4(sp)
80002a10:	c04a                	sw	s2,0(sp)
80002a12:	0800                	addi	s0,sp,16
80002a14:	84ae                	mv	s1,a1
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80002a16:	81b5                	srli	a1,a1,0xd
80002a18:	000c4797          	auipc	a5,0xc4
80002a1c:	a207a783          	lw	a5,-1504(a5) # 800c6438 <sb+0x1c>
80002a20:	95be                	add	a1,a1,a5
80002a22:	df3ff0ef          	jal	80002814 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
80002a26:	0074f713          	andi	a4,s1,7
80002a2a:	4785                	li	a5,1
80002a2c:	00e797b3          	sll	a5,a5,a4
  bi = b % BPB;
80002a30:	04ce                	slli	s1,s1,0x13
  if ((bp->data[bi / 8] & m) == 0)
80002a32:	80d9                	srli	s1,s1,0x16
80002a34:	00950733          	add	a4,a0,s1
80002a38:	03474703          	lbu	a4,52(a4)
80002a3c:	00f776b3          	and	a3,a4,a5
80002a40:	c29d                	beqz	a3,80002a66 <bfree+0x5e>
80002a42:	892a                	mv	s2,a0
    panic("freeing free block");
  bp->data[bi / 8] &= ~m;
80002a44:	94aa                	add	s1,s1,a0
80002a46:	fff7c793          	not	a5,a5
80002a4a:	8f7d                	and	a4,a4,a5
80002a4c:	02e48a23          	sb	a4,52(s1)
  log_write(bp);
80002a50:	717000ef          	jal	80003966 <log_write>
  brelse(bp);
80002a54:	854a                	mv	a0,s2
80002a56:	ec7ff0ef          	jal	8000291c <brelse>
}
80002a5a:	40b2                	lw	ra,12(sp)
80002a5c:	4422                	lw	s0,8(sp)
80002a5e:	4492                	lw	s1,4(sp)
80002a60:	4902                	lw	s2,0(sp)
80002a62:	0141                	addi	sp,sp,16
80002a64:	8082                	ret
    panic("freeing free block");
80002a66:	00009517          	auipc	a0,0x9
80002a6a:	99e50513          	addi	a0,a0,-1634 # 8000b404 <etext+0x404>
80002a6e:	d4bfd0ef          	jal	800007b8 <panic>

80002a72 <balloc>:
{
80002a72:	7179                	addi	sp,sp,-48
80002a74:	d606                	sw	ra,44(sp)
80002a76:	d422                	sw	s0,40(sp)
80002a78:	d226                	sw	s1,36(sp)
80002a7a:	1800                	addi	s0,sp,48
  for (b = 0; b < sb.size; b += BPB) {
80002a7c:	000c4797          	auipc	a5,0xc4
80002a80:	9a47a783          	lw	a5,-1628(a5) # 800c6420 <sb+0x4>
80002a84:	0e078463          	beqz	a5,80002b6c <balloc+0xfa>
80002a88:	d04a                	sw	s2,32(sp)
80002a8a:	ce4e                	sw	s3,28(sp)
80002a8c:	cc52                	sw	s4,24(sp)
80002a8e:	ca56                	sw	s5,20(sp)
80002a90:	c85a                	sw	s6,16(sp)
80002a92:	c65e                	sw	s7,12(sp)
80002a94:	c462                	sw	s8,8(sp)
80002a96:	8baa                	mv	s7,a0
80002a98:	4a81                	li	s5,0
    bp = bread(dev, BBLOCK(b, sb));
80002a9a:	6989                	lui	s3,0x2
80002a9c:	fff98c13          	addi	s8,s3,-1 # 1fff <_entry-0x7fffe001>
80002aa0:	000c4b17          	auipc	s6,0xc4
80002aa4:	97cb0b13          	addi	s6,s6,-1668 # 800c641c <sb>
      m = 1 << (bi % 8);
80002aa8:	4a05                	li	s4,1
80002aaa:	a095                	j	80002b0e <balloc+0x9c>
        bp->data[bi / 8] |= m;           // Mark block in use.
80002aac:	97ca                	add	a5,a5,s2
80002aae:	8e55                	or	a2,a2,a3
80002ab0:	02c78a23          	sb	a2,52(a5)
        log_write(bp);
80002ab4:	854a                	mv	a0,s2
80002ab6:	6b1000ef          	jal	80003966 <log_write>
        brelse(bp);
80002aba:	854a                	mv	a0,s2
80002abc:	e61ff0ef          	jal	8000291c <brelse>
  bp = bread(dev, bno);
80002ac0:	85a6                	mv	a1,s1
80002ac2:	855e                	mv	a0,s7
80002ac4:	d51ff0ef          	jal	80002814 <bread>
80002ac8:	892a                	mv	s2,a0
  memset(bp->data, 0, BSIZE);
80002aca:	40000613          	li	a2,1024
80002ace:	4581                	li	a1,0
80002ad0:	03450513          	addi	a0,a0,52
80002ad4:	890fe0ef          	jal	80000b64 <memset>
  log_write(bp);
80002ad8:	854a                	mv	a0,s2
80002ada:	68d000ef          	jal	80003966 <log_write>
  brelse(bp);
80002ade:	854a                	mv	a0,s2
80002ae0:	e3dff0ef          	jal	8000291c <brelse>
}
80002ae4:	5902                	lw	s2,32(sp)
80002ae6:	49f2                	lw	s3,28(sp)
80002ae8:	4a62                	lw	s4,24(sp)
80002aea:	4ad2                	lw	s5,20(sp)
80002aec:	4b42                	lw	s6,16(sp)
80002aee:	4bb2                	lw	s7,12(sp)
80002af0:	4c22                	lw	s8,8(sp)
}
80002af2:	8526                	mv	a0,s1
80002af4:	50b2                	lw	ra,44(sp)
80002af6:	5422                	lw	s0,40(sp)
80002af8:	5492                	lw	s1,36(sp)
80002afa:	6145                	addi	sp,sp,48
80002afc:	8082                	ret
    brelse(bp);
80002afe:	854a                	mv	a0,s2
80002b00:	e1dff0ef          	jal	8000291c <brelse>
  for (b = 0; b < sb.size; b += BPB) {
80002b04:	9ace                	add	s5,s5,s3
80002b06:	004b2783          	lw	a5,4(s6)
80002b0a:	04fafa63          	bgeu	s5,a5,80002b5e <balloc+0xec>
    bp = bread(dev, BBLOCK(b, sb));
80002b0e:	41fad793          	srai	a5,s5,0x1f
80002b12:	0187f7b3          	and	a5,a5,s8
80002b16:	97d6                	add	a5,a5,s5
80002b18:	87b5                	srai	a5,a5,0xd
80002b1a:	01cb2583          	lw	a1,28(s6)
80002b1e:	95be                	add	a1,a1,a5
80002b20:	855e                	mv	a0,s7
80002b22:	cf3ff0ef          	jal	80002814 <bread>
80002b26:	892a                	mv	s2,a0
    for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
80002b28:	004b2503          	lw	a0,4(s6)
80002b2c:	84d6                	mv	s1,s5
80002b2e:	4701                	li	a4,0
80002b30:	fca4f7e3          	bgeu	s1,a0,80002afe <balloc+0x8c>
      m = 1 << (bi % 8);
80002b34:	00777693          	andi	a3,a4,7
80002b38:	00da16b3          	sll	a3,s4,a3
      if ((bp->data[bi / 8] & m) == 0) { // Is block free?
80002b3c:	41f75793          	srai	a5,a4,0x1f
80002b40:	8b9d                	andi	a5,a5,7
80002b42:	97ba                	add	a5,a5,a4
80002b44:	878d                	srai	a5,a5,0x3
80002b46:	00f90633          	add	a2,s2,a5
80002b4a:	03464603          	lbu	a2,52(a2)
80002b4e:	00d675b3          	and	a1,a2,a3
80002b52:	dda9                	beqz	a1,80002aac <balloc+0x3a>
    for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
80002b54:	0705                	addi	a4,a4,1
80002b56:	0485                	addi	s1,s1,1
80002b58:	fd371ce3          	bne	a4,s3,80002b30 <balloc+0xbe>
80002b5c:	b74d                	j	80002afe <balloc+0x8c>
80002b5e:	5902                	lw	s2,32(sp)
80002b60:	49f2                	lw	s3,28(sp)
80002b62:	4a62                	lw	s4,24(sp)
80002b64:	4ad2                	lw	s5,20(sp)
80002b66:	4b42                	lw	s6,16(sp)
80002b68:	4bb2                	lw	s7,12(sp)
80002b6a:	4c22                	lw	s8,8(sp)
  printf("balloc: out of blocks\n");
80002b6c:	00009517          	auipc	a0,0x9
80002b70:	8ac50513          	addi	a0,a0,-1876 # 8000b418 <etext+0x418>
80002b74:	971fd0ef          	jal	800004e4 <printf>
  return 0;
80002b78:	4481                	li	s1,0
80002b7a:	bfa5                	j	80002af2 <balloc+0x80>

80002b7c <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
80002b7c:	1101                	addi	sp,sp,-32
80002b7e:	ce06                	sw	ra,28(sp)
80002b80:	cc22                	sw	s0,24(sp)
80002b82:	ca26                	sw	s1,20(sp)
80002b84:	c84a                	sw	s2,16(sp)
80002b86:	c64e                	sw	s3,12(sp)
80002b88:	1000                	addi	s0,sp,32
80002b8a:	89aa                	mv	s3,a0
  uint addr, *a;
  struct buf *bp;

  if (bn < NDIRECT) {
80002b8c:	47ad                	li	a5,11
80002b8e:	00b7ef63          	bltu	a5,a1,80002bac <bmap+0x30>
    if ((addr = ip->addrs[bn]) == 0) {
80002b92:	058a                	slli	a1,a1,0x2
80002b94:	00b504b3          	add	s1,a0,a1
80002b98:	0344a903          	lw	s2,52(s1)
80002b9c:	04091f63          	bnez	s2,80002bfa <bmap+0x7e>
      addr = balloc(ip->dev);
80002ba0:	4108                	lw	a0,0(a0)
80002ba2:	3dc1                	jal	80002a72 <balloc>
80002ba4:	892a                	mv	s2,a0
      if (addr == 0)
80002ba6:	c931                	beqz	a0,80002bfa <bmap+0x7e>
        return 0;
      ip->addrs[bn] = addr;
80002ba8:	d8c8                	sw	a0,52(s1)
80002baa:	a881                	j	80002bfa <bmap+0x7e>
    }
    return addr;
  }
  bn -= NDIRECT;
80002bac:	ff458493          	addi	s1,a1,-12

  if (bn < NINDIRECT) {
80002bb0:	0ff00793          	li	a5,255
80002bb4:	0697e563          	bltu	a5,s1,80002c1e <bmap+0xa2>
    // Load indirect block, allocating if necessary.
    if ((addr = ip->addrs[NDIRECT]) == 0) {
80002bb8:	06452903          	lw	s2,100(a0)
80002bbc:	00091a63          	bnez	s2,80002bd0 <bmap+0x54>
      addr = balloc(ip->dev);
80002bc0:	4108                	lw	a0,0(a0)
80002bc2:	3d45                	jal	80002a72 <balloc>
80002bc4:	892a                	mv	s2,a0
      if (addr == 0)
80002bc6:	c915                	beqz	a0,80002bfa <bmap+0x7e>
80002bc8:	c452                	sw	s4,8(sp)
        return 0;
      ip->addrs[NDIRECT] = addr;
80002bca:	06a9a223          	sw	a0,100(s3)
80002bce:	a011                	j	80002bd2 <bmap+0x56>
80002bd0:	c452                	sw	s4,8(sp)
    }
    bp = bread(ip->dev, addr);
80002bd2:	85ca                	mv	a1,s2
80002bd4:	0009a503          	lw	a0,0(s3)
80002bd8:	c3dff0ef          	jal	80002814 <bread>
80002bdc:	8a2a                	mv	s4,a0
    a = (uint *)bp->data;
80002bde:	03450793          	addi	a5,a0,52
    if ((addr = a[bn]) == 0) {
80002be2:	00249593          	slli	a1,s1,0x2
80002be6:	00b784b3          	add	s1,a5,a1
80002bea:	0004a903          	lw	s2,0(s1)
80002bee:	00090e63          	beqz	s2,80002c0a <bmap+0x8e>
      if (addr) {
        a[bn] = addr;
        log_write(bp);
      }
    }
    brelse(bp);
80002bf2:	8552                	mv	a0,s4
80002bf4:	d29ff0ef          	jal	8000291c <brelse>
    return addr;
80002bf8:	4a22                	lw	s4,8(sp)
  }

  panic("bmap: out of range");
}
80002bfa:	854a                	mv	a0,s2
80002bfc:	40f2                	lw	ra,28(sp)
80002bfe:	4462                	lw	s0,24(sp)
80002c00:	44d2                	lw	s1,20(sp)
80002c02:	4942                	lw	s2,16(sp)
80002c04:	49b2                	lw	s3,12(sp)
80002c06:	6105                	addi	sp,sp,32
80002c08:	8082                	ret
      addr = balloc(ip->dev);
80002c0a:	0009a503          	lw	a0,0(s3)
80002c0e:	3595                	jal	80002a72 <balloc>
80002c10:	892a                	mv	s2,a0
      if (addr) {
80002c12:	d165                	beqz	a0,80002bf2 <bmap+0x76>
        a[bn] = addr;
80002c14:	c088                	sw	a0,0(s1)
        log_write(bp);
80002c16:	8552                	mv	a0,s4
80002c18:	54f000ef          	jal	80003966 <log_write>
80002c1c:	bfd9                	j	80002bf2 <bmap+0x76>
80002c1e:	c452                	sw	s4,8(sp)
  panic("bmap: out of range");
80002c20:	00009517          	auipc	a0,0x9
80002c24:	81050513          	addi	a0,a0,-2032 # 8000b430 <etext+0x430>
80002c28:	b91fd0ef          	jal	800007b8 <panic>

80002c2c <iget>:
{
80002c2c:	1101                	addi	sp,sp,-32
80002c2e:	ce06                	sw	ra,28(sp)
80002c30:	cc22                	sw	s0,24(sp)
80002c32:	ca26                	sw	s1,20(sp)
80002c34:	c84a                	sw	s2,16(sp)
80002c36:	c64e                	sw	s3,12(sp)
80002c38:	c452                	sw	s4,8(sp)
80002c3a:	1000                	addi	s0,sp,32
80002c3c:	89aa                	mv	s3,a0
80002c3e:	8a2e                	mv	s4,a1
  acquire(&itable.lock);
80002c40:	000c3517          	auipc	a0,0xc3
80002c44:	7fc50513          	addi	a0,a0,2044 # 800c643c <itable>
80002c48:	e67fd0ef          	jal	80000aae <acquire>
  empty = 0;
80002c4c:	4901                	li	s2,0
  for (ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++) {
80002c4e:	000c3497          	auipc	s1,0xc3
80002c52:	7fa48493          	addi	s1,s1,2042 # 800c6448 <itable+0xc>
80002c56:	000c5697          	auipc	a3,0xc5
80002c5a:	c4268693          	addi	a3,a3,-958 # 800c7898 <log>
80002c5e:	a039                	j	80002c6c <iget+0x40>
    if (empty == 0 && ip->ref == 0) // Remember empty slot.
80002c60:	02090963          	beqz	s2,80002c92 <iget+0x66>
  for (ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++) {
80002c64:	06848493          	addi	s1,s1,104
80002c68:	02d48863          	beq	s1,a3,80002c98 <iget+0x6c>
    if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
80002c6c:	449c                	lw	a5,8(s1)
80002c6e:	fef059e3          	blez	a5,80002c60 <iget+0x34>
80002c72:	4098                	lw	a4,0(s1)
80002c74:	ff3716e3          	bne	a4,s3,80002c60 <iget+0x34>
80002c78:	40d8                	lw	a4,4(s1)
80002c7a:	ff4713e3          	bne	a4,s4,80002c60 <iget+0x34>
      ip->ref++;
80002c7e:	0785                	addi	a5,a5,1
80002c80:	c49c                	sw	a5,8(s1)
      release(&itable.lock);
80002c82:	000c3517          	auipc	a0,0xc3
80002c86:	7ba50513          	addi	a0,a0,1978 # 800c643c <itable>
80002c8a:	ea9fd0ef          	jal	80000b32 <release>
      return ip;
80002c8e:	8926                	mv	s2,s1
80002c90:	a02d                	j	80002cba <iget+0x8e>
    if (empty == 0 && ip->ref == 0) // Remember empty slot.
80002c92:	fbe9                	bnez	a5,80002c64 <iget+0x38>
      empty = ip;
80002c94:	8926                	mv	s2,s1
80002c96:	b7f9                	j	80002c64 <iget+0x38>
  if (empty == 0)
80002c98:	02090a63          	beqz	s2,80002ccc <iget+0xa0>
  ip->dev = dev;
80002c9c:	01392023          	sw	s3,0(s2)
  ip->inum = inum;
80002ca0:	01492223          	sw	s4,4(s2)
  ip->ref = 1;
80002ca4:	4785                	li	a5,1
80002ca6:	00f92423          	sw	a5,8(s2)
  ip->valid = 0;
80002caa:	02092223          	sw	zero,36(s2)
  release(&itable.lock);
80002cae:	000c3517          	auipc	a0,0xc3
80002cb2:	78e50513          	addi	a0,a0,1934 # 800c643c <itable>
80002cb6:	e7dfd0ef          	jal	80000b32 <release>
}
80002cba:	854a                	mv	a0,s2
80002cbc:	40f2                	lw	ra,28(sp)
80002cbe:	4462                	lw	s0,24(sp)
80002cc0:	44d2                	lw	s1,20(sp)
80002cc2:	4942                	lw	s2,16(sp)
80002cc4:	49b2                	lw	s3,12(sp)
80002cc6:	4a22                	lw	s4,8(sp)
80002cc8:	6105                	addi	sp,sp,32
80002cca:	8082                	ret
    panic("iget: no inodes");
80002ccc:	00008517          	auipc	a0,0x8
80002cd0:	77850513          	addi	a0,a0,1912 # 8000b444 <etext+0x444>
80002cd4:	ae5fd0ef          	jal	800007b8 <panic>

80002cd8 <iinit>:
{
80002cd8:	1101                	addi	sp,sp,-32
80002cda:	ce06                	sw	ra,28(sp)
80002cdc:	cc22                	sw	s0,24(sp)
80002cde:	ca26                	sw	s1,20(sp)
80002ce0:	c84a                	sw	s2,16(sp)
80002ce2:	c64e                	sw	s3,12(sp)
80002ce4:	1000                	addi	s0,sp,32
  initlock(&itable.lock, "itable");
80002ce6:	00008597          	auipc	a1,0x8
80002cea:	76e58593          	addi	a1,a1,1902 # 8000b454 <etext+0x454>
80002cee:	000c3517          	auipc	a0,0xc3
80002cf2:	74e50513          	addi	a0,a0,1870 # 800c643c <itable>
80002cf6:	d39fd0ef          	jal	80000a2e <initlock>
  for (i = 0; i < NINODE; i++) {
80002cfa:	000c3497          	auipc	s1,0xc3
80002cfe:	75a48493          	addi	s1,s1,1882 # 800c6454 <itable+0x18>
80002d02:	000c5997          	auipc	s3,0xc5
80002d06:	ba298993          	addi	s3,s3,-1118 # 800c78a4 <log+0xc>
    initsleeplock(&itable.inode[i].lock, "inode");
80002d0a:	00008917          	auipc	s2,0x8
80002d0e:	75290913          	addi	s2,s2,1874 # 8000b45c <etext+0x45c>
80002d12:	85ca                	mv	a1,s2
80002d14:	8526                	mv	a0,s1
80002d16:	513000ef          	jal	80003a28 <initsleeplock>
  for (i = 0; i < NINODE; i++) {
80002d1a:	06848493          	addi	s1,s1,104
80002d1e:	ff349ae3          	bne	s1,s3,80002d12 <iinit+0x3a>
}
80002d22:	40f2                	lw	ra,28(sp)
80002d24:	4462                	lw	s0,24(sp)
80002d26:	44d2                	lw	s1,20(sp)
80002d28:	4942                	lw	s2,16(sp)
80002d2a:	49b2                	lw	s3,12(sp)
80002d2c:	6105                	addi	sp,sp,32
80002d2e:	8082                	ret

80002d30 <ialloc>:
{
80002d30:	1101                	addi	sp,sp,-32
80002d32:	ce06                	sw	ra,28(sp)
80002d34:	cc22                	sw	s0,24(sp)
80002d36:	1000                	addi	s0,sp,32
  for (inum = 1; inum < sb.ninodes; inum++) {
80002d38:	000c3717          	auipc	a4,0xc3
80002d3c:	6f072703          	lw	a4,1776(a4) # 800c6428 <sb+0xc>
80002d40:	4785                	li	a5,1
80002d42:	04e7fe63          	bgeu	a5,a4,80002d9e <ialloc+0x6e>
80002d46:	ca26                	sw	s1,20(sp)
80002d48:	c84a                	sw	s2,16(sp)
80002d4a:	c64e                	sw	s3,12(sp)
80002d4c:	c452                	sw	s4,8(sp)
80002d4e:	c256                	sw	s5,4(sp)
80002d50:	c05a                	sw	s6,0(sp)
80002d52:	8aaa                	mv	s5,a0
80002d54:	8b2e                	mv	s6,a1
80002d56:	4905                	li	s2,1
    bp = bread(dev, IBLOCK(inum, sb));
80002d58:	000c3a17          	auipc	s4,0xc3
80002d5c:	6c4a0a13          	addi	s4,s4,1732 # 800c641c <sb>
80002d60:	00495593          	srli	a1,s2,0x4
80002d64:	018a2783          	lw	a5,24(s4)
80002d68:	95be                	add	a1,a1,a5
80002d6a:	8556                	mv	a0,s5
80002d6c:	aa9ff0ef          	jal	80002814 <bread>
80002d70:	84aa                	mv	s1,a0
    dip = (struct dinode *)bp->data + inum % IPB;
80002d72:	03450993          	addi	s3,a0,52
80002d76:	00f97793          	andi	a5,s2,15
80002d7a:	079a                	slli	a5,a5,0x6
80002d7c:	99be                	add	s3,s3,a5
    if (dip->type == 0) { // a free inode
80002d7e:	00099783          	lh	a5,0(s3)
80002d82:	cb8d                	beqz	a5,80002db4 <ialloc+0x84>
    brelse(bp);
80002d84:	b99ff0ef          	jal	8000291c <brelse>
  for (inum = 1; inum < sb.ninodes; inum++) {
80002d88:	0905                	addi	s2,s2,1
80002d8a:	00ca2783          	lw	a5,12(s4)
80002d8e:	fcf969e3          	bltu	s2,a5,80002d60 <ialloc+0x30>
80002d92:	44d2                	lw	s1,20(sp)
80002d94:	4942                	lw	s2,16(sp)
80002d96:	49b2                	lw	s3,12(sp)
80002d98:	4a22                	lw	s4,8(sp)
80002d9a:	4a92                	lw	s5,4(sp)
80002d9c:	4b02                	lw	s6,0(sp)
  printf("ialloc: no inodes\n");
80002d9e:	00008517          	auipc	a0,0x8
80002da2:	6c650513          	addi	a0,a0,1734 # 8000b464 <etext+0x464>
80002da6:	f3efd0ef          	jal	800004e4 <printf>
  return 0;
80002daa:	4501                	li	a0,0
}
80002dac:	40f2                	lw	ra,28(sp)
80002dae:	4462                	lw	s0,24(sp)
80002db0:	6105                	addi	sp,sp,32
80002db2:	8082                	ret
      memset(dip, 0, sizeof(*dip));
80002db4:	04000613          	li	a2,64
80002db8:	4581                	li	a1,0
80002dba:	854e                	mv	a0,s3
80002dbc:	da9fd0ef          	jal	80000b64 <memset>
      dip->type = type;
80002dc0:	01699023          	sh	s6,0(s3)
      log_write(bp); // mark it allocated on the disk
80002dc4:	8526                	mv	a0,s1
80002dc6:	3a1000ef          	jal	80003966 <log_write>
      brelse(bp);
80002dca:	8526                	mv	a0,s1
80002dcc:	b51ff0ef          	jal	8000291c <brelse>
      return iget(dev, inum);
80002dd0:	85ca                	mv	a1,s2
80002dd2:	8556                	mv	a0,s5
80002dd4:	3da1                	jal	80002c2c <iget>
80002dd6:	44d2                	lw	s1,20(sp)
80002dd8:	4942                	lw	s2,16(sp)
80002dda:	49b2                	lw	s3,12(sp)
80002ddc:	4a22                	lw	s4,8(sp)
80002dde:	4a92                	lw	s5,4(sp)
80002de0:	4b02                	lw	s6,0(sp)
80002de2:	b7e9                	j	80002dac <ialloc+0x7c>

80002de4 <iupdate>:
{
80002de4:	1141                	addi	sp,sp,-16
80002de6:	c606                	sw	ra,12(sp)
80002de8:	c422                	sw	s0,8(sp)
80002dea:	c226                	sw	s1,4(sp)
80002dec:	c04a                	sw	s2,0(sp)
80002dee:	0800                	addi	s0,sp,16
80002df0:	84aa                	mv	s1,a0
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80002df2:	415c                	lw	a5,4(a0)
80002df4:	8391                	srli	a5,a5,0x4
80002df6:	000c3597          	auipc	a1,0xc3
80002dfa:	63e5a583          	lw	a1,1598(a1) # 800c6434 <sb+0x18>
80002dfe:	95be                	add	a1,a1,a5
80002e00:	4108                	lw	a0,0(a0)
80002e02:	a13ff0ef          	jal	80002814 <bread>
80002e06:	892a                	mv	s2,a0
  dip = (struct dinode *)bp->data + ip->inum % IPB;
80002e08:	03450793          	addi	a5,a0,52
80002e0c:	40d8                	lw	a4,4(s1)
80002e0e:	8b3d                	andi	a4,a4,15
80002e10:	071a                	slli	a4,a4,0x6
80002e12:	97ba                	add	a5,a5,a4
  dip->type = ip->type;
80002e14:	02849703          	lh	a4,40(s1)
80002e18:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
80002e1c:	02a49703          	lh	a4,42(s1)
80002e20:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
80002e24:	02c49703          	lh	a4,44(s1)
80002e28:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
80002e2c:	02e49703          	lh	a4,46(s1)
80002e30:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
80002e34:	5898                	lw	a4,48(s1)
80002e36:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80002e38:	03400613          	li	a2,52
80002e3c:	03448593          	addi	a1,s1,52
80002e40:	00c78513          	addi	a0,a5,12
80002e44:	d6dfd0ef          	jal	80000bb0 <memmove>
  log_write(bp);
80002e48:	854a                	mv	a0,s2
80002e4a:	31d000ef          	jal	80003966 <log_write>
  brelse(bp);
80002e4e:	854a                	mv	a0,s2
80002e50:	acdff0ef          	jal	8000291c <brelse>
}
80002e54:	40b2                	lw	ra,12(sp)
80002e56:	4422                	lw	s0,8(sp)
80002e58:	4492                	lw	s1,4(sp)
80002e5a:	4902                	lw	s2,0(sp)
80002e5c:	0141                	addi	sp,sp,16
80002e5e:	8082                	ret

80002e60 <idup>:
{
80002e60:	1141                	addi	sp,sp,-16
80002e62:	c606                	sw	ra,12(sp)
80002e64:	c422                	sw	s0,8(sp)
80002e66:	c226                	sw	s1,4(sp)
80002e68:	0800                	addi	s0,sp,16
80002e6a:	84aa                	mv	s1,a0
  acquire(&itable.lock);
80002e6c:	000c3517          	auipc	a0,0xc3
80002e70:	5d050513          	addi	a0,a0,1488 # 800c643c <itable>
80002e74:	c3bfd0ef          	jal	80000aae <acquire>
  ip->ref++;
80002e78:	449c                	lw	a5,8(s1)
80002e7a:	0785                	addi	a5,a5,1
80002e7c:	c49c                	sw	a5,8(s1)
  release(&itable.lock);
80002e7e:	000c3517          	auipc	a0,0xc3
80002e82:	5be50513          	addi	a0,a0,1470 # 800c643c <itable>
80002e86:	cadfd0ef          	jal	80000b32 <release>
}
80002e8a:	8526                	mv	a0,s1
80002e8c:	40b2                	lw	ra,12(sp)
80002e8e:	4422                	lw	s0,8(sp)
80002e90:	4492                	lw	s1,4(sp)
80002e92:	0141                	addi	sp,sp,16
80002e94:	8082                	ret

80002e96 <ilock>:
{
80002e96:	1141                	addi	sp,sp,-16
80002e98:	c606                	sw	ra,12(sp)
80002e9a:	c422                	sw	s0,8(sp)
80002e9c:	c226                	sw	s1,4(sp)
80002e9e:	0800                	addi	s0,sp,16
  if (ip == 0 || ip->ref < 1)
80002ea0:	cd19                	beqz	a0,80002ebe <ilock+0x28>
80002ea2:	84aa                	mv	s1,a0
80002ea4:	451c                	lw	a5,8(a0)
80002ea6:	00f05c63          	blez	a5,80002ebe <ilock+0x28>
  acquiresleep(&ip->lock);
80002eaa:	0531                	addi	a0,a0,12
80002eac:	3b3000ef          	jal	80003a5e <acquiresleep>
  if (ip->valid == 0) {
80002eb0:	50dc                	lw	a5,36(s1)
80002eb2:	cf89                	beqz	a5,80002ecc <ilock+0x36>
}
80002eb4:	40b2                	lw	ra,12(sp)
80002eb6:	4422                	lw	s0,8(sp)
80002eb8:	4492                	lw	s1,4(sp)
80002eba:	0141                	addi	sp,sp,16
80002ebc:	8082                	ret
80002ebe:	c04a                	sw	s2,0(sp)
    panic("ilock");
80002ec0:	00008517          	auipc	a0,0x8
80002ec4:	5b850513          	addi	a0,a0,1464 # 8000b478 <etext+0x478>
80002ec8:	8f1fd0ef          	jal	800007b8 <panic>
80002ecc:	c04a                	sw	s2,0(sp)
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80002ece:	40dc                	lw	a5,4(s1)
80002ed0:	8391                	srli	a5,a5,0x4
80002ed2:	000c3597          	auipc	a1,0xc3
80002ed6:	5625a583          	lw	a1,1378(a1) # 800c6434 <sb+0x18>
80002eda:	95be                	add	a1,a1,a5
80002edc:	4088                	lw	a0,0(s1)
80002ede:	937ff0ef          	jal	80002814 <bread>
80002ee2:	892a                	mv	s2,a0
    dip = (struct dinode *)bp->data + ip->inum % IPB;
80002ee4:	03450593          	addi	a1,a0,52
80002ee8:	40dc                	lw	a5,4(s1)
80002eea:	8bbd                	andi	a5,a5,15
80002eec:	079a                	slli	a5,a5,0x6
80002eee:	95be                	add	a1,a1,a5
    ip->type = dip->type;
80002ef0:	00059783          	lh	a5,0(a1)
80002ef4:	02f49423          	sh	a5,40(s1)
    ip->major = dip->major;
80002ef8:	00259783          	lh	a5,2(a1)
80002efc:	02f49523          	sh	a5,42(s1)
    ip->minor = dip->minor;
80002f00:	00459783          	lh	a5,4(a1)
80002f04:	02f49623          	sh	a5,44(s1)
    ip->nlink = dip->nlink;
80002f08:	00659783          	lh	a5,6(a1)
80002f0c:	02f49723          	sh	a5,46(s1)
    ip->size = dip->size;
80002f10:	459c                	lw	a5,8(a1)
80002f12:	d89c                	sw	a5,48(s1)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80002f14:	03400613          	li	a2,52
80002f18:	05b1                	addi	a1,a1,12
80002f1a:	03448513          	addi	a0,s1,52
80002f1e:	c93fd0ef          	jal	80000bb0 <memmove>
    brelse(bp);
80002f22:	854a                	mv	a0,s2
80002f24:	9f9ff0ef          	jal	8000291c <brelse>
    ip->valid = 1;
80002f28:	4785                	li	a5,1
80002f2a:	d0dc                	sw	a5,36(s1)
    if (ip->type == 0)
80002f2c:	02849783          	lh	a5,40(s1)
80002f30:	c399                	beqz	a5,80002f36 <ilock+0xa0>
80002f32:	4902                	lw	s2,0(sp)
80002f34:	b741                	j	80002eb4 <ilock+0x1e>
      panic("ilock: no type");
80002f36:	00008517          	auipc	a0,0x8
80002f3a:	54a50513          	addi	a0,a0,1354 # 8000b480 <etext+0x480>
80002f3e:	87bfd0ef          	jal	800007b8 <panic>

80002f42 <iunlock>:
{
80002f42:	1141                	addi	sp,sp,-16
80002f44:	c606                	sw	ra,12(sp)
80002f46:	c422                	sw	s0,8(sp)
80002f48:	c226                	sw	s1,4(sp)
80002f4a:	c04a                	sw	s2,0(sp)
80002f4c:	0800                	addi	s0,sp,16
  if (ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80002f4e:	c505                	beqz	a0,80002f76 <iunlock+0x34>
80002f50:	84aa                	mv	s1,a0
80002f52:	00c50913          	addi	s2,a0,12
80002f56:	854a                	mv	a0,s2
80002f58:	385000ef          	jal	80003adc <holdingsleep>
80002f5c:	cd09                	beqz	a0,80002f76 <iunlock+0x34>
80002f5e:	449c                	lw	a5,8(s1)
80002f60:	00f05b63          	blez	a5,80002f76 <iunlock+0x34>
  releasesleep(&ip->lock);
80002f64:	854a                	mv	a0,s2
80002f66:	33f000ef          	jal	80003aa4 <releasesleep>
}
80002f6a:	40b2                	lw	ra,12(sp)
80002f6c:	4422                	lw	s0,8(sp)
80002f6e:	4492                	lw	s1,4(sp)
80002f70:	4902                	lw	s2,0(sp)
80002f72:	0141                	addi	sp,sp,16
80002f74:	8082                	ret
    panic("iunlock");
80002f76:	00008517          	auipc	a0,0x8
80002f7a:	51a50513          	addi	a0,a0,1306 # 8000b490 <etext+0x490>
80002f7e:	83bfd0ef          	jal	800007b8 <panic>

80002f82 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
80002f82:	1101                	addi	sp,sp,-32
80002f84:	ce06                	sw	ra,28(sp)
80002f86:	cc22                	sw	s0,24(sp)
80002f88:	ca26                	sw	s1,20(sp)
80002f8a:	c84a                	sw	s2,16(sp)
80002f8c:	c64e                	sw	s3,12(sp)
80002f8e:	1000                	addi	s0,sp,32
80002f90:	89aa                	mv	s3,a0
  int i, j;
  struct buf *bp;
  uint *a;

  for (i = 0; i < NDIRECT; i++) {
80002f92:	03450493          	addi	s1,a0,52
80002f96:	06450913          	addi	s2,a0,100
80002f9a:	a021                	j	80002fa2 <itrunc+0x20>
80002f9c:	0491                	addi	s1,s1,4
80002f9e:	01248a63          	beq	s1,s2,80002fb2 <itrunc+0x30>
    if (ip->addrs[i]) {
80002fa2:	408c                	lw	a1,0(s1)
80002fa4:	dde5                	beqz	a1,80002f9c <itrunc+0x1a>
      bfree(ip->dev, ip->addrs[i]);
80002fa6:	0009a503          	lw	a0,0(s3)
80002faa:	3cb9                	jal	80002a08 <bfree>
      ip->addrs[i] = 0;
80002fac:	0004a023          	sw	zero,0(s1)
80002fb0:	b7f5                	j	80002f9c <itrunc+0x1a>
    }
  }

  if (ip->addrs[NDIRECT]) {
80002fb2:	0649a583          	lw	a1,100(s3)
80002fb6:	ed81                	bnez	a1,80002fce <itrunc+0x4c>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80002fb8:	0209a823          	sw	zero,48(s3)
  iupdate(ip);
80002fbc:	854e                	mv	a0,s3
80002fbe:	351d                	jal	80002de4 <iupdate>
}
80002fc0:	40f2                	lw	ra,28(sp)
80002fc2:	4462                	lw	s0,24(sp)
80002fc4:	44d2                	lw	s1,20(sp)
80002fc6:	4942                	lw	s2,16(sp)
80002fc8:	49b2                	lw	s3,12(sp)
80002fca:	6105                	addi	sp,sp,32
80002fcc:	8082                	ret
80002fce:	c452                	sw	s4,8(sp)
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80002fd0:	0009a503          	lw	a0,0(s3)
80002fd4:	841ff0ef          	jal	80002814 <bread>
80002fd8:	8a2a                	mv	s4,a0
    for (j = 0; j < NINDIRECT; j++) {
80002fda:	03450493          	addi	s1,a0,52
80002fde:	43450913          	addi	s2,a0,1076
80002fe2:	a021                	j	80002fea <itrunc+0x68>
80002fe4:	0491                	addi	s1,s1,4
80002fe6:	01248863          	beq	s1,s2,80002ff6 <itrunc+0x74>
      if (a[j])
80002fea:	408c                	lw	a1,0(s1)
80002fec:	dde5                	beqz	a1,80002fe4 <itrunc+0x62>
        bfree(ip->dev, a[j]);
80002fee:	0009a503          	lw	a0,0(s3)
80002ff2:	3c19                	jal	80002a08 <bfree>
80002ff4:	bfc5                	j	80002fe4 <itrunc+0x62>
    brelse(bp);
80002ff6:	8552                	mv	a0,s4
80002ff8:	925ff0ef          	jal	8000291c <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80002ffc:	0649a583          	lw	a1,100(s3)
80003000:	0009a503          	lw	a0,0(s3)
80003004:	3411                	jal	80002a08 <bfree>
    ip->addrs[NDIRECT] = 0;
80003006:	0609a223          	sw	zero,100(s3)
8000300a:	4a22                	lw	s4,8(sp)
8000300c:	b775                	j	80002fb8 <itrunc+0x36>

8000300e <iput>:
{
8000300e:	1141                	addi	sp,sp,-16
80003010:	c606                	sw	ra,12(sp)
80003012:	c422                	sw	s0,8(sp)
80003014:	c226                	sw	s1,4(sp)
80003016:	0800                	addi	s0,sp,16
80003018:	84aa                	mv	s1,a0
  acquire(&itable.lock);
8000301a:	000c3517          	auipc	a0,0xc3
8000301e:	42250513          	addi	a0,a0,1058 # 800c643c <itable>
80003022:	a8dfd0ef          	jal	80000aae <acquire>
  if (ip->ref == 1 && ip->valid && ip->nlink == 0) {
80003026:	4498                	lw	a4,8(s1)
80003028:	4785                	li	a5,1
8000302a:	02f70063          	beq	a4,a5,8000304a <iput+0x3c>
  ip->ref--;
8000302e:	449c                	lw	a5,8(s1)
80003030:	17fd                	addi	a5,a5,-1
80003032:	c49c                	sw	a5,8(s1)
  release(&itable.lock);
80003034:	000c3517          	auipc	a0,0xc3
80003038:	40850513          	addi	a0,a0,1032 # 800c643c <itable>
8000303c:	af7fd0ef          	jal	80000b32 <release>
}
80003040:	40b2                	lw	ra,12(sp)
80003042:	4422                	lw	s0,8(sp)
80003044:	4492                	lw	s1,4(sp)
80003046:	0141                	addi	sp,sp,16
80003048:	8082                	ret
  if (ip->ref == 1 && ip->valid && ip->nlink == 0) {
8000304a:	50dc                	lw	a5,36(s1)
8000304c:	d3ed                	beqz	a5,8000302e <iput+0x20>
8000304e:	02e49783          	lh	a5,46(s1)
80003052:	fff1                	bnez	a5,8000302e <iput+0x20>
80003054:	c04a                	sw	s2,0(sp)
    acquiresleep(&ip->lock);
80003056:	00c48913          	addi	s2,s1,12
8000305a:	854a                	mv	a0,s2
8000305c:	203000ef          	jal	80003a5e <acquiresleep>
    release(&itable.lock);
80003060:	000c3517          	auipc	a0,0xc3
80003064:	3dc50513          	addi	a0,a0,988 # 800c643c <itable>
80003068:	acbfd0ef          	jal	80000b32 <release>
    itrunc(ip);
8000306c:	8526                	mv	a0,s1
8000306e:	3f11                	jal	80002f82 <itrunc>
    ip->type = 0;
80003070:	02049423          	sh	zero,40(s1)
    iupdate(ip);
80003074:	8526                	mv	a0,s1
80003076:	33bd                	jal	80002de4 <iupdate>
    ip->valid = 0;
80003078:	0204a223          	sw	zero,36(s1)
    releasesleep(&ip->lock);
8000307c:	854a                	mv	a0,s2
8000307e:	227000ef          	jal	80003aa4 <releasesleep>
    acquire(&itable.lock);
80003082:	000c3517          	auipc	a0,0xc3
80003086:	3ba50513          	addi	a0,a0,954 # 800c643c <itable>
8000308a:	a25fd0ef          	jal	80000aae <acquire>
8000308e:	4902                	lw	s2,0(sp)
80003090:	bf79                	j	8000302e <iput+0x20>

80003092 <iunlockput>:
{
80003092:	1141                	addi	sp,sp,-16
80003094:	c606                	sw	ra,12(sp)
80003096:	c422                	sw	s0,8(sp)
80003098:	c226                	sw	s1,4(sp)
8000309a:	0800                	addi	s0,sp,16
8000309c:	84aa                	mv	s1,a0
  iunlock(ip);
8000309e:	3555                	jal	80002f42 <iunlock>
  iput(ip);
800030a0:	8526                	mv	a0,s1
800030a2:	37b5                	jal	8000300e <iput>
}
800030a4:	40b2                	lw	ra,12(sp)
800030a6:	4422                	lw	s0,8(sp)
800030a8:	4492                	lw	s1,4(sp)
800030aa:	0141                	addi	sp,sp,16
800030ac:	8082                	ret

800030ae <ireclaim>:
  for (int inum = 1; inum < sb.ninodes; inum++) {
800030ae:	000c3717          	auipc	a4,0xc3
800030b2:	37a72703          	lw	a4,890(a4) # 800c6428 <sb+0xc>
800030b6:	4785                	li	a5,1
800030b8:	0ae7f663          	bgeu	a5,a4,80003164 <ireclaim+0xb6>
{
800030bc:	1101                	addi	sp,sp,-32
800030be:	ce06                	sw	ra,28(sp)
800030c0:	cc22                	sw	s0,24(sp)
800030c2:	ca26                	sw	s1,20(sp)
800030c4:	c84a                	sw	s2,16(sp)
800030c6:	c64e                	sw	s3,12(sp)
800030c8:	c452                	sw	s4,8(sp)
800030ca:	c256                	sw	s5,4(sp)
800030cc:	c05a                	sw	s6,0(sp)
800030ce:	1000                	addi	s0,sp,32
800030d0:	8a2a                	mv	s4,a0
  for (int inum = 1; inum < sb.ninodes; inum++) {
800030d2:	4485                	li	s1,1
    struct buf *bp = bread(dev, IBLOCK(inum, sb));
800030d4:	000c3997          	auipc	s3,0xc3
800030d8:	34898993          	addi	s3,s3,840 # 800c641c <sb>
      printf("ireclaim: orphaned inode %d\n", inum);
800030dc:	00008b17          	auipc	s6,0x8
800030e0:	3bcb0b13          	addi	s6,s6,956 # 8000b498 <etext+0x498>
800030e4:	a82d                	j	8000311e <ireclaim+0x70>
800030e6:	85a6                	mv	a1,s1
800030e8:	855a                	mv	a0,s6
800030ea:	bfafd0ef          	jal	800004e4 <printf>
      ip = iget(dev, inum);
800030ee:	85a6                	mv	a1,s1
800030f0:	8552                	mv	a0,s4
800030f2:	3e2d                	jal	80002c2c <iget>
800030f4:	8aaa                	mv	s5,a0
    brelse(bp);
800030f6:	854a                	mv	a0,s2
800030f8:	825ff0ef          	jal	8000291c <brelse>
    if (ip) {
800030fc:	000a8c63          	beqz	s5,80003114 <ireclaim+0x66>
      begin_op();
80003100:	6e8000ef          	jal	800037e8 <begin_op>
      ilock(ip);
80003104:	8556                	mv	a0,s5
80003106:	3b41                	jal	80002e96 <ilock>
      iunlock(ip);
80003108:	8556                	mv	a0,s5
8000310a:	3d25                	jal	80002f42 <iunlock>
      iput(ip);
8000310c:	8556                	mv	a0,s5
8000310e:	3701                	jal	8000300e <iput>
      end_op();
80003110:	740000ef          	jal	80003850 <end_op>
  for (int inum = 1; inum < sb.ninodes; inum++) {
80003114:	0485                	addi	s1,s1,1
80003116:	00c9a783          	lw	a5,12(s3)
8000311a:	02f4fb63          	bgeu	s1,a5,80003150 <ireclaim+0xa2>
    struct buf *bp = bread(dev, IBLOCK(inum, sb));
8000311e:	0044d593          	srli	a1,s1,0x4
80003122:	0189a783          	lw	a5,24(s3)
80003126:	95be                	add	a1,a1,a5
80003128:	8552                	mv	a0,s4
8000312a:	eeaff0ef          	jal	80002814 <bread>
8000312e:	892a                	mv	s2,a0
    struct dinode *dip = (struct dinode *)bp->data + inum % IPB;
80003130:	03450793          	addi	a5,a0,52
80003134:	00f4f713          	andi	a4,s1,15
80003138:	071a                	slli	a4,a4,0x6
8000313a:	97ba                	add	a5,a5,a4
    if (dip->type != 0 && dip->nlink == 0) { // is an orphaned inode
8000313c:	00079703          	lh	a4,0(a5)
80003140:	c701                	beqz	a4,80003148 <ireclaim+0x9a>
80003142:	00679783          	lh	a5,6(a5)
80003146:	d3c5                	beqz	a5,800030e6 <ireclaim+0x38>
    brelse(bp);
80003148:	854a                	mv	a0,s2
8000314a:	fd2ff0ef          	jal	8000291c <brelse>
    if (ip) {
8000314e:	b7d9                	j	80003114 <ireclaim+0x66>
}
80003150:	40f2                	lw	ra,28(sp)
80003152:	4462                	lw	s0,24(sp)
80003154:	44d2                	lw	s1,20(sp)
80003156:	4942                	lw	s2,16(sp)
80003158:	49b2                	lw	s3,12(sp)
8000315a:	4a22                	lw	s4,8(sp)
8000315c:	4a92                	lw	s5,4(sp)
8000315e:	4b02                	lw	s6,0(sp)
80003160:	6105                	addi	sp,sp,32
80003162:	8082                	ret
80003164:	8082                	ret

80003166 <fsinit>:
{
80003166:	1101                	addi	sp,sp,-32
80003168:	ce06                	sw	ra,28(sp)
8000316a:	cc22                	sw	s0,24(sp)
8000316c:	ca26                	sw	s1,20(sp)
8000316e:	c84a                	sw	s2,16(sp)
80003170:	c64e                	sw	s3,12(sp)
80003172:	1000                	addi	s0,sp,32
80003174:	892a                	mv	s2,a0
  bp = bread(dev, 1);
80003176:	4585                	li	a1,1
80003178:	e9cff0ef          	jal	80002814 <bread>
8000317c:	84aa                	mv	s1,a0
  memmove(sb, bp->data, sizeof(*sb));
8000317e:	000c3997          	auipc	s3,0xc3
80003182:	29e98993          	addi	s3,s3,670 # 800c641c <sb>
80003186:	02000613          	li	a2,32
8000318a:	03450593          	addi	a1,a0,52
8000318e:	854e                	mv	a0,s3
80003190:	a21fd0ef          	jal	80000bb0 <memmove>
  brelse(bp);
80003194:	8526                	mv	a0,s1
80003196:	f86ff0ef          	jal	8000291c <brelse>
  if (sb.magic != FSMAGIC)
8000319a:	0009a703          	lw	a4,0(s3)
8000319e:	102037b7          	lui	a5,0x10203
800031a2:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
800031a6:	02f71163          	bne	a4,a5,800031c8 <fsinit+0x62>
  initlog(dev, &sb);
800031aa:	000c3597          	auipc	a1,0xc3
800031ae:	27258593          	addi	a1,a1,626 # 800c641c <sb>
800031b2:	854a                	mv	a0,s2
800031b4:	2b6d                	jal	8000376e <initlog>
  ireclaim(dev);
800031b6:	854a                	mv	a0,s2
800031b8:	3ddd                	jal	800030ae <ireclaim>
}
800031ba:	40f2                	lw	ra,28(sp)
800031bc:	4462                	lw	s0,24(sp)
800031be:	44d2                	lw	s1,20(sp)
800031c0:	4942                	lw	s2,16(sp)
800031c2:	49b2                	lw	s3,12(sp)
800031c4:	6105                	addi	sp,sp,32
800031c6:	8082                	ret
    panic("invalid file system");
800031c8:	00008517          	auipc	a0,0x8
800031cc:	2f050513          	addi	a0,a0,752 # 8000b4b8 <etext+0x4b8>
800031d0:	de8fd0ef          	jal	800007b8 <panic>

800031d4 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
800031d4:	1141                	addi	sp,sp,-16
800031d6:	c622                	sw	s0,12(sp)
800031d8:	0800                	addi	s0,sp,16
  st->dev = ip->dev;
800031da:	411c                	lw	a5,0(a0)
800031dc:	c19c                	sw	a5,0(a1)
  st->ino = ip->inum;
800031de:	415c                	lw	a5,4(a0)
800031e0:	c1dc                	sw	a5,4(a1)
  st->type = ip->type;
800031e2:	02851783          	lh	a5,40(a0)
800031e6:	00f59423          	sh	a5,8(a1)
  st->nlink = ip->nlink;
800031ea:	02e51783          	lh	a5,46(a0)
800031ee:	00f59523          	sh	a5,10(a1)
  st->size = ip->size;
800031f2:	591c                	lw	a5,48(a0)
800031f4:	c5dc                	sw	a5,12(a1)
}
800031f6:	4432                	lw	s0,12(sp)
800031f8:	0141                	addi	sp,sp,16
800031fa:	8082                	ret

800031fc <readi>:
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;

  if (off > ip->size || off + n < off)
800031fc:	591c                	lw	a5,48(a0)
800031fe:	0cd7eb63          	bltu	a5,a3,800032d4 <readi+0xd8>
{
80003202:	7179                	addi	sp,sp,-48
80003204:	d606                	sw	ra,44(sp)
80003206:	d422                	sw	s0,40(sp)
80003208:	d04a                	sw	s2,32(sp)
8000320a:	cc52                	sw	s4,24(sp)
8000320c:	ca56                	sw	s5,20(sp)
8000320e:	c85a                	sw	s6,16(sp)
80003210:	c65e                	sw	s7,12(sp)
80003212:	1800                	addi	s0,sp,48
80003214:	8b2a                	mv	s6,a0
80003216:	8bae                	mv	s7,a1
80003218:	8a32                	mv	s4,a2
8000321a:	8936                	mv	s2,a3
8000321c:	8aba                	mv	s5,a4
  if (off > ip->size || off + n < off)
8000321e:	9736                	add	a4,a4,a3
    return 0;
80003220:	4501                	li	a0,0
  if (off > ip->size || off + n < off)
80003222:	0ad76063          	bltu	a4,a3,800032c2 <readi+0xc6>
80003226:	ce4e                	sw	s3,28(sp)
  if (off + n > ip->size)
80003228:	00e7f463          	bgeu	a5,a4,80003230 <readi+0x34>
    n = ip->size - off;
8000322c:	40d78ab3          	sub	s5,a5,a3

  for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80003230:	080a8163          	beqz	s5,800032b2 <readi+0xb6>
80003234:	d226                	sw	s1,36(sp)
80003236:	c462                	sw	s8,8(sp)
80003238:	c266                	sw	s9,4(sp)
8000323a:	c06a                	sw	s10,0(sp)
8000323c:	4981                	li	s3,0
    uint addr = bmap(ip, off / BSIZE);
    if (addr == 0)
      break;
    bp = bread(ip->dev, addr);
    m = min(n - tot, BSIZE - off % BSIZE);
8000323e:	40000c93          	li	s9,1024
    if (either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
80003242:	5c7d                	li	s8,-1
80003244:	a01d                	j	8000326a <readi+0x6e>
80003246:	034d0613          	addi	a2,s10,52
8000324a:	86a6                	mv	a3,s1
8000324c:	963e                	add	a2,a2,a5
8000324e:	85d2                	mv	a1,s4
80003250:	855e                	mv	a0,s7
80003252:	d79fe0ef          	jal	80001fca <either_copyout>
80003256:	05850063          	beq	a0,s8,80003296 <readi+0x9a>
      brelse(bp);
      tot = -1;
      break;
    }
    brelse(bp);
8000325a:	856a                	mv	a0,s10
8000325c:	ec0ff0ef          	jal	8000291c <brelse>
  for (tot = 0; tot < n; tot += m, off += m, dst += m) {
80003260:	99a6                	add	s3,s3,s1
80003262:	9926                	add	s2,s2,s1
80003264:	9a26                	add	s4,s4,s1
80003266:	0559f163          	bgeu	s3,s5,800032a8 <readi+0xac>
    uint addr = bmap(ip, off / BSIZE);
8000326a:	00a95593          	srli	a1,s2,0xa
8000326e:	855a                	mv	a0,s6
80003270:	90dff0ef          	jal	80002b7c <bmap>
80003274:	85aa                	mv	a1,a0
    if (addr == 0)
80003276:	c121                	beqz	a0,800032b6 <readi+0xba>
    bp = bread(ip->dev, addr);
80003278:	000b2503          	lw	a0,0(s6)
8000327c:	d98ff0ef          	jal	80002814 <bread>
80003280:	8d2a                	mv	s10,a0
    m = min(n - tot, BSIZE - off % BSIZE);
80003282:	3ff97793          	andi	a5,s2,1023
80003286:	413a8733          	sub	a4,s5,s3
8000328a:	40fc84b3          	sub	s1,s9,a5
8000328e:	fa977ce3          	bgeu	a4,s1,80003246 <readi+0x4a>
80003292:	84ba                	mv	s1,a4
80003294:	bf4d                	j	80003246 <readi+0x4a>
      brelse(bp);
80003296:	856a                	mv	a0,s10
80003298:	e84ff0ef          	jal	8000291c <brelse>
      tot = -1;
8000329c:	59fd                	li	s3,-1
      break;
8000329e:	5492                	lw	s1,36(sp)
800032a0:	4c22                	lw	s8,8(sp)
800032a2:	4c92                	lw	s9,4(sp)
800032a4:	4d02                	lw	s10,0(sp)
800032a6:	a821                	j	800032be <readi+0xc2>
800032a8:	5492                	lw	s1,36(sp)
800032aa:	4c22                	lw	s8,8(sp)
800032ac:	4c92                	lw	s9,4(sp)
800032ae:	4d02                	lw	s10,0(sp)
800032b0:	a039                	j	800032be <readi+0xc2>
  for (tot = 0; tot < n; tot += m, off += m, dst += m) {
800032b2:	89d6                	mv	s3,s5
800032b4:	a029                	j	800032be <readi+0xc2>
800032b6:	5492                	lw	s1,36(sp)
800032b8:	4c22                	lw	s8,8(sp)
800032ba:	4c92                	lw	s9,4(sp)
800032bc:	4d02                	lw	s10,0(sp)
  }
  return tot;
800032be:	854e                	mv	a0,s3
800032c0:	49f2                	lw	s3,28(sp)
}
800032c2:	50b2                	lw	ra,44(sp)
800032c4:	5422                	lw	s0,40(sp)
800032c6:	5902                	lw	s2,32(sp)
800032c8:	4a62                	lw	s4,24(sp)
800032ca:	4ad2                	lw	s5,20(sp)
800032cc:	4b42                	lw	s6,16(sp)
800032ce:	4bb2                	lw	s7,12(sp)
800032d0:	6145                	addi	sp,sp,48
800032d2:	8082                	ret
    return 0;
800032d4:	4501                	li	a0,0
}
800032d6:	8082                	ret

800032d8 <writei>:
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
  uint tot, m;
  struct buf *bp;

  if (off > ip->size || off + n < off)
800032d8:	591c                	lw	a5,48(a0)
800032da:	0cd7ef63          	bltu	a5,a3,800033b8 <writei+0xe0>
{
800032de:	7179                	addi	sp,sp,-48
800032e0:	d606                	sw	ra,44(sp)
800032e2:	d422                	sw	s0,40(sp)
800032e4:	ce4e                	sw	s3,28(sp)
800032e6:	ca56                	sw	s5,20(sp)
800032e8:	c85a                	sw	s6,16(sp)
800032ea:	c65e                	sw	s7,12(sp)
800032ec:	c462                	sw	s8,8(sp)
800032ee:	1800                	addi	s0,sp,48
800032f0:	8b2a                	mv	s6,a0
800032f2:	8c2e                	mv	s8,a1
800032f4:	8ab2                	mv	s5,a2
800032f6:	89b6                	mv	s3,a3
800032f8:	8bba                	mv	s7,a4
  if (off > ip->size || off + n < off)
800032fa:	00e687b3          	add	a5,a3,a4
800032fe:	0ad7ef63          	bltu	a5,a3,800033bc <writei+0xe4>
    return -1;
  if (off + n > MAXFILE * BSIZE)
80003302:	00043737          	lui	a4,0x43
80003306:	0af76d63          	bltu	a4,a5,800033c0 <writei+0xe8>
8000330a:	cc52                	sw	s4,24(sp)
    return -1;

  for (tot = 0; tot < n; tot += m, off += m, src += m) {
8000330c:	080b8f63          	beqz	s7,800033aa <writei+0xd2>
80003310:	d226                	sw	s1,36(sp)
80003312:	d04a                	sw	s2,32(sp)
80003314:	c266                	sw	s9,4(sp)
80003316:	c06a                	sw	s10,0(sp)
80003318:	4a01                	li	s4,0
    uint addr = bmap(ip, off / BSIZE);
    if (addr == 0)
      break;
    bp = bread(ip->dev, addr);
    m = min(n - tot, BSIZE - off % BSIZE);
8000331a:	40000d13          	li	s10,1024
    if (either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
8000331e:	5cfd                	li	s9,-1
80003320:	a02d                	j	8000334a <writei+0x72>
80003322:	03490513          	addi	a0,s2,52
80003326:	86a6                	mv	a3,s1
80003328:	8656                	mv	a2,s5
8000332a:	85e2                	mv	a1,s8
8000332c:	953e                	add	a0,a0,a5
8000332e:	ce5fe0ef          	jal	80002012 <either_copyin>
80003332:	05950263          	beq	a0,s9,80003376 <writei+0x9e>
      brelse(bp);
      break;
    }
    log_write(bp);
80003336:	854a                	mv	a0,s2
80003338:	253d                	jal	80003966 <log_write>
    brelse(bp);
8000333a:	854a                	mv	a0,s2
8000333c:	de0ff0ef          	jal	8000291c <brelse>
  for (tot = 0; tot < n; tot += m, off += m, src += m) {
80003340:	9a26                	add	s4,s4,s1
80003342:	99a6                	add	s3,s3,s1
80003344:	9aa6                	add	s5,s5,s1
80003346:	037a7b63          	bgeu	s4,s7,8000337c <writei+0xa4>
    uint addr = bmap(ip, off / BSIZE);
8000334a:	00a9d593          	srli	a1,s3,0xa
8000334e:	855a                	mv	a0,s6
80003350:	82dff0ef          	jal	80002b7c <bmap>
80003354:	85aa                	mv	a1,a0
    if (addr == 0)
80003356:	c11d                	beqz	a0,8000337c <writei+0xa4>
    bp = bread(ip->dev, addr);
80003358:	000b2503          	lw	a0,0(s6)
8000335c:	cb8ff0ef          	jal	80002814 <bread>
80003360:	892a                	mv	s2,a0
    m = min(n - tot, BSIZE - off % BSIZE);
80003362:	3ff9f793          	andi	a5,s3,1023
80003366:	414b8733          	sub	a4,s7,s4
8000336a:	40fd04b3          	sub	s1,s10,a5
8000336e:	fa977ae3          	bgeu	a4,s1,80003322 <writei+0x4a>
80003372:	84ba                	mv	s1,a4
80003374:	b77d                	j	80003322 <writei+0x4a>
      brelse(bp);
80003376:	854a                	mv	a0,s2
80003378:	da4ff0ef          	jal	8000291c <brelse>
  }

  if (off > ip->size)
8000337c:	030b2783          	lw	a5,48(s6)
80003380:	0337f763          	bgeu	a5,s3,800033ae <writei+0xd6>
    ip->size = off;
80003384:	033b2823          	sw	s3,48(s6)
80003388:	5492                	lw	s1,36(sp)
8000338a:	5902                	lw	s2,32(sp)
8000338c:	4c92                	lw	s9,4(sp)
8000338e:	4d02                	lw	s10,0(sp)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
80003390:	855a                	mv	a0,s6
80003392:	3c89                	jal	80002de4 <iupdate>

  return tot;
80003394:	8552                	mv	a0,s4
80003396:	4a62                	lw	s4,24(sp)
}
80003398:	50b2                	lw	ra,44(sp)
8000339a:	5422                	lw	s0,40(sp)
8000339c:	49f2                	lw	s3,28(sp)
8000339e:	4ad2                	lw	s5,20(sp)
800033a0:	4b42                	lw	s6,16(sp)
800033a2:	4bb2                	lw	s7,12(sp)
800033a4:	4c22                	lw	s8,8(sp)
800033a6:	6145                	addi	sp,sp,48
800033a8:	8082                	ret
  for (tot = 0; tot < n; tot += m, off += m, src += m) {
800033aa:	8a5e                	mv	s4,s7
800033ac:	b7d5                	j	80003390 <writei+0xb8>
800033ae:	5492                	lw	s1,36(sp)
800033b0:	5902                	lw	s2,32(sp)
800033b2:	4c92                	lw	s9,4(sp)
800033b4:	4d02                	lw	s10,0(sp)
800033b6:	bfe9                	j	80003390 <writei+0xb8>
    return -1;
800033b8:	557d                	li	a0,-1
}
800033ba:	8082                	ret
    return -1;
800033bc:	557d                	li	a0,-1
800033be:	bfe9                	j	80003398 <writei+0xc0>
    return -1;
800033c0:	557d                	li	a0,-1
800033c2:	bfd9                	j	80003398 <writei+0xc0>

800033c4 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
800033c4:	1141                	addi	sp,sp,-16
800033c6:	c606                	sw	ra,12(sp)
800033c8:	c422                	sw	s0,8(sp)
800033ca:	0800                	addi	s0,sp,16
  return strncmp(s, t, DIRSIZ);
800033cc:	4639                	li	a2,14
800033ce:	837fd0ef          	jal	80000c04 <strncmp>
}
800033d2:	40b2                	lw	ra,12(sp)
800033d4:	4422                	lw	s0,8(sp)
800033d6:	0141                	addi	sp,sp,16
800033d8:	8082                	ret

800033da <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode *
dirlookup(struct inode *dp, char *name, uint *poff)
{
800033da:	7179                	addi	sp,sp,-48
800033dc:	d606                	sw	ra,44(sp)
800033de:	d422                	sw	s0,40(sp)
800033e0:	d226                	sw	s1,36(sp)
800033e2:	d04a                	sw	s2,32(sp)
800033e4:	ce4e                	sw	s3,28(sp)
800033e6:	cc52                	sw	s4,24(sp)
800033e8:	1800                	addi	s0,sp,48
  uint off, inum;
  struct dirent de;

  if (dp->type != T_DIR)
800033ea:	02851703          	lh	a4,40(a0)
800033ee:	4785                	li	a5,1
800033f0:	00f71a63          	bne	a4,a5,80003404 <dirlookup+0x2a>
800033f4:	892a                	mv	s2,a0
800033f6:	89ae                	mv	s3,a1
800033f8:	8a32                	mv	s4,a2
    panic("dirlookup not DIR");

  for (off = 0; off < dp->size; off += sizeof(de)) {
800033fa:	591c                	lw	a5,48(a0)
800033fc:	4481                	li	s1,0
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
800033fe:	4501                	li	a0,0
  for (off = 0; off < dp->size; off += sizeof(de)) {
80003400:	e39d                	bnez	a5,80003426 <dirlookup+0x4c>
80003402:	a085                	j	80003462 <dirlookup+0x88>
    panic("dirlookup not DIR");
80003404:	00008517          	auipc	a0,0x8
80003408:	0c850513          	addi	a0,a0,200 # 8000b4cc <etext+0x4cc>
8000340c:	bacfd0ef          	jal	800007b8 <panic>
      panic("dirlookup read");
80003410:	00008517          	auipc	a0,0x8
80003414:	0d050513          	addi	a0,a0,208 # 8000b4e0 <etext+0x4e0>
80003418:	ba0fd0ef          	jal	800007b8 <panic>
  for (off = 0; off < dp->size; off += sizeof(de)) {
8000341c:	04c1                	addi	s1,s1,16
8000341e:	03092783          	lw	a5,48(s2)
80003422:	02f4ff63          	bgeu	s1,a5,80003460 <dirlookup+0x86>
    if (readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
80003426:	4741                	li	a4,16
80003428:	86a6                	mv	a3,s1
8000342a:	fd040613          	addi	a2,s0,-48
8000342e:	4581                	li	a1,0
80003430:	854a                	mv	a0,s2
80003432:	33e9                	jal	800031fc <readi>
80003434:	47c1                	li	a5,16
80003436:	fcf51de3          	bne	a0,a5,80003410 <dirlookup+0x36>
    if (de.inum == 0)
8000343a:	fd045783          	lhu	a5,-48(s0)
8000343e:	dff9                	beqz	a5,8000341c <dirlookup+0x42>
    if (namecmp(name, de.name) == 0) {
80003440:	fd240593          	addi	a1,s0,-46
80003444:	854e                	mv	a0,s3
80003446:	3fbd                	jal	800033c4 <namecmp>
80003448:	f971                	bnez	a0,8000341c <dirlookup+0x42>
      if (poff)
8000344a:	000a0463          	beqz	s4,80003452 <dirlookup+0x78>
        *poff = off;
8000344e:	009a2023          	sw	s1,0(s4)
      return iget(dp->dev, inum);
80003452:	fd045583          	lhu	a1,-48(s0)
80003456:	00092503          	lw	a0,0(s2)
8000345a:	fd2ff0ef          	jal	80002c2c <iget>
8000345e:	a011                	j	80003462 <dirlookup+0x88>
  return 0;
80003460:	4501                	li	a0,0
}
80003462:	50b2                	lw	ra,44(sp)
80003464:	5422                	lw	s0,40(sp)
80003466:	5492                	lw	s1,36(sp)
80003468:	5902                	lw	s2,32(sp)
8000346a:	49f2                	lw	s3,28(sp)
8000346c:	4a62                	lw	s4,24(sp)
8000346e:	6145                	addi	sp,sp,48
80003470:	8082                	ret

80003472 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode *
namex(char *path, int nameiparent, char *name)
{
80003472:	7179                	addi	sp,sp,-48
80003474:	d606                	sw	ra,44(sp)
80003476:	d422                	sw	s0,40(sp)
80003478:	d226                	sw	s1,36(sp)
8000347a:	d04a                	sw	s2,32(sp)
8000347c:	ce4e                	sw	s3,28(sp)
8000347e:	cc52                	sw	s4,24(sp)
80003480:	ca56                	sw	s5,20(sp)
80003482:	c85a                	sw	s6,16(sp)
80003484:	c65e                	sw	s7,12(sp)
80003486:	c462                	sw	s8,8(sp)
80003488:	c266                	sw	s9,4(sp)
8000348a:	1800                	addi	s0,sp,48
8000348c:	84aa                	mv	s1,a0
8000348e:	8b2e                	mv	s6,a1
80003490:	8ab2                	mv	s5,a2
  struct inode *ip, *next;

  if (*path == '/')
80003492:	00054703          	lbu	a4,0(a0)
80003496:	02f00793          	li	a5,47
8000349a:	00f70d63          	beq	a4,a5,800034b4 <namex+0x42>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
8000349e:	9b2fe0ef          	jal	80001650 <myproc>
800034a2:	0ac52503          	lw	a0,172(a0)
800034a6:	3a6d                	jal	80002e60 <idup>
800034a8:	8a2a                	mv	s4,a0
  while (*path == '/')
800034aa:	02f00913          	li	s2,47
  if (len >= DIRSIZ)
800034ae:	4c35                	li	s8,13

  while ((path = skipelem(path, name)) != 0) {
    ilock(ip);
    if (ip->type != T_DIR) {
800034b0:	4b85                	li	s7,1
800034b2:	a071                	j	8000353e <namex+0xcc>
    ip = iget(ROOTDEV, ROOTINO);
800034b4:	4585                	li	a1,1
800034b6:	4505                	li	a0,1
800034b8:	f74ff0ef          	jal	80002c2c <iget>
800034bc:	8a2a                	mv	s4,a0
800034be:	b7f5                	j	800034aa <namex+0x38>
      iunlockput(ip);
800034c0:	8552                	mv	a0,s4
800034c2:	3ec1                	jal	80003092 <iunlockput>
      return 0;
800034c4:	4a01                	li	s4,0
  if (nameiparent) {
    iput(ip);
    return 0;
  }
  return ip;
}
800034c6:	8552                	mv	a0,s4
800034c8:	50b2                	lw	ra,44(sp)
800034ca:	5422                	lw	s0,40(sp)
800034cc:	5492                	lw	s1,36(sp)
800034ce:	5902                	lw	s2,32(sp)
800034d0:	49f2                	lw	s3,28(sp)
800034d2:	4a62                	lw	s4,24(sp)
800034d4:	4ad2                	lw	s5,20(sp)
800034d6:	4b42                	lw	s6,16(sp)
800034d8:	4bb2                	lw	s7,12(sp)
800034da:	4c22                	lw	s8,8(sp)
800034dc:	4c92                	lw	s9,4(sp)
800034de:	6145                	addi	sp,sp,48
800034e0:	8082                	ret
      iunlock(ip);
800034e2:	8552                	mv	a0,s4
800034e4:	3cb9                	jal	80002f42 <iunlock>
      return ip;
800034e6:	b7c5                	j	800034c6 <namex+0x54>
      iunlockput(ip);
800034e8:	8552                	mv	a0,s4
800034ea:	3665                	jal	80003092 <iunlockput>
      return 0;
800034ec:	8a4e                	mv	s4,s3
800034ee:	bfe1                	j	800034c6 <namex+0x54>
  len = path - s;
800034f0:	40998cb3          	sub	s9,s3,s1
  if (len >= DIRSIZ)
800034f4:	079c5c63          	bge	s8,s9,8000356c <namex+0xfa>
    memmove(name, s, DIRSIZ);
800034f8:	4639                	li	a2,14
800034fa:	85a6                	mv	a1,s1
800034fc:	8556                	mv	a0,s5
800034fe:	eb2fd0ef          	jal	80000bb0 <memmove>
80003502:	84ce                	mv	s1,s3
  while (*path == '/')
80003504:	0004c783          	lbu	a5,0(s1)
80003508:	01279763          	bne	a5,s2,80003516 <namex+0xa4>
    path++;
8000350c:	0485                	addi	s1,s1,1
  while (*path == '/')
8000350e:	0004c783          	lbu	a5,0(s1)
80003512:	ff278de3          	beq	a5,s2,8000350c <namex+0x9a>
    ilock(ip);
80003516:	8552                	mv	a0,s4
80003518:	3abd                	jal	80002e96 <ilock>
    if (ip->type != T_DIR) {
8000351a:	028a1783          	lh	a5,40(s4)
8000351e:	fb7791e3          	bne	a5,s7,800034c0 <namex+0x4e>
    if (nameiparent && *path == '\0') {
80003522:	000b0563          	beqz	s6,8000352c <namex+0xba>
80003526:	0004c783          	lbu	a5,0(s1)
8000352a:	dfc5                	beqz	a5,800034e2 <namex+0x70>
    if ((next = dirlookup(ip, name, 0)) == 0) {
8000352c:	4601                	li	a2,0
8000352e:	85d6                	mv	a1,s5
80003530:	8552                	mv	a0,s4
80003532:	3565                	jal	800033da <dirlookup>
80003534:	89aa                	mv	s3,a0
80003536:	d94d                	beqz	a0,800034e8 <namex+0x76>
    iunlockput(ip);
80003538:	8552                	mv	a0,s4
8000353a:	3ea1                	jal	80003092 <iunlockput>
    ip = next;
8000353c:	8a4e                	mv	s4,s3
  while (*path == '/')
8000353e:	0004c783          	lbu	a5,0(s1)
80003542:	01279763          	bne	a5,s2,80003550 <namex+0xde>
    path++;
80003546:	0485                	addi	s1,s1,1
  while (*path == '/')
80003548:	0004c783          	lbu	a5,0(s1)
8000354c:	ff278de3          	beq	a5,s2,80003546 <namex+0xd4>
  if (*path == 0)
80003550:	cb85                	beqz	a5,80003580 <namex+0x10e>
  while (*path != '/' && *path != 0)
80003552:	0004c783          	lbu	a5,0(s1)
80003556:	89a6                	mv	s3,s1
  len = path - s;
80003558:	4c81                	li	s9,0
  while (*path != '/' && *path != 0)
8000355a:	01278963          	beq	a5,s2,8000356c <namex+0xfa>
8000355e:	dbc9                	beqz	a5,800034f0 <namex+0x7e>
    path++;
80003560:	0985                	addi	s3,s3,1
  while (*path != '/' && *path != 0)
80003562:	0009c783          	lbu	a5,0(s3)
80003566:	ff279ce3          	bne	a5,s2,8000355e <namex+0xec>
8000356a:	b759                	j	800034f0 <namex+0x7e>
    memmove(name, s, len);
8000356c:	8666                	mv	a2,s9
8000356e:	85a6                	mv	a1,s1
80003570:	8556                	mv	a0,s5
80003572:	e3efd0ef          	jal	80000bb0 <memmove>
    name[len] = 0;
80003576:	9cd6                	add	s9,s9,s5
80003578:	000c8023          	sb	zero,0(s9)
8000357c:	84ce                	mv	s1,s3
8000357e:	b759                	j	80003504 <namex+0x92>
  if (nameiparent) {
80003580:	f40b03e3          	beqz	s6,800034c6 <namex+0x54>
    iput(ip);
80003584:	8552                	mv	a0,s4
80003586:	3461                	jal	8000300e <iput>
    return 0;
80003588:	4a01                	li	s4,0
8000358a:	bf35                	j	800034c6 <namex+0x54>

8000358c <dirlink>:
{
8000358c:	7179                	addi	sp,sp,-48
8000358e:	d606                	sw	ra,44(sp)
80003590:	d422                	sw	s0,40(sp)
80003592:	d04a                	sw	s2,32(sp)
80003594:	ce4e                	sw	s3,28(sp)
80003596:	cc52                	sw	s4,24(sp)
80003598:	1800                	addi	s0,sp,48
8000359a:	892a                	mv	s2,a0
8000359c:	8a2e                	mv	s4,a1
8000359e:	89b2                	mv	s3,a2
  if ((ip = dirlookup(dp, name, 0)) != 0) {
800035a0:	4601                	li	a2,0
800035a2:	3d25                	jal	800033da <dirlookup>
800035a4:	e525                	bnez	a0,8000360c <dirlink+0x80>
800035a6:	d226                	sw	s1,36(sp)
  for (off = 0; off < dp->size; off += sizeof(de)) {
800035a8:	03092483          	lw	s1,48(s2)
800035ac:	c485                	beqz	s1,800035d4 <dirlink+0x48>
800035ae:	4481                	li	s1,0
    if (readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
800035b0:	4741                	li	a4,16
800035b2:	86a6                	mv	a3,s1
800035b4:	fd040613          	addi	a2,s0,-48
800035b8:	4581                	li	a1,0
800035ba:	854a                	mv	a0,s2
800035bc:	3181                	jal	800031fc <readi>
800035be:	47c1                	li	a5,16
800035c0:	04f51963          	bne	a0,a5,80003612 <dirlink+0x86>
    if (de.inum == 0)
800035c4:	fd045783          	lhu	a5,-48(s0)
800035c8:	c791                	beqz	a5,800035d4 <dirlink+0x48>
  for (off = 0; off < dp->size; off += sizeof(de)) {
800035ca:	04c1                	addi	s1,s1,16
800035cc:	03092783          	lw	a5,48(s2)
800035d0:	fef4e0e3          	bltu	s1,a5,800035b0 <dirlink+0x24>
  strncpy(de.name, name, DIRSIZ);
800035d4:	4639                	li	a2,14
800035d6:	85d2                	mv	a1,s4
800035d8:	fd240513          	addi	a0,s0,-46
800035dc:	e5efd0ef          	jal	80000c3a <strncpy>
  de.inum = inum;
800035e0:	fd341823          	sh	s3,-48(s0)
  if (writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
800035e4:	4741                	li	a4,16
800035e6:	86a6                	mv	a3,s1
800035e8:	fd040613          	addi	a2,s0,-48
800035ec:	4581                	li	a1,0
800035ee:	854a                	mv	a0,s2
800035f0:	31e5                	jal	800032d8 <writei>
800035f2:	1541                	addi	a0,a0,-16
800035f4:	00a03533          	snez	a0,a0
800035f8:	40a00533          	neg	a0,a0
800035fc:	5492                	lw	s1,36(sp)
}
800035fe:	50b2                	lw	ra,44(sp)
80003600:	5422                	lw	s0,40(sp)
80003602:	5902                	lw	s2,32(sp)
80003604:	49f2                	lw	s3,28(sp)
80003606:	4a62                	lw	s4,24(sp)
80003608:	6145                	addi	sp,sp,48
8000360a:	8082                	ret
    iput(ip);
8000360c:	3409                	jal	8000300e <iput>
    return -1;
8000360e:	557d                	li	a0,-1
80003610:	b7fd                	j	800035fe <dirlink+0x72>
      panic("dirlink read");
80003612:	00008517          	auipc	a0,0x8
80003616:	ede50513          	addi	a0,a0,-290 # 8000b4f0 <etext+0x4f0>
8000361a:	99efd0ef          	jal	800007b8 <panic>

8000361e <namei>:

struct inode *
namei(char *path)
{
8000361e:	1101                	addi	sp,sp,-32
80003620:	ce06                	sw	ra,28(sp)
80003622:	cc22                	sw	s0,24(sp)
80003624:	1000                	addi	s0,sp,32
  char name[DIRSIZ];
  return namex(path, 0, name);
80003626:	fe040613          	addi	a2,s0,-32
8000362a:	4581                	li	a1,0
8000362c:	3599                	jal	80003472 <namex>
}
8000362e:	40f2                	lw	ra,28(sp)
80003630:	4462                	lw	s0,24(sp)
80003632:	6105                	addi	sp,sp,32
80003634:	8082                	ret

80003636 <nameiparent>:

struct inode *
nameiparent(char *path, char *name)
{
80003636:	1141                	addi	sp,sp,-16
80003638:	c606                	sw	ra,12(sp)
8000363a:	c422                	sw	s0,8(sp)
8000363c:	0800                	addi	s0,sp,16
8000363e:	862e                	mv	a2,a1
  return namex(path, 1, name);
80003640:	4585                	li	a1,1
80003642:	3d05                	jal	80003472 <namex>
}
80003644:	40b2                	lw	ra,12(sp)
80003646:	4422                	lw	s0,8(sp)
80003648:	0141                	addi	sp,sp,16
8000364a:	8082                	ret

8000364c <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
8000364c:	1141                	addi	sp,sp,-16
8000364e:	c606                	sw	ra,12(sp)
80003650:	c422                	sw	s0,8(sp)
80003652:	c226                	sw	s1,4(sp)
80003654:	c04a                	sw	s2,0(sp)
80003656:	0800                	addi	s0,sp,16
  struct buf *buf = bread(log.dev, log.start);
80003658:	000c4917          	auipc	s2,0xc4
8000365c:	24090913          	addi	s2,s2,576 # 800c7898 <log>
80003660:	00c92583          	lw	a1,12(s2)
80003664:	01892503          	lw	a0,24(s2)
80003668:	9acff0ef          	jal	80002814 <bread>
8000366c:	84aa                	mv	s1,a0
  struct logheader *hb = (struct logheader *)(buf->data);
  int i;
  hb->n = log.lh.n;
8000366e:	01c92603          	lw	a2,28(s2)
80003672:	d950                	sw	a2,52(a0)
  for (i = 0; i < log.lh.n; i++) {
80003674:	00c05f63          	blez	a2,80003692 <write_head+0x46>
80003678:	000c4717          	auipc	a4,0xc4
8000367c:	24070713          	addi	a4,a4,576 # 800c78b8 <log+0x20>
80003680:	87aa                	mv	a5,a0
80003682:	060a                	slli	a2,a2,0x2
80003684:	962a                	add	a2,a2,a0
    hb->block[i] = log.lh.block[i];
80003686:	4314                	lw	a3,0(a4)
80003688:	df94                	sw	a3,56(a5)
  for (i = 0; i < log.lh.n; i++) {
8000368a:	0711                	addi	a4,a4,4
8000368c:	0791                	addi	a5,a5,4
8000368e:	fec79ce3          	bne	a5,a2,80003686 <write_head+0x3a>
  }
  bwrite(buf);
80003692:	8526                	mv	a0,s1
80003694:	a56ff0ef          	jal	800028ea <bwrite>
  brelse(buf);
80003698:	8526                	mv	a0,s1
8000369a:	a82ff0ef          	jal	8000291c <brelse>
}
8000369e:	40b2                	lw	ra,12(sp)
800036a0:	4422                	lw	s0,8(sp)
800036a2:	4492                	lw	s1,4(sp)
800036a4:	4902                	lw	s2,0(sp)
800036a6:	0141                	addi	sp,sp,16
800036a8:	8082                	ret

800036aa <install_trans>:
  for (tail = 0; tail < log.lh.n; tail++) {
800036aa:	000c4797          	auipc	a5,0xc4
800036ae:	20a7a783          	lw	a5,522(a5) # 800c78b4 <log+0x1c>
800036b2:	0af05d63          	blez	a5,8000376c <install_trans+0xc2>
{
800036b6:	7179                	addi	sp,sp,-48
800036b8:	d606                	sw	ra,44(sp)
800036ba:	d422                	sw	s0,40(sp)
800036bc:	d226                	sw	s1,36(sp)
800036be:	d04a                	sw	s2,32(sp)
800036c0:	ce4e                	sw	s3,28(sp)
800036c2:	cc52                	sw	s4,24(sp)
800036c4:	ca56                	sw	s5,20(sp)
800036c6:	c85a                	sw	s6,16(sp)
800036c8:	c65e                	sw	s7,12(sp)
800036ca:	1800                	addi	s0,sp,48
800036cc:	8b2a                	mv	s6,a0
800036ce:	000c4a97          	auipc	s5,0xc4
800036d2:	1eaa8a93          	addi	s5,s5,490 # 800c78b8 <log+0x20>
  for (tail = 0; tail < log.lh.n; tail++) {
800036d6:	4981                	li	s3,0
      printf("recovering tail %d dst %d\n", tail, log.lh.block[tail]);
800036d8:	00008b97          	auipc	s7,0x8
800036dc:	e28b8b93          	addi	s7,s7,-472 # 8000b500 <etext+0x500>
    struct buf *lbuf = bread(log.dev, log.start + tail + 1); // read log block
800036e0:	000c4a17          	auipc	s4,0xc4
800036e4:	1b8a0a13          	addi	s4,s4,440 # 800c7898 <log>
800036e8:	a025                	j	80003710 <install_trans+0x66>
      printf("recovering tail %d dst %d\n", tail, log.lh.block[tail]);
800036ea:	000aa603          	lw	a2,0(s5)
800036ee:	85ce                	mv	a1,s3
800036f0:	855e                	mv	a0,s7
800036f2:	df3fc0ef          	jal	800004e4 <printf>
800036f6:	a839                	j	80003714 <install_trans+0x6a>
    brelse(lbuf);
800036f8:	854a                	mv	a0,s2
800036fa:	a22ff0ef          	jal	8000291c <brelse>
    brelse(dbuf);
800036fe:	8526                	mv	a0,s1
80003700:	a1cff0ef          	jal	8000291c <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80003704:	0985                	addi	s3,s3,1
80003706:	0a91                	addi	s5,s5,4
80003708:	01ca2783          	lw	a5,28(s4)
8000370c:	04f9d563          	bge	s3,a5,80003756 <install_trans+0xac>
    if (recovering) {
80003710:	fc0b1de3          	bnez	s6,800036ea <install_trans+0x40>
    struct buf *lbuf = bread(log.dev, log.start + tail + 1); // read log block
80003714:	00ca2583          	lw	a1,12(s4)
80003718:	95ce                	add	a1,a1,s3
8000371a:	0585                	addi	a1,a1,1
8000371c:	018a2503          	lw	a0,24(s4)
80003720:	8f4ff0ef          	jal	80002814 <bread>
80003724:	892a                	mv	s2,a0
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]);   // read dst
80003726:	000aa583          	lw	a1,0(s5)
8000372a:	018a2503          	lw	a0,24(s4)
8000372e:	8e6ff0ef          	jal	80002814 <bread>
80003732:	84aa                	mv	s1,a0
    memmove(dbuf->data, lbuf->data, BSIZE); // copy block to dst
80003734:	40000613          	li	a2,1024
80003738:	03490593          	addi	a1,s2,52
8000373c:	03450513          	addi	a0,a0,52
80003740:	c70fd0ef          	jal	80000bb0 <memmove>
    bwrite(dbuf);                           // write dst to disk
80003744:	8526                	mv	a0,s1
80003746:	9a4ff0ef          	jal	800028ea <bwrite>
    if (recovering == 0)
8000374a:	fa0b17e3          	bnez	s6,800036f8 <install_trans+0x4e>
      bunpin(dbuf);
8000374e:	8526                	mv	a0,s1
80003750:	a84ff0ef          	jal	800029d4 <bunpin>
80003754:	b755                	j	800036f8 <install_trans+0x4e>
}
80003756:	50b2                	lw	ra,44(sp)
80003758:	5422                	lw	s0,40(sp)
8000375a:	5492                	lw	s1,36(sp)
8000375c:	5902                	lw	s2,32(sp)
8000375e:	49f2                	lw	s3,28(sp)
80003760:	4a62                	lw	s4,24(sp)
80003762:	4ad2                	lw	s5,20(sp)
80003764:	4b42                	lw	s6,16(sp)
80003766:	4bb2                	lw	s7,12(sp)
80003768:	6145                	addi	sp,sp,48
8000376a:	8082                	ret
8000376c:	8082                	ret

8000376e <initlog>:
{
8000376e:	1101                	addi	sp,sp,-32
80003770:	ce06                	sw	ra,28(sp)
80003772:	cc22                	sw	s0,24(sp)
80003774:	ca26                	sw	s1,20(sp)
80003776:	c84a                	sw	s2,16(sp)
80003778:	c64e                	sw	s3,12(sp)
8000377a:	1000                	addi	s0,sp,32
8000377c:	892a                	mv	s2,a0
8000377e:	89ae                	mv	s3,a1
  initlock(&log.lock, "log");
80003780:	000c4497          	auipc	s1,0xc4
80003784:	11848493          	addi	s1,s1,280 # 800c7898 <log>
80003788:	00008597          	auipc	a1,0x8
8000378c:	d9458593          	addi	a1,a1,-620 # 8000b51c <etext+0x51c>
80003790:	8526                	mv	a0,s1
80003792:	a9cfd0ef          	jal	80000a2e <initlock>
  log.start = sb->logstart;
80003796:	0149a583          	lw	a1,20(s3)
8000379a:	c4cc                	sw	a1,12(s1)
  log.dev = dev;
8000379c:	0124ac23          	sw	s2,24(s1)
  struct buf *buf = bread(log.dev, log.start);
800037a0:	854a                	mv	a0,s2
800037a2:	872ff0ef          	jal	80002814 <bread>
  log.lh.n = lh->n;
800037a6:	5950                	lw	a2,52(a0)
800037a8:	ccd0                	sw	a2,28(s1)
  for (i = 0; i < log.lh.n; i++) {
800037aa:	00c05f63          	blez	a2,800037c8 <initlog+0x5a>
800037ae:	87aa                	mv	a5,a0
800037b0:	000c4717          	auipc	a4,0xc4
800037b4:	10870713          	addi	a4,a4,264 # 800c78b8 <log+0x20>
800037b8:	060a                	slli	a2,a2,0x2
800037ba:	962a                	add	a2,a2,a0
    log.lh.block[i] = lh->block[i];
800037bc:	5f94                	lw	a3,56(a5)
800037be:	c314                	sw	a3,0(a4)
  for (i = 0; i < log.lh.n; i++) {
800037c0:	0791                	addi	a5,a5,4
800037c2:	0711                	addi	a4,a4,4
800037c4:	fec79ce3          	bne	a5,a2,800037bc <initlog+0x4e>
  brelse(buf);
800037c8:	954ff0ef          	jal	8000291c <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(1); // if committed, copy from log to disk
800037cc:	4505                	li	a0,1
800037ce:	3df1                	jal	800036aa <install_trans>
  log.lh.n = 0;
800037d0:	000c4797          	auipc	a5,0xc4
800037d4:	0e07a223          	sw	zero,228(a5) # 800c78b4 <log+0x1c>
  write_head(); // clear the log
800037d8:	3d95                	jal	8000364c <write_head>
}
800037da:	40f2                	lw	ra,28(sp)
800037dc:	4462                	lw	s0,24(sp)
800037de:	44d2                	lw	s1,20(sp)
800037e0:	4942                	lw	s2,16(sp)
800037e2:	49b2                	lw	s3,12(sp)
800037e4:	6105                	addi	sp,sp,32
800037e6:	8082                	ret

800037e8 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
800037e8:	1141                	addi	sp,sp,-16
800037ea:	c606                	sw	ra,12(sp)
800037ec:	c422                	sw	s0,8(sp)
800037ee:	c226                	sw	s1,4(sp)
800037f0:	c04a                	sw	s2,0(sp)
800037f2:	0800                	addi	s0,sp,16
  acquire(&log.lock);
800037f4:	000c4517          	auipc	a0,0xc4
800037f8:	0a450513          	addi	a0,a0,164 # 800c7898 <log>
800037fc:	ab2fd0ef          	jal	80000aae <acquire>
  while (1) {
    if (log.committing) {
80003800:	000c4497          	auipc	s1,0xc4
80003804:	09848493          	addi	s1,s1,152 # 800c7898 <log>
      sleep(&log, &log.lock);
    } else if (log.lh.n + (log.outstanding + 1) * MAXOPBLOCKS > LOGBLOCKS) {
80003808:	4979                	li	s2,30
8000380a:	a029                	j	80003814 <begin_op+0x2c>
      sleep(&log, &log.lock);
8000380c:	85a6                	mv	a1,s1
8000380e:	8526                	mv	a0,s1
80003810:	c6efe0ef          	jal	80001c7e <sleep>
    if (log.committing) {
80003814:	48dc                	lw	a5,20(s1)
80003816:	fbfd                	bnez	a5,8000380c <begin_op+0x24>
    } else if (log.lh.n + (log.outstanding + 1) * MAXOPBLOCKS > LOGBLOCKS) {
80003818:	4898                	lw	a4,16(s1)
8000381a:	0705                	addi	a4,a4,1
8000381c:	00271793          	slli	a5,a4,0x2
80003820:	97ba                	add	a5,a5,a4
80003822:	0786                	slli	a5,a5,0x1
80003824:	4cd4                	lw	a3,28(s1)
80003826:	97b6                	add	a5,a5,a3
80003828:	00f95763          	bge	s2,a5,80003836 <begin_op+0x4e>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
8000382c:	85a6                	mv	a1,s1
8000382e:	8526                	mv	a0,s1
80003830:	c4efe0ef          	jal	80001c7e <sleep>
80003834:	b7c5                	j	80003814 <begin_op+0x2c>
    } else {
      log.outstanding += 1;
80003836:	000c4517          	auipc	a0,0xc4
8000383a:	06250513          	addi	a0,a0,98 # 800c7898 <log>
8000383e:	c918                	sw	a4,16(a0)
      release(&log.lock);
80003840:	af2fd0ef          	jal	80000b32 <release>
      break;
    }
  }
}
80003844:	40b2                	lw	ra,12(sp)
80003846:	4422                	lw	s0,8(sp)
80003848:	4492                	lw	s1,4(sp)
8000384a:	4902                	lw	s2,0(sp)
8000384c:	0141                	addi	sp,sp,16
8000384e:	8082                	ret

80003850 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80003850:	1101                	addi	sp,sp,-32
80003852:	ce06                	sw	ra,28(sp)
80003854:	cc22                	sw	s0,24(sp)
80003856:	ca26                	sw	s1,20(sp)
80003858:	c84a                	sw	s2,16(sp)
8000385a:	1000                	addi	s0,sp,32
  int do_commit = 0;

  acquire(&log.lock);
8000385c:	000c4917          	auipc	s2,0xc4
80003860:	03c90913          	addi	s2,s2,60 # 800c7898 <log>
80003864:	854a                	mv	a0,s2
80003866:	a48fd0ef          	jal	80000aae <acquire>
  log.outstanding -= 1;
8000386a:	01092483          	lw	s1,16(s2)
8000386e:	14fd                	addi	s1,s1,-1
80003870:	00992823          	sw	s1,16(s2)
  if (log.committing)
80003874:	01492783          	lw	a5,20(s2)
80003878:	e3a1                	bnez	a5,800038b8 <end_op+0x68>
    panic("log.committing");
  if (log.outstanding == 0) {
8000387a:	e8a1                	bnez	s1,800038ca <end_op+0x7a>
    do_commit = 1;
    log.committing = 1;
8000387c:	000c4917          	auipc	s2,0xc4
80003880:	01c90913          	addi	s2,s2,28 # 800c7898 <log>
80003884:	4785                	li	a5,1
80003886:	00f92a23          	sw	a5,20(s2)
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
8000388a:	854a                	mv	a0,s2
8000388c:	aa6fd0ef          	jal	80000b32 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80003890:	01c92783          	lw	a5,28(s2)
80003894:	04f04b63          	bgtz	a5,800038ea <end_op+0x9a>
    acquire(&log.lock);
80003898:	000c4497          	auipc	s1,0xc4
8000389c:	00048493          	mv	s1,s1
800038a0:	8526                	mv	a0,s1
800038a2:	a0cfd0ef          	jal	80000aae <acquire>
    log.committing = 0;
800038a6:	0004aa23          	sw	zero,20(s1) # 800c78ac <log+0x14>
    wakeup(&log);
800038aa:	8526                	mv	a0,s1
800038ac:	c1afe0ef          	jal	80001cc6 <wakeup>
    release(&log.lock);
800038b0:	8526                	mv	a0,s1
800038b2:	a80fd0ef          	jal	80000b32 <release>
}
800038b6:	a025                	j	800038de <end_op+0x8e>
800038b8:	c64e                	sw	s3,12(sp)
800038ba:	c452                	sw	s4,8(sp)
800038bc:	c256                	sw	s5,4(sp)
    panic("log.committing");
800038be:	00008517          	auipc	a0,0x8
800038c2:	c6250513          	addi	a0,a0,-926 # 8000b520 <etext+0x520>
800038c6:	ef3fc0ef          	jal	800007b8 <panic>
    wakeup(&log);
800038ca:	000c4497          	auipc	s1,0xc4
800038ce:	fce48493          	addi	s1,s1,-50 # 800c7898 <log>
800038d2:	8526                	mv	a0,s1
800038d4:	bf2fe0ef          	jal	80001cc6 <wakeup>
  release(&log.lock);
800038d8:	8526                	mv	a0,s1
800038da:	a58fd0ef          	jal	80000b32 <release>
}
800038de:	40f2                	lw	ra,28(sp)
800038e0:	4462                	lw	s0,24(sp)
800038e2:	44d2                	lw	s1,20(sp)
800038e4:	4942                	lw	s2,16(sp)
800038e6:	6105                	addi	sp,sp,32
800038e8:	8082                	ret
800038ea:	c64e                	sw	s3,12(sp)
800038ec:	c452                	sw	s4,8(sp)
800038ee:	c256                	sw	s5,4(sp)
  for (tail = 0; tail < log.lh.n; tail++) {
800038f0:	000c4a97          	auipc	s5,0xc4
800038f4:	fc8a8a93          	addi	s5,s5,-56 # 800c78b8 <log+0x20>
    struct buf *to = bread(log.dev, log.start + tail + 1); // log block
800038f8:	000c4a17          	auipc	s4,0xc4
800038fc:	fa0a0a13          	addi	s4,s4,-96 # 800c7898 <log>
80003900:	00ca2583          	lw	a1,12(s4)
80003904:	95a6                	add	a1,a1,s1
80003906:	0585                	addi	a1,a1,1
80003908:	018a2503          	lw	a0,24(s4)
8000390c:	f09fe0ef          	jal	80002814 <bread>
80003910:	892a                	mv	s2,a0
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80003912:	000aa583          	lw	a1,0(s5)
80003916:	018a2503          	lw	a0,24(s4)
8000391a:	efbfe0ef          	jal	80002814 <bread>
8000391e:	89aa                	mv	s3,a0
    memmove(to->data, from->data, BSIZE);
80003920:	40000613          	li	a2,1024
80003924:	03450593          	addi	a1,a0,52
80003928:	03490513          	addi	a0,s2,52
8000392c:	a84fd0ef          	jal	80000bb0 <memmove>
    bwrite(to); // write the log
80003930:	854a                	mv	a0,s2
80003932:	fb9fe0ef          	jal	800028ea <bwrite>
    brelse(from);
80003936:	854e                	mv	a0,s3
80003938:	fe5fe0ef          	jal	8000291c <brelse>
    brelse(to);
8000393c:	854a                	mv	a0,s2
8000393e:	fdffe0ef          	jal	8000291c <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80003942:	0485                	addi	s1,s1,1
80003944:	0a91                	addi	s5,s5,4
80003946:	01ca2783          	lw	a5,28(s4)
8000394a:	faf4cbe3          	blt	s1,a5,80003900 <end_op+0xb0>
    write_log();      // Write modified blocks from cache to log
    write_head();     // Write header to disk -- the real commit
8000394e:	39fd                	jal	8000364c <write_head>
    install_trans(0); // Now install writes to home locations
80003950:	4501                	li	a0,0
80003952:	3ba1                	jal	800036aa <install_trans>
    log.lh.n = 0;
80003954:	000c4797          	auipc	a5,0xc4
80003958:	f607a023          	sw	zero,-160(a5) # 800c78b4 <log+0x1c>
    write_head(); // Erase the transaction from the log
8000395c:	39c5                	jal	8000364c <write_head>
8000395e:	49b2                	lw	s3,12(sp)
80003960:	4a22                	lw	s4,8(sp)
80003962:	4a92                	lw	s5,4(sp)
80003964:	bf15                	j	80003898 <end_op+0x48>

80003966 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80003966:	1141                	addi	sp,sp,-16
80003968:	c606                	sw	ra,12(sp)
8000396a:	c422                	sw	s0,8(sp)
8000396c:	c226                	sw	s1,4(sp)
8000396e:	c04a                	sw	s2,0(sp)
80003970:	0800                	addi	s0,sp,16
80003972:	84aa                	mv	s1,a0
  int i;

  acquire(&log.lock);
80003974:	000c4917          	auipc	s2,0xc4
80003978:	f2490913          	addi	s2,s2,-220 # 800c7898 <log>
8000397c:	854a                	mv	a0,s2
8000397e:	930fd0ef          	jal	80000aae <acquire>
  if (log.lh.n >= LOGBLOCKS)
80003982:	01c92603          	lw	a2,28(s2)
80003986:	47f5                	li	a5,29
80003988:	04c7cc63          	blt	a5,a2,800039e0 <log_write+0x7a>
    panic("too big a transaction");
  if (log.outstanding < 1)
8000398c:	000c4797          	auipc	a5,0xc4
80003990:	f1c7a783          	lw	a5,-228(a5) # 800c78a8 <log+0x10>
80003994:	04f05c63          	blez	a5,800039ec <log_write+0x86>
    panic("log_write outside of trans");

  for (i = 0; i < log.lh.n; i++) {
80003998:	4781                	li	a5,0
8000399a:	04c05f63          	blez	a2,800039f8 <log_write+0x92>
    if (log.lh.block[i] == b->blockno) // log absorption
8000399e:	44cc                	lw	a1,12(s1)
800039a0:	000c4717          	auipc	a4,0xc4
800039a4:	f1870713          	addi	a4,a4,-232 # 800c78b8 <log+0x20>
  for (i = 0; i < log.lh.n; i++) {
800039a8:	4781                	li	a5,0
    if (log.lh.block[i] == b->blockno) // log absorption
800039aa:	4314                	lw	a3,0(a4)
800039ac:	04b68663          	beq	a3,a1,800039f8 <log_write+0x92>
  for (i = 0; i < log.lh.n; i++) {
800039b0:	0785                	addi	a5,a5,1
800039b2:	0711                	addi	a4,a4,4
800039b4:	fef61be3          	bne	a2,a5,800039aa <log_write+0x44>
      break;
  }
  log.lh.block[i] = b->blockno;
800039b8:	0611                	addi	a2,a2,4
800039ba:	060a                	slli	a2,a2,0x2
800039bc:	000c4797          	auipc	a5,0xc4
800039c0:	edc78793          	addi	a5,a5,-292 # 800c7898 <log>
800039c4:	97b2                	add	a5,a5,a2
800039c6:	44d8                	lw	a4,12(s1)
800039c8:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) { // Add new block to log?
    bpin(b);
800039ca:	8526                	mv	a0,s1
800039cc:	fd5fe0ef          	jal	800029a0 <bpin>
    log.lh.n++;
800039d0:	000c4717          	auipc	a4,0xc4
800039d4:	ec870713          	addi	a4,a4,-312 # 800c7898 <log>
800039d8:	4f5c                	lw	a5,28(a4)
800039da:	0785                	addi	a5,a5,1
800039dc:	cf5c                	sw	a5,28(a4)
800039de:	a80d                	j	80003a10 <log_write+0xaa>
    panic("too big a transaction");
800039e0:	00008517          	auipc	a0,0x8
800039e4:	b5050513          	addi	a0,a0,-1200 # 8000b530 <etext+0x530>
800039e8:	dd1fc0ef          	jal	800007b8 <panic>
    panic("log_write outside of trans");
800039ec:	00008517          	auipc	a0,0x8
800039f0:	b5c50513          	addi	a0,a0,-1188 # 8000b548 <etext+0x548>
800039f4:	dc5fc0ef          	jal	800007b8 <panic>
  log.lh.block[i] = b->blockno;
800039f8:	00478693          	addi	a3,a5,4
800039fc:	068a                	slli	a3,a3,0x2
800039fe:	000c4717          	auipc	a4,0xc4
80003a02:	e9a70713          	addi	a4,a4,-358 # 800c7898 <log>
80003a06:	9736                	add	a4,a4,a3
80003a08:	44d4                	lw	a3,12(s1)
80003a0a:	cb14                	sw	a3,16(a4)
  if (i == log.lh.n) { // Add new block to log?
80003a0c:	faf60fe3          	beq	a2,a5,800039ca <log_write+0x64>
  }
  release(&log.lock);
80003a10:	000c4517          	auipc	a0,0xc4
80003a14:	e8850513          	addi	a0,a0,-376 # 800c7898 <log>
80003a18:	91afd0ef          	jal	80000b32 <release>
}
80003a1c:	40b2                	lw	ra,12(sp)
80003a1e:	4422                	lw	s0,8(sp)
80003a20:	4492                	lw	s1,4(sp)
80003a22:	4902                	lw	s2,0(sp)
80003a24:	0141                	addi	sp,sp,16
80003a26:	8082                	ret

80003a28 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80003a28:	1141                	addi	sp,sp,-16
80003a2a:	c606                	sw	ra,12(sp)
80003a2c:	c422                	sw	s0,8(sp)
80003a2e:	c226                	sw	s1,4(sp)
80003a30:	c04a                	sw	s2,0(sp)
80003a32:	0800                	addi	s0,sp,16
80003a34:	84aa                	mv	s1,a0
80003a36:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
80003a38:	00008597          	auipc	a1,0x8
80003a3c:	b2c58593          	addi	a1,a1,-1236 # 8000b564 <etext+0x564>
80003a40:	0511                	addi	a0,a0,4
80003a42:	fedfc0ef          	jal	80000a2e <initlock>
  lk->name = name;
80003a46:	0124a823          	sw	s2,16(s1)
  lk->locked = 0;
80003a4a:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
80003a4e:	0004aa23          	sw	zero,20(s1)
}
80003a52:	40b2                	lw	ra,12(sp)
80003a54:	4422                	lw	s0,8(sp)
80003a56:	4492                	lw	s1,4(sp)
80003a58:	4902                	lw	s2,0(sp)
80003a5a:	0141                	addi	sp,sp,16
80003a5c:	8082                	ret

80003a5e <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80003a5e:	1141                	addi	sp,sp,-16
80003a60:	c606                	sw	ra,12(sp)
80003a62:	c422                	sw	s0,8(sp)
80003a64:	c226                	sw	s1,4(sp)
80003a66:	c04a                	sw	s2,0(sp)
80003a68:	0800                	addi	s0,sp,16
80003a6a:	84aa                	mv	s1,a0
  acquire(&lk->lk);
80003a6c:	00450913          	addi	s2,a0,4
80003a70:	854a                	mv	a0,s2
80003a72:	83cfd0ef          	jal	80000aae <acquire>
  while (lk->locked) {
80003a76:	409c                	lw	a5,0(s1)
80003a78:	c799                	beqz	a5,80003a86 <acquiresleep+0x28>
    sleep(lk, &lk->lk);
80003a7a:	85ca                	mv	a1,s2
80003a7c:	8526                	mv	a0,s1
80003a7e:	a00fe0ef          	jal	80001c7e <sleep>
  while (lk->locked) {
80003a82:	409c                	lw	a5,0(s1)
80003a84:	fbfd                	bnez	a5,80003a7a <acquiresleep+0x1c>
  }
  lk->locked = 1;
80003a86:	4785                	li	a5,1
80003a88:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
80003a8a:	bc7fd0ef          	jal	80001650 <myproc>
80003a8e:	4d5c                	lw	a5,28(a0)
80003a90:	c8dc                	sw	a5,20(s1)
  release(&lk->lk);
80003a92:	854a                	mv	a0,s2
80003a94:	89efd0ef          	jal	80000b32 <release>
}
80003a98:	40b2                	lw	ra,12(sp)
80003a9a:	4422                	lw	s0,8(sp)
80003a9c:	4492                	lw	s1,4(sp)
80003a9e:	4902                	lw	s2,0(sp)
80003aa0:	0141                	addi	sp,sp,16
80003aa2:	8082                	ret

80003aa4 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80003aa4:	1141                	addi	sp,sp,-16
80003aa6:	c606                	sw	ra,12(sp)
80003aa8:	c422                	sw	s0,8(sp)
80003aaa:	c226                	sw	s1,4(sp)
80003aac:	c04a                	sw	s2,0(sp)
80003aae:	0800                	addi	s0,sp,16
80003ab0:	84aa                	mv	s1,a0
  acquire(&lk->lk);
80003ab2:	00450913          	addi	s2,a0,4
80003ab6:	854a                	mv	a0,s2
80003ab8:	ff7fc0ef          	jal	80000aae <acquire>
  lk->locked = 0;
80003abc:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
80003ac0:	0004aa23          	sw	zero,20(s1)
  wakeup(lk);
80003ac4:	8526                	mv	a0,s1
80003ac6:	a00fe0ef          	jal	80001cc6 <wakeup>
  release(&lk->lk);
80003aca:	854a                	mv	a0,s2
80003acc:	866fd0ef          	jal	80000b32 <release>
}
80003ad0:	40b2                	lw	ra,12(sp)
80003ad2:	4422                	lw	s0,8(sp)
80003ad4:	4492                	lw	s1,4(sp)
80003ad6:	4902                	lw	s2,0(sp)
80003ad8:	0141                	addi	sp,sp,16
80003ada:	8082                	ret

80003adc <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
80003adc:	1101                	addi	sp,sp,-32
80003ade:	ce06                	sw	ra,28(sp)
80003ae0:	cc22                	sw	s0,24(sp)
80003ae2:	ca26                	sw	s1,20(sp)
80003ae4:	c84a                	sw	s2,16(sp)
80003ae6:	1000                	addi	s0,sp,32
80003ae8:	84aa                	mv	s1,a0
  int r;

  acquire(&lk->lk);
80003aea:	00450913          	addi	s2,a0,4
80003aee:	854a                	mv	a0,s2
80003af0:	fbffc0ef          	jal	80000aae <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
80003af4:	409c                	lw	a5,0(s1)
80003af6:	ef81                	bnez	a5,80003b0e <holdingsleep+0x32>
80003af8:	4481                	li	s1,0
  release(&lk->lk);
80003afa:	854a                	mv	a0,s2
80003afc:	836fd0ef          	jal	80000b32 <release>
  return r;
}
80003b00:	8526                	mv	a0,s1
80003b02:	40f2                	lw	ra,28(sp)
80003b04:	4462                	lw	s0,24(sp)
80003b06:	44d2                	lw	s1,20(sp)
80003b08:	4942                	lw	s2,16(sp)
80003b0a:	6105                	addi	sp,sp,32
80003b0c:	8082                	ret
80003b0e:	c64e                	sw	s3,12(sp)
  r = lk->locked && (lk->pid == myproc()->pid);
80003b10:	0144a983          	lw	s3,20(s1)
80003b14:	b3dfd0ef          	jal	80001650 <myproc>
80003b18:	4d44                	lw	s1,28(a0)
80003b1a:	413484b3          	sub	s1,s1,s3
80003b1e:	0014b493          	seqz	s1,s1
80003b22:	49b2                	lw	s3,12(sp)
80003b24:	bfd9                	j	80003afa <holdingsleep+0x1e>

80003b26 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80003b26:	1141                	addi	sp,sp,-16
80003b28:	c606                	sw	ra,12(sp)
80003b2a:	c422                	sw	s0,8(sp)
80003b2c:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
80003b2e:	00008597          	auipc	a1,0x8
80003b32:	a4258593          	addi	a1,a1,-1470 # 8000b570 <etext+0x570>
80003b36:	000c4517          	auipc	a0,0xc4
80003b3a:	e4a50513          	addi	a0,a0,-438 # 800c7980 <ftable>
80003b3e:	ef1fc0ef          	jal	80000a2e <initlock>
}
80003b42:	40b2                	lw	ra,12(sp)
80003b44:	4422                	lw	s0,8(sp)
80003b46:	0141                	addi	sp,sp,16
80003b48:	8082                	ret

80003b4a <filealloc>:

// Allocate a file structure.
struct file *
filealloc(void)
{
80003b4a:	1141                	addi	sp,sp,-16
80003b4c:	c606                	sw	ra,12(sp)
80003b4e:	c422                	sw	s0,8(sp)
80003b50:	c226                	sw	s1,4(sp)
80003b52:	0800                	addi	s0,sp,16
  struct file *f;

  acquire(&ftable.lock);
80003b54:	000c4517          	auipc	a0,0xc4
80003b58:	e2c50513          	addi	a0,a0,-468 # 800c7980 <ftable>
80003b5c:	f53fc0ef          	jal	80000aae <acquire>
  for (f = ftable.file; f < ftable.file + NFILE; f++) {
80003b60:	000c4497          	auipc	s1,0xc4
80003b64:	e2c48493          	addi	s1,s1,-468 # 800c798c <ftable+0xc>
80003b68:	000c5717          	auipc	a4,0xc5
80003b6c:	91470713          	addi	a4,a4,-1772 # 800c847c <stubs_wcache>
    if (f->ref == 0) {
80003b70:	40dc                	lw	a5,4(s1)
80003b72:	cf81                	beqz	a5,80003b8a <filealloc+0x40>
  for (f = ftable.file; f < ftable.file + NFILE; f++) {
80003b74:	04f1                	addi	s1,s1,28
80003b76:	fee49de3          	bne	s1,a4,80003b70 <filealloc+0x26>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80003b7a:	000c4517          	auipc	a0,0xc4
80003b7e:	e0650513          	addi	a0,a0,-506 # 800c7980 <ftable>
80003b82:	fb1fc0ef          	jal	80000b32 <release>
  return 0;
80003b86:	4481                	li	s1,0
80003b88:	a809                	j	80003b9a <filealloc+0x50>
      f->ref = 1;
80003b8a:	4785                	li	a5,1
80003b8c:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
80003b8e:	000c4517          	auipc	a0,0xc4
80003b92:	df250513          	addi	a0,a0,-526 # 800c7980 <ftable>
80003b96:	f9dfc0ef          	jal	80000b32 <release>
}
80003b9a:	8526                	mv	a0,s1
80003b9c:	40b2                	lw	ra,12(sp)
80003b9e:	4422                	lw	s0,8(sp)
80003ba0:	4492                	lw	s1,4(sp)
80003ba2:	0141                	addi	sp,sp,16
80003ba4:	8082                	ret

80003ba6 <filedup>:

// Increment ref count for file f.
struct file *
filedup(struct file *f)
{
80003ba6:	1141                	addi	sp,sp,-16
80003ba8:	c606                	sw	ra,12(sp)
80003baa:	c422                	sw	s0,8(sp)
80003bac:	c226                	sw	s1,4(sp)
80003bae:	0800                	addi	s0,sp,16
80003bb0:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
80003bb2:	000c4517          	auipc	a0,0xc4
80003bb6:	dce50513          	addi	a0,a0,-562 # 800c7980 <ftable>
80003bba:	ef5fc0ef          	jal	80000aae <acquire>
  if (f->ref < 1)
80003bbe:	40dc                	lw	a5,4(s1)
80003bc0:	02f05063          	blez	a5,80003be0 <filedup+0x3a>
    panic("filedup");
  f->ref++;
80003bc4:	0785                	addi	a5,a5,1
80003bc6:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
80003bc8:	000c4517          	auipc	a0,0xc4
80003bcc:	db850513          	addi	a0,a0,-584 # 800c7980 <ftable>
80003bd0:	f63fc0ef          	jal	80000b32 <release>
  return f;
}
80003bd4:	8526                	mv	a0,s1
80003bd6:	40b2                	lw	ra,12(sp)
80003bd8:	4422                	lw	s0,8(sp)
80003bda:	4492                	lw	s1,4(sp)
80003bdc:	0141                	addi	sp,sp,16
80003bde:	8082                	ret
    panic("filedup");
80003be0:	00008517          	auipc	a0,0x8
80003be4:	99850513          	addi	a0,a0,-1640 # 8000b578 <etext+0x578>
80003be8:	bd1fc0ef          	jal	800007b8 <panic>

80003bec <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80003bec:	1101                	addi	sp,sp,-32
80003bee:	ce06                	sw	ra,28(sp)
80003bf0:	cc22                	sw	s0,24(sp)
80003bf2:	ca26                	sw	s1,20(sp)
80003bf4:	1000                	addi	s0,sp,32
80003bf6:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
80003bf8:	000c4517          	auipc	a0,0xc4
80003bfc:	d8850513          	addi	a0,a0,-632 # 800c7980 <ftable>
80003c00:	eaffc0ef          	jal	80000aae <acquire>
  if (f->ref < 1)
80003c04:	40dc                	lw	a5,4(s1)
80003c06:	04f05863          	blez	a5,80003c56 <fileclose+0x6a>
    panic("fileclose");
  if (--f->ref > 0) {
80003c0a:	17fd                	addi	a5,a5,-1
80003c0c:	c0dc                	sw	a5,4(s1)
80003c0e:	04f04e63          	bgtz	a5,80003c6a <fileclose+0x7e>
80003c12:	c84a                	sw	s2,16(sp)
80003c14:	c64e                	sw	s3,12(sp)
80003c16:	c452                	sw	s4,8(sp)
80003c18:	c256                	sw	s5,4(sp)
    release(&ftable.lock);
    return;
  }
  ff = *f;
80003c1a:	0004a903          	lw	s2,0(s1)
80003c1e:	0094ca83          	lbu	s5,9(s1)
80003c22:	00c4aa03          	lw	s4,12(s1)
80003c26:	0104a983          	lw	s3,16(s1)
  f->ref = 0;
80003c2a:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
80003c2e:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
80003c32:	000c4517          	auipc	a0,0xc4
80003c36:	d4e50513          	addi	a0,a0,-690 # 800c7980 <ftable>
80003c3a:	ef9fc0ef          	jal	80000b32 <release>

  if (ff.type == FD_PIPE) {
80003c3e:	4785                	li	a5,1
80003c40:	04f90063          	beq	s2,a5,80003c80 <fileclose+0x94>
    pipeclose(ff.pipe, ff.writable);
  } else if (ff.type == FD_INODE || ff.type == FD_DEVICE) {
80003c44:	1979                	addi	s2,s2,-2
80003c46:	4785                	li	a5,1
80003c48:	0527f463          	bgeu	a5,s2,80003c90 <fileclose+0xa4>
80003c4c:	4942                	lw	s2,16(sp)
80003c4e:	49b2                	lw	s3,12(sp)
80003c50:	4a22                	lw	s4,8(sp)
80003c52:	4a92                	lw	s5,4(sp)
80003c54:	a00d                	j	80003c76 <fileclose+0x8a>
80003c56:	c84a                	sw	s2,16(sp)
80003c58:	c64e                	sw	s3,12(sp)
80003c5a:	c452                	sw	s4,8(sp)
80003c5c:	c256                	sw	s5,4(sp)
    panic("fileclose");
80003c5e:	00008517          	auipc	a0,0x8
80003c62:	92250513          	addi	a0,a0,-1758 # 8000b580 <etext+0x580>
80003c66:	b53fc0ef          	jal	800007b8 <panic>
    release(&ftable.lock);
80003c6a:	000c4517          	auipc	a0,0xc4
80003c6e:	d1650513          	addi	a0,a0,-746 # 800c7980 <ftable>
80003c72:	ec1fc0ef          	jal	80000b32 <release>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80003c76:	40f2                	lw	ra,28(sp)
80003c78:	4462                	lw	s0,24(sp)
80003c7a:	44d2                	lw	s1,20(sp)
80003c7c:	6105                	addi	sp,sp,32
80003c7e:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
80003c80:	85d6                	mv	a1,s5
80003c82:	8552                	mv	a0,s4
80003c84:	2e19                	jal	80003f9a <pipeclose>
80003c86:	4942                	lw	s2,16(sp)
80003c88:	49b2                	lw	s3,12(sp)
80003c8a:	4a22                	lw	s4,8(sp)
80003c8c:	4a92                	lw	s5,4(sp)
80003c8e:	b7e5                	j	80003c76 <fileclose+0x8a>
    begin_op();
80003c90:	b59ff0ef          	jal	800037e8 <begin_op>
    iput(ff.ip);
80003c94:	854e                	mv	a0,s3
80003c96:	b78ff0ef          	jal	8000300e <iput>
    end_op();
80003c9a:	bb7ff0ef          	jal	80003850 <end_op>
80003c9e:	4942                	lw	s2,16(sp)
80003ca0:	49b2                	lw	s3,12(sp)
80003ca2:	4a22                	lw	s4,8(sp)
80003ca4:	4a92                	lw	s5,4(sp)
80003ca6:	bfc1                	j	80003c76 <fileclose+0x8a>

80003ca8 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
80003ca8:	7179                	addi	sp,sp,-48
80003caa:	d606                	sw	ra,44(sp)
80003cac:	d422                	sw	s0,40(sp)
80003cae:	d226                	sw	s1,36(sp)
80003cb0:	ce4e                	sw	s3,28(sp)
80003cb2:	1800                	addi	s0,sp,48
80003cb4:	84aa                	mv	s1,a0
80003cb6:	89ae                	mv	s3,a1
  struct proc *p = myproc();
80003cb8:	999fd0ef          	jal	80001650 <myproc>
  struct stat st;

  if (f->type == FD_INODE || f->type == FD_DEVICE) {
80003cbc:	409c                	lw	a5,0(s1)
80003cbe:	17f9                	addi	a5,a5,-2
80003cc0:	4705                	li	a4,1
80003cc2:	02f76f63          	bltu	a4,a5,80003d00 <filestat+0x58>
80003cc6:	d04a                	sw	s2,32(sp)
80003cc8:	892a                	mv	s2,a0
    ilock(f->ip);
80003cca:	4888                	lw	a0,16(s1)
80003ccc:	9caff0ef          	jal	80002e96 <ilock>
    stati(f->ip, &st);
80003cd0:	fd040593          	addi	a1,s0,-48
80003cd4:	4888                	lw	a0,16(s1)
80003cd6:	cfeff0ef          	jal	800031d4 <stati>
    iunlock(f->ip);
80003cda:	4888                	lw	a0,16(s1)
80003cdc:	a66ff0ef          	jal	80002f42 <iunlock>
    if (copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
80003ce0:	46c1                	li	a3,16
80003ce2:	fd040613          	addi	a2,s0,-48
80003ce6:	85ce                	mv	a1,s3
80003ce8:	02c92503          	lw	a0,44(s2)
80003cec:	e6efd0ef          	jal	8000135a <copyout>
80003cf0:	857d                	srai	a0,a0,0x1f
80003cf2:	5902                	lw	s2,32(sp)
      return -1;
    return 0;
  }
  return -1;
}
80003cf4:	50b2                	lw	ra,44(sp)
80003cf6:	5422                	lw	s0,40(sp)
80003cf8:	5492                	lw	s1,36(sp)
80003cfa:	49f2                	lw	s3,28(sp)
80003cfc:	6145                	addi	sp,sp,48
80003cfe:	8082                	ret
  return -1;
80003d00:	557d                	li	a0,-1
80003d02:	bfcd                	j	80003cf4 <filestat+0x4c>

80003d04 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
80003d04:	1101                	addi	sp,sp,-32
80003d06:	ce06                	sw	ra,28(sp)
80003d08:	cc22                	sw	s0,24(sp)
80003d0a:	c84a                	sw	s2,16(sp)
80003d0c:	1000                	addi	s0,sp,32
  int r = 0;

  if (f->readable == 0)
80003d0e:	00854783          	lbu	a5,8(a0)
80003d12:	cfc9                	beqz	a5,80003dac <fileread+0xa8>
80003d14:	ca26                	sw	s1,20(sp)
80003d16:	c64e                	sw	s3,12(sp)
80003d18:	84aa                	mv	s1,a0
80003d1a:	89ae                	mv	s3,a1
80003d1c:	8932                	mv	s2,a2
    return -1;

  if (f->type == FD_PIPE) {
80003d1e:	411c                	lw	a5,0(a0)
80003d20:	4705                	li	a4,1
80003d22:	04e78363          	beq	a5,a4,80003d68 <fileread+0x64>
    r = piperead(f->pipe, addr, n);
  } else if (f->type == FD_DEVICE) {
80003d26:	470d                	li	a4,3
80003d28:	04e78663          	beq	a5,a4,80003d74 <fileread+0x70>
    if (f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
      return -1;
    r = devsw[f->major].read(1, addr, n);
  } else if (f->type == FD_INODE) {
80003d2c:	4709                	li	a4,2
80003d2e:	06e79963          	bne	a5,a4,80003da0 <fileread+0x9c>
    ilock(f->ip);
80003d32:	4908                	lw	a0,16(a0)
80003d34:	962ff0ef          	jal	80002e96 <ilock>
    if ((r = readi(f->ip, 1, addr, f->off, n)) > 0)
80003d38:	874a                	mv	a4,s2
80003d3a:	48d4                	lw	a3,20(s1)
80003d3c:	864e                	mv	a2,s3
80003d3e:	4585                	li	a1,1
80003d40:	4888                	lw	a0,16(s1)
80003d42:	cbaff0ef          	jal	800031fc <readi>
80003d46:	892a                	mv	s2,a0
80003d48:	00a05563          	blez	a0,80003d52 <fileread+0x4e>
      f->off += r;
80003d4c:	48dc                	lw	a5,20(s1)
80003d4e:	97aa                	add	a5,a5,a0
80003d50:	c8dc                	sw	a5,20(s1)
    iunlock(f->ip);
80003d52:	4888                	lw	a0,16(s1)
80003d54:	9eeff0ef          	jal	80002f42 <iunlock>
80003d58:	44d2                	lw	s1,20(sp)
80003d5a:	49b2                	lw	s3,12(sp)
  } else {
    panic("fileread");
  }

  return r;
}
80003d5c:	854a                	mv	a0,s2
80003d5e:	40f2                	lw	ra,28(sp)
80003d60:	4462                	lw	s0,24(sp)
80003d62:	4942                	lw	s2,16(sp)
80003d64:	6105                	addi	sp,sp,32
80003d66:	8082                	ret
    r = piperead(f->pipe, addr, n);
80003d68:	4548                	lw	a0,12(a0)
80003d6a:	2e8d                	jal	800040dc <piperead>
80003d6c:	892a                	mv	s2,a0
80003d6e:	44d2                	lw	s1,20(sp)
80003d70:	49b2                	lw	s3,12(sp)
80003d72:	b7ed                	j	80003d5c <fileread+0x58>
    if (f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
80003d74:	01851783          	lh	a5,24(a0)
80003d78:	01079693          	slli	a3,a5,0x10
80003d7c:	82c1                	srli	a3,a3,0x10
80003d7e:	4725                	li	a4,9
80003d80:	02d76863          	bltu	a4,a3,80003db0 <fileread+0xac>
80003d84:	078e                	slli	a5,a5,0x3
80003d86:	000c4717          	auipc	a4,0xc4
80003d8a:	baa70713          	addi	a4,a4,-1110 # 800c7930 <devsw>
80003d8e:	97ba                	add	a5,a5,a4
80003d90:	439c                	lw	a5,0(a5)
80003d92:	c39d                	beqz	a5,80003db8 <fileread+0xb4>
    r = devsw[f->major].read(1, addr, n);
80003d94:	4505                	li	a0,1
80003d96:	9782                	jalr	a5
80003d98:	892a                	mv	s2,a0
80003d9a:	44d2                	lw	s1,20(sp)
80003d9c:	49b2                	lw	s3,12(sp)
80003d9e:	bf7d                	j	80003d5c <fileread+0x58>
    panic("fileread");
80003da0:	00007517          	auipc	a0,0x7
80003da4:	7ec50513          	addi	a0,a0,2028 # 8000b58c <etext+0x58c>
80003da8:	a11fc0ef          	jal	800007b8 <panic>
    return -1;
80003dac:	597d                	li	s2,-1
80003dae:	b77d                	j	80003d5c <fileread+0x58>
      return -1;
80003db0:	597d                	li	s2,-1
80003db2:	44d2                	lw	s1,20(sp)
80003db4:	49b2                	lw	s3,12(sp)
80003db6:	b75d                	j	80003d5c <fileread+0x58>
80003db8:	597d                	li	s2,-1
80003dba:	44d2                	lw	s1,20(sp)
80003dbc:	49b2                	lw	s3,12(sp)
80003dbe:	bf79                	j	80003d5c <fileread+0x58>

80003dc0 <filewrite>:
int
filewrite(struct file *f, uint64 addr, int n)
{
  int r, ret = 0;

  if (f->writable == 0)
80003dc0:	00954783          	lbu	a5,9(a0)
80003dc4:	0e078e63          	beqz	a5,80003ec0 <filewrite+0x100>
{
80003dc8:	7179                	addi	sp,sp,-48
80003dca:	d606                	sw	ra,44(sp)
80003dcc:	d422                	sw	s0,40(sp)
80003dce:	d04a                	sw	s2,32(sp)
80003dd0:	ca56                	sw	s5,20(sp)
80003dd2:	c65e                	sw	s7,12(sp)
80003dd4:	1800                	addi	s0,sp,48
80003dd6:	892a                	mv	s2,a0
80003dd8:	8bae                	mv	s7,a1
80003dda:	8ab2                	mv	s5,a2
    return -1;

  if (f->type == FD_PIPE) {
80003ddc:	411c                	lw	a5,0(a0)
80003dde:	4705                	li	a4,1
80003de0:	02e78363          	beq	a5,a4,80003e06 <filewrite+0x46>
    ret = pipewrite(f->pipe, addr, n);
  } else if (f->type == FD_DEVICE) {
80003de4:	470d                	li	a4,3
80003de6:	02e78363          	beq	a5,a4,80003e0c <filewrite+0x4c>
    if (f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if (f->type == FD_INODE) {
80003dea:	4709                	li	a4,2
80003dec:	0ce79063          	bne	a5,a4,80003eac <filewrite+0xec>
80003df0:	ce4e                	sw	s3,28(sp)
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    int max = ((MAXOPBLOCKS - 1 - 1 - 2) / 2) * BSIZE;
    int i = 0;
    while (i < n) {
80003df2:	08c05d63          	blez	a2,80003e8c <filewrite+0xcc>
80003df6:	d226                	sw	s1,36(sp)
80003df8:	cc52                	sw	s4,24(sp)
80003dfa:	c85a                	sw	s6,16(sp)
    int i = 0;
80003dfc:	4981                	li	s3,0
      int n1 = n - i;
      if (n1 > max)
80003dfe:	6b05                	lui	s6,0x1
80003e00:	c00b0b13          	addi	s6,s6,-1024 # c00 <_entry-0x7ffff400>
80003e04:	a895                	j	80003e78 <filewrite+0xb8>
    ret = pipewrite(f->pipe, addr, n);
80003e06:	4548                	lw	a0,12(a0)
80003e08:	2ac5                	jal	80003ff8 <pipewrite>
80003e0a:	a851                	j	80003e9e <filewrite+0xde>
    if (f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
80003e0c:	01851783          	lh	a5,24(a0)
80003e10:	01079693          	slli	a3,a5,0x10
80003e14:	82c1                	srli	a3,a3,0x10
80003e16:	4725                	li	a4,9
80003e18:	0ad76663          	bltu	a4,a3,80003ec4 <filewrite+0x104>
80003e1c:	078e                	slli	a5,a5,0x3
80003e1e:	000c4717          	auipc	a4,0xc4
80003e22:	b1270713          	addi	a4,a4,-1262 # 800c7930 <devsw>
80003e26:	97ba                	add	a5,a5,a4
80003e28:	43dc                	lw	a5,4(a5)
80003e2a:	cfd9                	beqz	a5,80003ec8 <filewrite+0x108>
    ret = devsw[f->major].write(1, addr, n);
80003e2c:	4505                	li	a0,1
80003e2e:	9782                	jalr	a5
80003e30:	a0bd                	j	80003e9e <filewrite+0xde>
        n1 = max;

      begin_op();
80003e32:	9b7ff0ef          	jal	800037e8 <begin_op>
      ilock(f->ip);
80003e36:	01092503          	lw	a0,16(s2)
80003e3a:	85cff0ef          	jal	80002e96 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
80003e3e:	8752                	mv	a4,s4
80003e40:	01492683          	lw	a3,20(s2)
80003e44:	01798633          	add	a2,s3,s7
80003e48:	4585                	li	a1,1
80003e4a:	01092503          	lw	a0,16(s2)
80003e4e:	c8aff0ef          	jal	800032d8 <writei>
80003e52:	84aa                	mv	s1,a0
80003e54:	00a05763          	blez	a0,80003e62 <filewrite+0xa2>
        f->off += r;
80003e58:	01492783          	lw	a5,20(s2)
80003e5c:	97aa                	add	a5,a5,a0
80003e5e:	00f92a23          	sw	a5,20(s2)
      iunlock(f->ip);
80003e62:	01092503          	lw	a0,16(s2)
80003e66:	8dcff0ef          	jal	80002f42 <iunlock>
      end_op();
80003e6a:	9e7ff0ef          	jal	80003850 <end_op>

      if (r != n1) {
80003e6e:	029a1163          	bne	s4,s1,80003e90 <filewrite+0xd0>
        // error from writei
        break;
      }
      i += r;
80003e72:	99a6                	add	s3,s3,s1
    while (i < n) {
80003e74:	0159d863          	bge	s3,s5,80003e84 <filewrite+0xc4>
      int n1 = n - i;
80003e78:	413a8a33          	sub	s4,s5,s3
      if (n1 > max)
80003e7c:	fb4b5be3          	bge	s6,s4,80003e32 <filewrite+0x72>
80003e80:	8a5a                	mv	s4,s6
80003e82:	bf45                	j	80003e32 <filewrite+0x72>
80003e84:	5492                	lw	s1,36(sp)
80003e86:	4a62                	lw	s4,24(sp)
80003e88:	4b42                	lw	s6,16(sp)
80003e8a:	a031                	j	80003e96 <filewrite+0xd6>
    int i = 0;
80003e8c:	4981                	li	s3,0
80003e8e:	a021                	j	80003e96 <filewrite+0xd6>
80003e90:	5492                	lw	s1,36(sp)
80003e92:	4a62                	lw	s4,24(sp)
80003e94:	4b42                	lw	s6,16(sp)
    }
    ret = (i == n ? n : -1);
80003e96:	033a9b63          	bne	s5,s3,80003ecc <filewrite+0x10c>
80003e9a:	8556                	mv	a0,s5
80003e9c:	49f2                	lw	s3,28(sp)
  } else {
    panic("filewrite");
  }

  return ret;
}
80003e9e:	50b2                	lw	ra,44(sp)
80003ea0:	5422                	lw	s0,40(sp)
80003ea2:	5902                	lw	s2,32(sp)
80003ea4:	4ad2                	lw	s5,20(sp)
80003ea6:	4bb2                	lw	s7,12(sp)
80003ea8:	6145                	addi	sp,sp,48
80003eaa:	8082                	ret
80003eac:	d226                	sw	s1,36(sp)
80003eae:	ce4e                	sw	s3,28(sp)
80003eb0:	cc52                	sw	s4,24(sp)
80003eb2:	c85a                	sw	s6,16(sp)
    panic("filewrite");
80003eb4:	00007517          	auipc	a0,0x7
80003eb8:	6e450513          	addi	a0,a0,1764 # 8000b598 <etext+0x598>
80003ebc:	8fdfc0ef          	jal	800007b8 <panic>
    return -1;
80003ec0:	557d                	li	a0,-1
}
80003ec2:	8082                	ret
      return -1;
80003ec4:	557d                	li	a0,-1
80003ec6:	bfe1                	j	80003e9e <filewrite+0xde>
80003ec8:	557d                	li	a0,-1
80003eca:	bfd1                	j	80003e9e <filewrite+0xde>
    ret = (i == n ? n : -1);
80003ecc:	557d                	li	a0,-1
80003ece:	49f2                	lw	s3,28(sp)
80003ed0:	b7f9                	j	80003e9e <filewrite+0xde>

80003ed2 <pipealloc>:
  int writeopen; // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80003ed2:	1101                	addi	sp,sp,-32
80003ed4:	ce06                	sw	ra,28(sp)
80003ed6:	cc22                	sw	s0,24(sp)
80003ed8:	ca26                	sw	s1,20(sp)
80003eda:	c452                	sw	s4,8(sp)
80003edc:	1000                	addi	s0,sp,32
80003ede:	84aa                	mv	s1,a0
80003ee0:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
80003ee2:	0005a023          	sw	zero,0(a1)
80003ee6:	00052023          	sw	zero,0(a0)
  if ((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
80003eea:	c61ff0ef          	jal	80003b4a <filealloc>
80003eee:	c088                	sw	a0,0(s1)
80003ef0:	c549                	beqz	a0,80003f7a <pipealloc+0xa8>
80003ef2:	c59ff0ef          	jal	80003b4a <filealloc>
80003ef6:	00aa2023          	sw	a0,0(s4)
80003efa:	cd25                	beqz	a0,80003f72 <pipealloc+0xa0>
80003efc:	c84a                	sw	s2,16(sp)
    goto bad;
  if ((pi = (struct pipe *)kalloc()) == 0)
80003efe:	ae9fc0ef          	jal	800009e6 <kalloc>
80003f02:	892a                	mv	s2,a0
80003f04:	c12d                	beqz	a0,80003f66 <pipealloc+0x94>
80003f06:	c64e                	sw	s3,12(sp)
    goto bad;
  pi->readopen = 1;
80003f08:	4985                	li	s3,1
80003f0a:	21352a23          	sw	s3,532(a0)
  pi->writeopen = 1;
80003f0e:	21352c23          	sw	s3,536(a0)
  pi->nwrite = 0;
80003f12:	20052823          	sw	zero,528(a0)
  pi->nread = 0;
80003f16:	20052623          	sw	zero,524(a0)
  initlock(&pi->lock, "pipe");
80003f1a:	00007597          	auipc	a1,0x7
80003f1e:	68a58593          	addi	a1,a1,1674 # 8000b5a4 <etext+0x5a4>
80003f22:	b0dfc0ef          	jal	80000a2e <initlock>
  (*f0)->type = FD_PIPE;
80003f26:	409c                	lw	a5,0(s1)
80003f28:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
80003f2c:	409c                	lw	a5,0(s1)
80003f2e:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
80003f32:	409c                	lw	a5,0(s1)
80003f34:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
80003f38:	409c                	lw	a5,0(s1)
80003f3a:	0127a623          	sw	s2,12(a5)
  (*f1)->type = FD_PIPE;
80003f3e:	000a2783          	lw	a5,0(s4)
80003f42:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
80003f46:	000a2783          	lw	a5,0(s4)
80003f4a:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
80003f4e:	000a2783          	lw	a5,0(s4)
80003f52:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
80003f56:	000a2783          	lw	a5,0(s4)
80003f5a:	0127a623          	sw	s2,12(a5)
  return 0;
80003f5e:	4501                	li	a0,0
80003f60:	4942                	lw	s2,16(sp)
80003f62:	49b2                	lw	s3,12(sp)
80003f64:	a01d                	j	80003f8a <pipealloc+0xb8>

bad:
  if (pi)
    kfree((char *)pi);
  if (*f0)
80003f66:	4088                	lw	a0,0(s1)
80003f68:	c119                	beqz	a0,80003f6e <pipealloc+0x9c>
80003f6a:	4942                	lw	s2,16(sp)
80003f6c:	a029                	j	80003f76 <pipealloc+0xa4>
80003f6e:	4942                	lw	s2,16(sp)
80003f70:	a029                	j	80003f7a <pipealloc+0xa8>
80003f72:	4088                	lw	a0,0(s1)
80003f74:	c10d                	beqz	a0,80003f96 <pipealloc+0xc4>
    fileclose(*f0);
80003f76:	c77ff0ef          	jal	80003bec <fileclose>
  if (*f1)
80003f7a:	000a2783          	lw	a5,0(s4)
    fileclose(*f1);
  return -1;
80003f7e:	557d                	li	a0,-1
  if (*f1)
80003f80:	c789                	beqz	a5,80003f8a <pipealloc+0xb8>
    fileclose(*f1);
80003f82:	853e                	mv	a0,a5
80003f84:	c69ff0ef          	jal	80003bec <fileclose>
  return -1;
80003f88:	557d                	li	a0,-1
}
80003f8a:	40f2                	lw	ra,28(sp)
80003f8c:	4462                	lw	s0,24(sp)
80003f8e:	44d2                	lw	s1,20(sp)
80003f90:	4a22                	lw	s4,8(sp)
80003f92:	6105                	addi	sp,sp,32
80003f94:	8082                	ret
  return -1;
80003f96:	557d                	li	a0,-1
80003f98:	bfcd                	j	80003f8a <pipealloc+0xb8>

80003f9a <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
80003f9a:	1141                	addi	sp,sp,-16
80003f9c:	c606                	sw	ra,12(sp)
80003f9e:	c422                	sw	s0,8(sp)
80003fa0:	c226                	sw	s1,4(sp)
80003fa2:	c04a                	sw	s2,0(sp)
80003fa4:	0800                	addi	s0,sp,16
80003fa6:	84aa                	mv	s1,a0
80003fa8:	892e                	mv	s2,a1
  acquire(&pi->lock);
80003faa:	b05fc0ef          	jal	80000aae <acquire>
  if (writable) {
80003fae:	02090763          	beqz	s2,80003fdc <pipeclose+0x42>
    pi->writeopen = 0;
80003fb2:	2004ac23          	sw	zero,536(s1)
    wakeup(&pi->nread);
80003fb6:	20c48513          	addi	a0,s1,524
80003fba:	d0dfd0ef          	jal	80001cc6 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if (pi->readopen == 0 && pi->writeopen == 0) {
80003fbe:	2144a783          	lw	a5,532(s1)
80003fc2:	e781                	bnez	a5,80003fca <pipeclose+0x30>
80003fc4:	2184a783          	lw	a5,536(s1)
80003fc8:	c38d                	beqz	a5,80003fea <pipeclose+0x50>
    release(&pi->lock);
    kfree((char *)pi);
  } else
    release(&pi->lock);
80003fca:	8526                	mv	a0,s1
80003fcc:	b67fc0ef          	jal	80000b32 <release>
}
80003fd0:	40b2                	lw	ra,12(sp)
80003fd2:	4422                	lw	s0,8(sp)
80003fd4:	4492                	lw	s1,4(sp)
80003fd6:	4902                	lw	s2,0(sp)
80003fd8:	0141                	addi	sp,sp,16
80003fda:	8082                	ret
    pi->readopen = 0;
80003fdc:	2004aa23          	sw	zero,532(s1)
    wakeup(&pi->nwrite);
80003fe0:	21048513          	addi	a0,s1,528
80003fe4:	ce3fd0ef          	jal	80001cc6 <wakeup>
80003fe8:	bfd9                	j	80003fbe <pipeclose+0x24>
    release(&pi->lock);
80003fea:	8526                	mv	a0,s1
80003fec:	b47fc0ef          	jal	80000b32 <release>
    kfree((char *)pi);
80003ff0:	8526                	mv	a0,s1
80003ff2:	921fc0ef          	jal	80000912 <kfree>
80003ff6:	bfe9                	j	80003fd0 <pipeclose+0x36>

80003ff8 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
80003ff8:	7139                	addi	sp,sp,-64
80003ffa:	de06                	sw	ra,60(sp)
80003ffc:	dc22                	sw	s0,56(sp)
80003ffe:	da26                	sw	s1,52(sp)
80004000:	d84a                	sw	s2,48(sp)
80004002:	d64e                	sw	s3,44(sp)
80004004:	d452                	sw	s4,40(sp)
80004006:	d256                	sw	s5,36(sp)
80004008:	0080                	addi	s0,sp,64
8000400a:	84aa                	mv	s1,a0
8000400c:	8aae                	mv	s5,a1
8000400e:	8a32                	mv	s4,a2
  int i = 0;
  struct proc *pr = myproc();
80004010:	e40fd0ef          	jal	80001650 <myproc>
80004014:	89aa                	mv	s3,a0

  acquire(&pi->lock);
80004016:	8526                	mv	a0,s1
80004018:	a97fc0ef          	jal	80000aae <acquire>
  while (i < n) {
8000401c:	0b405a63          	blez	s4,800040d0 <pipewrite+0xd8>
80004020:	d05a                	sw	s6,32(sp)
80004022:	ce5e                	sw	s7,28(sp)
80004024:	cc62                	sw	s8,24(sp)
  int i = 0;
80004026:	4901                	li	s2,0
    if (pi->nwrite == pi->nread + PIPESIZE) { //DOC: pipewrite-full
      wakeup(&pi->nread);
      sleep(&pi->nwrite, &pi->lock);
    } else {
      char ch;
      if (copyin(pr->pagetable, &ch, addr + i, 1) == -1)
80004028:	5b7d                	li	s6,-1
      wakeup(&pi->nread);
8000402a:	20c48c13          	addi	s8,s1,524
      sleep(&pi->nwrite, &pi->lock);
8000402e:	21048b93          	addi	s7,s1,528
80004032:	a81d                	j	80004068 <pipewrite+0x70>
      release(&pi->lock);
80004034:	8526                	mv	a0,s1
80004036:	afdfc0ef          	jal	80000b32 <release>
      return -1;
8000403a:	597d                	li	s2,-1
8000403c:	5b02                	lw	s6,32(sp)
8000403e:	4bf2                	lw	s7,28(sp)
80004040:	4c62                	lw	s8,24(sp)
  }
  wakeup(&pi->nread);
  release(&pi->lock);

  return i;
}
80004042:	854a                	mv	a0,s2
80004044:	50f2                	lw	ra,60(sp)
80004046:	5462                	lw	s0,56(sp)
80004048:	54d2                	lw	s1,52(sp)
8000404a:	5942                	lw	s2,48(sp)
8000404c:	59b2                	lw	s3,44(sp)
8000404e:	5a22                	lw	s4,40(sp)
80004050:	5a92                	lw	s5,36(sp)
80004052:	6121                	addi	sp,sp,64
80004054:	8082                	ret
      wakeup(&pi->nread);
80004056:	8562                	mv	a0,s8
80004058:	c6ffd0ef          	jal	80001cc6 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
8000405c:	85a6                	mv	a1,s1
8000405e:	855e                	mv	a0,s7
80004060:	c1ffd0ef          	jal	80001c7e <sleep>
  while (i < n) {
80004064:	05495b63          	bge	s2,s4,800040ba <pipewrite+0xc2>
    if (pi->readopen == 0 || killed(pr)) {
80004068:	2144a783          	lw	a5,532(s1)
8000406c:	d7e1                	beqz	a5,80004034 <pipewrite+0x3c>
8000406e:	854e                	mv	a0,s3
80004070:	e3bfd0ef          	jal	80001eaa <killed>
80004074:	f161                	bnez	a0,80004034 <pipewrite+0x3c>
    if (pi->nwrite == pi->nread + PIPESIZE) { //DOC: pipewrite-full
80004076:	20c4a783          	lw	a5,524(s1)
8000407a:	20078793          	addi	a5,a5,512
8000407e:	2104a703          	lw	a4,528(s1)
80004082:	fcf70ae3          	beq	a4,a5,80004056 <pipewrite+0x5e>
      if (copyin(pr->pagetable, &ch, addr + i, 1) == -1)
80004086:	4685                	li	a3,1
80004088:	01590633          	add	a2,s2,s5
8000408c:	fcf40593          	addi	a1,s0,-49
80004090:	02c9a503          	lw	a0,44(s3)
80004094:	b46fd0ef          	jal	800013da <copyin>
80004098:	03650e63          	beq	a0,s6,800040d4 <pipewrite+0xdc>
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
8000409c:	2104a783          	lw	a5,528(s1)
800040a0:	00178713          	addi	a4,a5,1
800040a4:	20e4a823          	sw	a4,528(s1)
800040a8:	1ff7f793          	andi	a5,a5,511
800040ac:	97a6                	add	a5,a5,s1
800040ae:	fcf44703          	lbu	a4,-49(s0)
800040b2:	00e78623          	sb	a4,12(a5)
      i++;
800040b6:	0905                	addi	s2,s2,1
800040b8:	b775                	j	80004064 <pipewrite+0x6c>
800040ba:	5b02                	lw	s6,32(sp)
800040bc:	4bf2                	lw	s7,28(sp)
800040be:	4c62                	lw	s8,24(sp)
  wakeup(&pi->nread);
800040c0:	20c48513          	addi	a0,s1,524
800040c4:	c03fd0ef          	jal	80001cc6 <wakeup>
  release(&pi->lock);
800040c8:	8526                	mv	a0,s1
800040ca:	a69fc0ef          	jal	80000b32 <release>
  return i;
800040ce:	bf95                	j	80004042 <pipewrite+0x4a>
  int i = 0;
800040d0:	4901                	li	s2,0
800040d2:	b7fd                	j	800040c0 <pipewrite+0xc8>
800040d4:	5b02                	lw	s6,32(sp)
800040d6:	4bf2                	lw	s7,28(sp)
800040d8:	4c62                	lw	s8,24(sp)
800040da:	b7dd                	j	800040c0 <pipewrite+0xc8>

800040dc <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
800040dc:	7179                	addi	sp,sp,-48
800040de:	d606                	sw	ra,44(sp)
800040e0:	d422                	sw	s0,40(sp)
800040e2:	d226                	sw	s1,36(sp)
800040e4:	d04a                	sw	s2,32(sp)
800040e6:	ce4e                	sw	s3,28(sp)
800040e8:	cc52                	sw	s4,24(sp)
800040ea:	ca56                	sw	s5,20(sp)
800040ec:	1800                	addi	s0,sp,48
800040ee:	84aa                	mv	s1,a0
800040f0:	8aae                	mv	s5,a1
800040f2:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
800040f4:	d5cfd0ef          	jal	80001650 <myproc>
800040f8:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
800040fa:	8526                	mv	a0,s1
800040fc:	9b3fc0ef          	jal	80000aae <acquire>
  while (pi->nread == pi->nwrite && pi->writeopen) { //DOC: pipe-empty
80004100:	20c4a703          	lw	a4,524(s1)
80004104:	2104a783          	lw	a5,528(s1)
    if (killed(pr)) {
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
80004108:	20c48913          	addi	s2,s1,524
  while (pi->nread == pi->nwrite && pi->writeopen) { //DOC: pipe-empty
8000410c:	02f71563          	bne	a4,a5,80004136 <piperead+0x5a>
80004110:	2184a783          	lw	a5,536(s1)
80004114:	cb85                	beqz	a5,80004144 <piperead+0x68>
    if (killed(pr)) {
80004116:	854e                	mv	a0,s3
80004118:	d93fd0ef          	jal	80001eaa <killed>
8000411c:	ed19                	bnez	a0,8000413a <piperead+0x5e>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
8000411e:	85a6                	mv	a1,s1
80004120:	854a                	mv	a0,s2
80004122:	b5dfd0ef          	jal	80001c7e <sleep>
  while (pi->nread == pi->nwrite && pi->writeopen) { //DOC: pipe-empty
80004126:	20c4a703          	lw	a4,524(s1)
8000412a:	2104a783          	lw	a5,528(s1)
8000412e:	fef701e3          	beq	a4,a5,80004110 <piperead+0x34>
80004132:	c85a                	sw	s6,16(sp)
80004134:	a809                	j	80004146 <piperead+0x6a>
80004136:	c85a                	sw	s6,16(sp)
80004138:	a039                	j	80004146 <piperead+0x6a>
      release(&pi->lock);
8000413a:	8526                	mv	a0,s1
8000413c:	9f7fc0ef          	jal	80000b32 <release>
      return -1;
80004140:	597d                	li	s2,-1
80004142:	a8b9                	j	800041a0 <piperead+0xc4>
80004144:	c85a                	sw	s6,16(sp)
  }
  for (i = 0; i < n; i++) { //DOC: piperead-copy
80004146:	4901                	li	s2,0
    if (pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread % PIPESIZE];
    if (copyout(pr->pagetable, addr + i, &ch, 1) == -1) {
80004148:	5b7d                	li	s6,-1
  for (i = 0; i < n; i++) { //DOC: piperead-copy
8000414a:	05405363          	blez	s4,80004190 <piperead+0xb4>
    if (pi->nread == pi->nwrite)
8000414e:	20c4a783          	lw	a5,524(s1)
80004152:	2104a703          	lw	a4,528(s1)
80004156:	02e78d63          	beq	a5,a4,80004190 <piperead+0xb4>
    ch = pi->data[pi->nread % PIPESIZE];
8000415a:	1ff7f793          	andi	a5,a5,511
8000415e:	97a6                	add	a5,a5,s1
80004160:	00c7c783          	lbu	a5,12(a5)
80004164:	fcf40fa3          	sb	a5,-33(s0)
    if (copyout(pr->pagetable, addr + i, &ch, 1) == -1) {
80004168:	4685                	li	a3,1
8000416a:	fdf40613          	addi	a2,s0,-33
8000416e:	015905b3          	add	a1,s2,s5
80004172:	02c9a503          	lw	a0,44(s3)
80004176:	9e4fd0ef          	jal	8000135a <copyout>
8000417a:	03650d63          	beq	a0,s6,800041b4 <piperead+0xd8>
      if (i == 0)
        i = -1;
      break;
    }
    pi->nread++;
8000417e:	20c4a783          	lw	a5,524(s1)
80004182:	0785                	addi	a5,a5,1
80004184:	20f4a623          	sw	a5,524(s1)
  for (i = 0; i < n; i++) { //DOC: piperead-copy
80004188:	0905                	addi	s2,s2,1
8000418a:	fd2a12e3          	bne	s4,s2,8000414e <piperead+0x72>
8000418e:	8952                	mv	s2,s4
  }
  wakeup(&pi->nwrite); //DOC: piperead-wakeup
80004190:	21048513          	addi	a0,s1,528
80004194:	b33fd0ef          	jal	80001cc6 <wakeup>
  release(&pi->lock);
80004198:	8526                	mv	a0,s1
8000419a:	999fc0ef          	jal	80000b32 <release>
8000419e:	4b42                	lw	s6,16(sp)
  return i;
}
800041a0:	854a                	mv	a0,s2
800041a2:	50b2                	lw	ra,44(sp)
800041a4:	5422                	lw	s0,40(sp)
800041a6:	5492                	lw	s1,36(sp)
800041a8:	5902                	lw	s2,32(sp)
800041aa:	49f2                	lw	s3,28(sp)
800041ac:	4a62                	lw	s4,24(sp)
800041ae:	4ad2                	lw	s5,20(sp)
800041b0:	6145                	addi	sp,sp,48
800041b2:	8082                	ret
      if (i == 0)
800041b4:	fc091ee3          	bnez	s2,80004190 <piperead+0xb4>
        i = -1;
800041b8:	892a                	mv	s2,a0
800041ba:	bfd9                	j	80004190 <piperead+0xb4>

800041bc <flags2perm>:
static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

// map ELF permissions to PTE permission bits.
int
flags2perm(int flags)
{
800041bc:	1141                	addi	sp,sp,-16
800041be:	c622                	sw	s0,12(sp)
800041c0:	0800                	addi	s0,sp,16
800041c2:	87aa                	mv	a5,a0
  int perm = 0;
  if (flags & 0x1)
800041c4:	8905                	andi	a0,a0,1
800041c6:	050e                	slli	a0,a0,0x3
    perm = PTE_X;
  if (flags & 0x2)
800041c8:	8b89                	andi	a5,a5,2
800041ca:	c399                	beqz	a5,800041d0 <flags2perm+0x14>
    perm |= PTE_W;
800041cc:	00456513          	ori	a0,a0,4
  return perm;
}
800041d0:	4432                	lw	s0,12(sp)
800041d2:	0141                	addi	sp,sp,16
800041d4:	8082                	ret

800041d6 <kexec>:
//
// the implementation of the exec() system call
//
int
kexec(char *path, char **argv)
{
800041d6:	7169                	addi	sp,sp,-304
800041d8:	12112623          	sw	ra,300(sp)
800041dc:	12812423          	sw	s0,296(sp)
800041e0:	12912223          	sw	s1,292(sp)
800041e4:	11712623          	sw	s7,268(sp)
800041e8:	1a00                	addi	s0,sp,304
800041ea:	8baa                	mv	s7,a0
800041ec:	ecb42e23          	sw	a1,-292(s0)
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  struct proc *p = myproc();
800041f0:	c60fd0ef          	jal	80001650 <myproc>
800041f4:	84aa                	mv	s1,a0

  begin_op();
800041f6:	df2ff0ef          	jal	800037e8 <begin_op>

  // Open the executable file.
  if ((ip = namei(path)) == 0) {
800041fa:	855e                	mv	a0,s7
800041fc:	c22ff0ef          	jal	8000361e <namei>
80004200:	cd29                	beqz	a0,8000425a <kexec+0x84>
80004202:	11312e23          	sw	s3,284(sp)
80004206:	89aa                	mv	s3,a0
    end_op();
    return -1;
  }
  ilock(ip);
80004208:	c8ffe0ef          	jal	80002e96 <ilock>

  // Read the ELF header.
  if (readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
8000420c:	03400713          	li	a4,52
80004210:	4681                	li	a3,0
80004212:	f0c40613          	addi	a2,s0,-244
80004216:	4581                	li	a1,0
80004218:	854e                	mv	a0,s3
8000421a:	fe3fe0ef          	jal	800031fc <readi>
8000421e:	03400793          	li	a5,52
80004222:	00f51a63          	bne	a0,a5,80004236 <kexec+0x60>
    goto bad;

  // Is this really an ELF file?
  if (elf.magic != ELF_MAGIC)
80004226:	f0c42703          	lw	a4,-244(s0)
8000422a:	464c47b7          	lui	a5,0x464c4
8000422e:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
80004232:	02f70863          	beq	a4,a5,80004262 <kexec+0x8c>

bad:
  if (pagetable)
    proc_freepagetable(pagetable, sz);
  if (ip) {
    iunlockput(ip);
80004236:	854e                	mv	a0,s3
80004238:	e5bfe0ef          	jal	80003092 <iunlockput>
    end_op();
8000423c:	e14ff0ef          	jal	80003850 <end_op>
  }
  return -1;
80004240:	557d                	li	a0,-1
80004242:	11c12983          	lw	s3,284(sp)
}
80004246:	12c12083          	lw	ra,300(sp)
8000424a:	12812403          	lw	s0,296(sp)
8000424e:	12412483          	lw	s1,292(sp)
80004252:	10c12b83          	lw	s7,268(sp)
80004256:	6155                	addi	sp,sp,304
80004258:	8082                	ret
    end_op();
8000425a:	df6ff0ef          	jal	80003850 <end_op>
    return -1;
8000425e:	557d                	li	a0,-1
80004260:	b7dd                	j	80004246 <kexec+0x70>
80004262:	11612823          	sw	s6,272(sp)
  if ((pagetable = proc_pagetable(p)) == 0)
80004266:	8526                	mv	a0,s1
80004268:	ceafd0ef          	jal	80001752 <proc_pagetable>
8000426c:	8b2a                	mv	s6,a0
8000426e:	3c050463          	beqz	a0,80004636 <kexec+0x460>
80004272:	11a12023          	sw	s10,256(sp)
  if (mappages(pagetable, 0x60000000, 0x40000, 0x60000000, PTE_R | PTE_W | PTE_U) != 0)
80004276:	4759                	li	a4,22
80004278:	600006b7          	lui	a3,0x60000
8000427c:	00040637          	lui	a2,0x40
80004280:	600005b7          	lui	a1,0x60000
80004284:	bb3fc0ef          	jal	80000e36 <mappages>
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
80004288:	4d01                	li	s10,0
  if (mappages(pagetable, 0x60000000, 0x40000, 0x60000000, PTE_R | PTE_W | PTE_U) != 0)
8000428a:	38051363          	bnez	a0,80004610 <kexec+0x43a>
8000428e:	dfee                	sw	s11,252(sp)
  if (mappages(pagetable, 0x60040000, 0x1000, 0x60040000, PTE_R | PTE_W | PTE_U) != 0)
80004290:	4759                	li	a4,22
80004292:	600406b7          	lui	a3,0x60040
80004296:	6605                	lui	a2,0x1
80004298:	600405b7          	lui	a1,0x60040
8000429c:	855a                	mv	a0,s6
8000429e:	b99fc0ef          	jal	80000e36 <mappages>
800042a2:	8daa                	mv	s11,a0
800042a4:	38051c63          	bnez	a0,8000463c <kexec+0x466>
800042a8:	13212023          	sw	s2,288(sp)
800042ac:	11412c23          	sw	s4,280(sp)
800042b0:	11512a23          	sw	s5,276(sp)
800042b4:	11812423          	sw	s8,264(sp)
800042b8:	11912223          	sw	s9,260(sp)
  for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
800042bc:	f2842683          	lw	a3,-216(s0)
800042c0:	f3845783          	lhu	a5,-200(s0)
800042c4:	cbf1                	beqz	a5,80004398 <kexec+0x1c2>
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
800042c6:	4a81                	li	s5,0
    if (ph.vaddr % PGSIZE != 0)
800042c8:	6a05                	lui	s4,0x1
800042ca:	fffa0793          	addi	a5,s4,-1 # fff <_entry-0x7ffff001>
800042ce:	ecf42a23          	sw	a5,-300(s0)
800042d2:	a891                	j	80004326 <kexec+0x150>
  uint64 pa;

  for (i = 0; i < sz; i += PGSIZE) {
    pa = walkaddr(pagetable, va + i);
    if (pa == 0)
      panic("loadseg: address should exist");
800042d4:	00007517          	auipc	a0,0x7
800042d8:	2d850513          	addi	a0,a0,728 # 8000b5ac <etext+0x5ac>
800042dc:	cdcfc0ef          	jal	800007b8 <panic>
    if (sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if (readi(ip, 0, (uint64)pa, offset + i, n) != n)
800042e0:	874a                	mv	a4,s2
800042e2:	009c86b3          	add	a3,s9,s1
800042e6:	4581                	li	a1,0
800042e8:	854e                	mv	a0,s3
800042ea:	f13fe0ef          	jal	800031fc <readi>
800042ee:	30a91663          	bne	s2,a0,800045fa <kexec+0x424>
  for (i = 0; i < sz; i += PGSIZE) {
800042f2:	94d2                	add	s1,s1,s4
800042f4:	0154ff63          	bgeu	s1,s5,80004312 <kexec+0x13c>
    pa = walkaddr(pagetable, va + i);
800042f8:	009c05b3          	add	a1,s8,s1
800042fc:	855a                	mv	a0,s6
800042fe:	b01fc0ef          	jal	80000dfe <walkaddr>
80004302:	862a                	mv	a2,a0
    if (pa == 0)
80004304:	d961                	beqz	a0,800042d4 <kexec+0xfe>
    if (sz - i < PGSIZE)
80004306:	409a8933          	sub	s2,s5,s1
8000430a:	fd2a7be3          	bgeu	s4,s2,800042e0 <kexec+0x10a>
8000430e:	8952                	mv	s2,s4
80004310:	bfc1                	j	800042e0 <kexec+0x10a>
    sz = sz1;
80004312:	8aea                	mv	s5,s10
  for (i = 0, off = elf.phoff; i < elf.phnum; i++, off += sizeof(ph)) {
80004314:	0d85                	addi	s11,s11,1
80004316:	ed842783          	lw	a5,-296(s0)
8000431a:	02078693          	addi	a3,a5,32
8000431e:	f3845783          	lhu	a5,-200(s0)
80004322:	06fddc63          	bge	s11,a5,8000439a <kexec+0x1c4>
    if (readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
80004326:	ecd42c23          	sw	a3,-296(s0)
8000432a:	02000713          	li	a4,32
8000432e:	eec40613          	addi	a2,s0,-276
80004332:	4581                	li	a1,0
80004334:	854e                	mv	a0,s3
80004336:	ec7fe0ef          	jal	800031fc <readi>
8000433a:	02000793          	li	a5,32
8000433e:	20f51163          	bne	a0,a5,80004540 <kexec+0x36a>
    if (ph.type != ELF_PROG_LOAD)
80004342:	eec42783          	lw	a5,-276(s0)
80004346:	4705                	li	a4,1
80004348:	fce796e3          	bne	a5,a4,80004314 <kexec+0x13e>
    if (ph.memsz < ph.filesz)
8000434c:	f0042903          	lw	s2,-256(s0)
80004350:	efc42783          	lw	a5,-260(s0)
80004354:	20f96363          	bltu	s2,a5,8000455a <kexec+0x384>
    if (ph.vaddr + ph.memsz < ph.vaddr)
80004358:	ef442483          	lw	s1,-268(s0)
8000435c:	9926                	add	s2,s2,s1
8000435e:	20996b63          	bltu	s2,s1,80004574 <kexec+0x39e>
    if (ph.vaddr % PGSIZE != 0)
80004362:	ed442783          	lw	a5,-300(s0)
80004366:	8cfd                	and	s1,s1,a5
80004368:	22049363          	bnez	s1,8000458e <kexec+0x3b8>
    if ((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz,
8000436c:	f0442503          	lw	a0,-252(s0)
80004370:	35b1                	jal	800041bc <flags2perm>
80004372:	86aa                	mv	a3,a0
80004374:	864a                	mv	a2,s2
80004376:	85d6                	mv	a1,s5
80004378:	855a                	mv	a0,s6
8000437a:	d21fc0ef          	jal	8000109a <uvmalloc>
8000437e:	8d2a                	mv	s10,a0
80004380:	22050463          	beqz	a0,800045a8 <kexec+0x3d2>
    if (loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
80004384:	ef442c03          	lw	s8,-268(s0)
80004388:	ef042c83          	lw	s9,-272(s0)
8000438c:	efc42a83          	lw	s5,-260(s0)
  for (i = 0; i < sz; i += PGSIZE) {
80004390:	f60a94e3          	bnez	s5,800042f8 <kexec+0x122>
    sz = sz1;
80004394:	8aaa                	mv	s5,a0
80004396:	bfbd                	j	80004314 <kexec+0x13e>
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
80004398:	4a81                	li	s5,0
  iunlockput(ip);
8000439a:	854e                	mv	a0,s3
8000439c:	cf7fe0ef          	jal	80003092 <iunlockput>
  end_op();
800043a0:	cb0ff0ef          	jal	80003850 <end_op>
  p = myproc();
800043a4:	aacfd0ef          	jal	80001650 <myproc>
800043a8:	8c2a                	mv	s8,a0
  uint64 oldsz = p->sz;
800043aa:	02852d83          	lw	s11,40(a0)
  sz = PGROUNDUP(sz);
800043ae:	6d05                	lui	s10,0x1
800043b0:	1d7d                	addi	s10,s10,-1 # fff <_entry-0x7ffff001>
800043b2:	9d56                	add	s10,s10,s5
800043b4:	77fd                	lui	a5,0xfffff
800043b6:	00fd7d33          	and	s10,s10,a5
  if ((sz1 = uvmalloc(pagetable, sz, sz + (USERSTACK + 1) * PGSIZE, PTE_W)) ==
800043ba:	4691                	li	a3,4
800043bc:	6609                	lui	a2,0x2
800043be:	966a                	add	a2,a2,s10
800043c0:	85ea                	mv	a1,s10
800043c2:	855a                	mv	a0,s6
800043c4:	cd7fc0ef          	jal	8000109a <uvmalloc>
800043c8:	8aaa                	mv	s5,a0
  ip = 0;
800043ca:	4981                	li	s3,0
  if ((sz1 = uvmalloc(pagetable, sz, sz + (USERSTACK + 1) * PGSIZE, PTE_W)) ==
800043cc:	ed09                	bnez	a0,800043e6 <kexec+0x210>
800043ce:	12012903          	lw	s2,288(sp)
800043d2:	11812a03          	lw	s4,280(sp)
800043d6:	11412a83          	lw	s5,276(sp)
800043da:	10812c03          	lw	s8,264(sp)
800043de:	10412c83          	lw	s9,260(sp)
800043e2:	5dfe                	lw	s11,252(sp)
800043e4:	a435                	j	80004610 <kexec+0x43a>
  uvmclear(pagetable, sz - (USERSTACK + 1) * PGSIZE);
800043e6:	75f9                	lui	a1,0xffffe
800043e8:	95aa                	add	a1,a1,a0
800043ea:	855a                	mv	a0,s6
800043ec:	f47fc0ef          	jal	80001332 <uvmclear>
  stackbase = sp - USERSTACK * PGSIZE;
800043f0:	7cfd                	lui	s9,0xfffff
800043f2:	9cd6                	add	s9,s9,s5
  for (argc = 0; argv[argc]; argc++) {
800043f4:	edc42783          	lw	a5,-292(s0)
800043f8:	4388                	lw	a0,0(a5)
800043fa:	cd25                	beqz	a0,80004472 <kexec+0x29c>
800043fc:	f4040993          	addi	s3,s0,-192
80004400:	fc040d13          	addi	s10,s0,-64
  sp = sz;
80004404:	8956                	mv	s2,s5
  for (argc = 0; argv[argc]; argc++) {
80004406:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
80004408:	89dfc0ef          	jal	80000ca4 <strlen>
8000440c:	00150793          	addi	a5,a0,1
80004410:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
80004414:	ff07f913          	andi	s2,a5,-16
    if (sp < stackbase)
80004418:	1b996563          	bltu	s2,s9,800045c2 <kexec+0x3ec>
    if (copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
8000441c:	edc42783          	lw	a5,-292(s0)
80004420:	0007aa03          	lw	s4,0(a5) # fffff000 <end+0x7ff2ea84>
80004424:	8552                	mv	a0,s4
80004426:	87ffc0ef          	jal	80000ca4 <strlen>
8000442a:	00150693          	addi	a3,a0,1
8000442e:	8652                	mv	a2,s4
80004430:	85ca                	mv	a1,s2
80004432:	855a                	mv	a0,s6
80004434:	f27fc0ef          	jal	8000135a <copyout>
80004438:	1a054363          	bltz	a0,800045de <kexec+0x408>
    ustack[argc] = sp;
8000443c:	0129a023          	sw	s2,0(s3)
  for (argc = 0; argv[argc]; argc++) {
80004440:	0485                	addi	s1,s1,1
80004442:	edc42783          	lw	a5,-292(s0)
80004446:	0791                	addi	a5,a5,4
80004448:	ecf42e23          	sw	a5,-292(s0)
8000444c:	4388                	lw	a0,0(a5)
8000444e:	c505                	beqz	a0,80004476 <kexec+0x2a0>
    if (argc >= MAXARG)
80004450:	0991                	addi	s3,s3,4
80004452:	fba99be3          	bne	s3,s10,80004408 <kexec+0x232>
  sz = sz1;
80004456:	8d56                	mv	s10,s5
  ip = 0;
80004458:	4981                	li	s3,0
8000445a:	12012903          	lw	s2,288(sp)
8000445e:	11812a03          	lw	s4,280(sp)
80004462:	11412a83          	lw	s5,276(sp)
80004466:	10812c03          	lw	s8,264(sp)
8000446a:	10412c83          	lw	s9,260(sp)
8000446e:	5dfe                	lw	s11,252(sp)
80004470:	a245                	j	80004610 <kexec+0x43a>
  sp = sz;
80004472:	8956                	mv	s2,s5
  for (argc = 0; argv[argc]; argc++) {
80004474:	4481                	li	s1,0
  ustack[argc] = 0;
80004476:	00249793          	slli	a5,s1,0x2
8000447a:	fc078793          	addi	a5,a5,-64
8000447e:	97a2                	add	a5,a5,s0
80004480:	f807a023          	sw	zero,-128(a5)
  sp -= (argc + 1) * sizeof(uint64);
80004484:	00148693          	addi	a3,s1,1
80004488:	068a                	slli	a3,a3,0x2
8000448a:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
8000448e:	ff097913          	andi	s2,s2,-16
  if (sp < stackbase)
80004492:	03997063          	bgeu	s2,s9,800044b2 <kexec+0x2dc>
  sz = sz1;
80004496:	8d56                	mv	s10,s5
  ip = 0;
80004498:	4981                	li	s3,0
8000449a:	12012903          	lw	s2,288(sp)
8000449e:	11812a03          	lw	s4,280(sp)
800044a2:	11412a83          	lw	s5,276(sp)
800044a6:	10812c03          	lw	s8,264(sp)
800044aa:	10412c83          	lw	s9,260(sp)
800044ae:	5dfe                	lw	s11,252(sp)
800044b0:	a285                	j	80004610 <kexec+0x43a>
  if (copyout(pagetable, sp, (char *)ustack, (argc + 1) * sizeof(uint64)) < 0)
800044b2:	f4040613          	addi	a2,s0,-192
800044b6:	85ca                	mv	a1,s2
800044b8:	855a                	mv	a0,s6
800044ba:	ea1fc0ef          	jal	8000135a <copyout>
800044be:	18054263          	bltz	a0,80004642 <kexec+0x46c>
  p->trapframe->a1 = sp;
800044c2:	030c2783          	lw	a5,48(s8)
800044c6:	0327ae23          	sw	s2,60(a5)
  for (last = s = path; *s; s++)
800044ca:	000bc703          	lbu	a4,0(s7)
800044ce:	cf11                	beqz	a4,800044ea <kexec+0x314>
800044d0:	001b8793          	addi	a5,s7,1
    if (*s == '/')
800044d4:	02f00693          	li	a3,47
800044d8:	a029                	j	800044e2 <kexec+0x30c>
  for (last = s = path; *s; s++)
800044da:	0785                	addi	a5,a5,1
800044dc:	fff7c703          	lbu	a4,-1(a5)
800044e0:	c709                	beqz	a4,800044ea <kexec+0x314>
    if (*s == '/')
800044e2:	fed71ce3          	bne	a4,a3,800044da <kexec+0x304>
      last = s + 1;
800044e6:	8bbe                	mv	s7,a5
800044e8:	bfcd                	j	800044da <kexec+0x304>
  safestrcpy(p->name, last, sizeof(p->name));
800044ea:	4641                	li	a2,16
800044ec:	85de                	mv	a1,s7
800044ee:	0b0c0513          	addi	a0,s8,176
800044f2:	f84fc0ef          	jal	80000c76 <safestrcpy>
  oldpagetable = p->pagetable;
800044f6:	02cc2503          	lw	a0,44(s8)
  p->pagetable = pagetable;
800044fa:	036c2623          	sw	s6,44(s8)
  p->sz = sz;
800044fe:	035c2423          	sw	s5,40(s8)
  p->trapframe->epc = elf.entry; // initial program counter = ulib.c:start()
80004502:	030c2783          	lw	a5,48(s8)
80004506:	f2442703          	lw	a4,-220(s0)
8000450a:	c7d8                	sw	a4,12(a5)
  p->trapframe->sp = sp;         // initial stack pointer
8000450c:	030c2783          	lw	a5,48(s8)
80004510:	0127ac23          	sw	s2,24(a5)
  proc_freepagetable(oldpagetable, oldsz);
80004514:	85ee                	mv	a1,s11
80004516:	aaefd0ef          	jal	800017c4 <proc_freepagetable>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
8000451a:	8526                	mv	a0,s1
8000451c:	12012903          	lw	s2,288(sp)
80004520:	11c12983          	lw	s3,284(sp)
80004524:	11812a03          	lw	s4,280(sp)
80004528:	11412a83          	lw	s5,276(sp)
8000452c:	11012b03          	lw	s6,272(sp)
80004530:	10812c03          	lw	s8,264(sp)
80004534:	10412c83          	lw	s9,260(sp)
80004538:	10012d03          	lw	s10,256(sp)
8000453c:	5dfe                	lw	s11,252(sp)
8000453e:	b321                	j	80004246 <kexec+0x70>
80004540:	8d56                	mv	s10,s5
80004542:	12012903          	lw	s2,288(sp)
80004546:	11812a03          	lw	s4,280(sp)
8000454a:	11412a83          	lw	s5,276(sp)
8000454e:	10812c03          	lw	s8,264(sp)
80004552:	10412c83          	lw	s9,260(sp)
80004556:	5dfe                	lw	s11,252(sp)
80004558:	a865                	j	80004610 <kexec+0x43a>
8000455a:	8d56                	mv	s10,s5
8000455c:	12012903          	lw	s2,288(sp)
80004560:	11812a03          	lw	s4,280(sp)
80004564:	11412a83          	lw	s5,276(sp)
80004568:	10812c03          	lw	s8,264(sp)
8000456c:	10412c83          	lw	s9,260(sp)
80004570:	5dfe                	lw	s11,252(sp)
80004572:	a879                	j	80004610 <kexec+0x43a>
80004574:	8d56                	mv	s10,s5
80004576:	12012903          	lw	s2,288(sp)
8000457a:	11812a03          	lw	s4,280(sp)
8000457e:	11412a83          	lw	s5,276(sp)
80004582:	10812c03          	lw	s8,264(sp)
80004586:	10412c83          	lw	s9,260(sp)
8000458a:	5dfe                	lw	s11,252(sp)
8000458c:	a051                	j	80004610 <kexec+0x43a>
8000458e:	8d56                	mv	s10,s5
80004590:	12012903          	lw	s2,288(sp)
80004594:	11812a03          	lw	s4,280(sp)
80004598:	11412a83          	lw	s5,276(sp)
8000459c:	10812c03          	lw	s8,264(sp)
800045a0:	10412c83          	lw	s9,260(sp)
800045a4:	5dfe                	lw	s11,252(sp)
800045a6:	a0ad                	j	80004610 <kexec+0x43a>
800045a8:	8d56                	mv	s10,s5
800045aa:	12012903          	lw	s2,288(sp)
800045ae:	11812a03          	lw	s4,280(sp)
800045b2:	11412a83          	lw	s5,276(sp)
800045b6:	10812c03          	lw	s8,264(sp)
800045ba:	10412c83          	lw	s9,260(sp)
800045be:	5dfe                	lw	s11,252(sp)
800045c0:	a881                	j	80004610 <kexec+0x43a>
  sz = sz1;
800045c2:	8d56                	mv	s10,s5
  ip = 0;
800045c4:	4981                	li	s3,0
800045c6:	12012903          	lw	s2,288(sp)
800045ca:	11812a03          	lw	s4,280(sp)
800045ce:	11412a83          	lw	s5,276(sp)
800045d2:	10812c03          	lw	s8,264(sp)
800045d6:	10412c83          	lw	s9,260(sp)
800045da:	5dfe                	lw	s11,252(sp)
800045dc:	a815                	j	80004610 <kexec+0x43a>
  sz = sz1;
800045de:	8d56                	mv	s10,s5
  ip = 0;
800045e0:	4981                	li	s3,0
800045e2:	12012903          	lw	s2,288(sp)
800045e6:	11812a03          	lw	s4,280(sp)
800045ea:	11412a83          	lw	s5,276(sp)
800045ee:	10812c03          	lw	s8,264(sp)
800045f2:	10412c83          	lw	s9,260(sp)
800045f6:	5dfe                	lw	s11,252(sp)
800045f8:	a821                	j	80004610 <kexec+0x43a>
800045fa:	12012903          	lw	s2,288(sp)
800045fe:	11812a03          	lw	s4,280(sp)
80004602:	11412a83          	lw	s5,276(sp)
80004606:	10812c03          	lw	s8,264(sp)
8000460a:	10412c83          	lw	s9,260(sp)
8000460e:	5dfe                	lw	s11,252(sp)
    proc_freepagetable(pagetable, sz);
80004610:	85ea                	mv	a1,s10
80004612:	855a                	mv	a0,s6
80004614:	9b0fd0ef          	jal	800017c4 <proc_freepagetable>
  return -1;
80004618:	557d                	li	a0,-1
  if (ip) {
8000461a:	00099963          	bnez	s3,8000462c <kexec+0x456>
8000461e:	11c12983          	lw	s3,284(sp)
80004622:	11012b03          	lw	s6,272(sp)
80004626:	10012d03          	lw	s10,256(sp)
8000462a:	b931                	j	80004246 <kexec+0x70>
8000462c:	11012b03          	lw	s6,272(sp)
80004630:	10012d03          	lw	s10,256(sp)
80004634:	b109                	j	80004236 <kexec+0x60>
80004636:	11012b03          	lw	s6,272(sp)
8000463a:	bef5                	j	80004236 <kexec+0x60>
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
8000463c:	4d01                	li	s10,0
8000463e:	5dfe                	lw	s11,252(sp)
80004640:	bfc1                	j	80004610 <kexec+0x43a>
  sz = sz1;
80004642:	8d56                	mv	s10,s5
  ip = 0;
80004644:	4981                	li	s3,0
  if (pagetable)
80004646:	12012903          	lw	s2,288(sp)
8000464a:	11812a03          	lw	s4,280(sp)
8000464e:	11412a83          	lw	s5,276(sp)
80004652:	10812c03          	lw	s8,264(sp)
80004656:	10412c83          	lw	s9,260(sp)
8000465a:	5dfe                	lw	s11,252(sp)
8000465c:	bf55                	j	80004610 <kexec+0x43a>

8000465e <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
8000465e:	1101                	addi	sp,sp,-32
80004660:	ce06                	sw	ra,28(sp)
80004662:	cc22                	sw	s0,24(sp)
80004664:	ca26                	sw	s1,20(sp)
80004666:	c84a                	sw	s2,16(sp)
80004668:	1000                	addi	s0,sp,32
8000466a:	892e                	mv	s2,a1
8000466c:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  argint(n, &fd);
8000466e:	fec40593          	addi	a1,s0,-20
80004672:	e85fd0ef          	jal	800024f6 <argint>
  if (fd < 0 || fd >= NOFILE || (f = myproc()->ofile[fd]) == 0)
80004676:	fec42703          	lw	a4,-20(s0)
8000467a:	47bd                	li	a5,15
8000467c:	02e7e963          	bltu	a5,a4,800046ae <argfd+0x50>
80004680:	fd1fc0ef          	jal	80001650 <myproc>
80004684:	fec42703          	lw	a4,-20(s0)
80004688:	01870793          	addi	a5,a4,24
8000468c:	078a                	slli	a5,a5,0x2
8000468e:	953e                	add	a0,a0,a5
80004690:	455c                	lw	a5,12(a0)
80004692:	c385                	beqz	a5,800046b2 <argfd+0x54>
    return -1;
  if (pfd)
80004694:	00090463          	beqz	s2,8000469c <argfd+0x3e>
    *pfd = fd;
80004698:	00e92023          	sw	a4,0(s2)
  if (pf)
    *pf = f;
  return 0;
8000469c:	4501                	li	a0,0
  if (pf)
8000469e:	c091                	beqz	s1,800046a2 <argfd+0x44>
    *pf = f;
800046a0:	c09c                	sw	a5,0(s1)
}
800046a2:	40f2                	lw	ra,28(sp)
800046a4:	4462                	lw	s0,24(sp)
800046a6:	44d2                	lw	s1,20(sp)
800046a8:	4942                	lw	s2,16(sp)
800046aa:	6105                	addi	sp,sp,32
800046ac:	8082                	ret
    return -1;
800046ae:	557d                	li	a0,-1
800046b0:	bfcd                	j	800046a2 <argfd+0x44>
800046b2:	557d                	li	a0,-1
800046b4:	b7fd                	j	800046a2 <argfd+0x44>

800046b6 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
800046b6:	1141                	addi	sp,sp,-16
800046b8:	c606                	sw	ra,12(sp)
800046ba:	c422                	sw	s0,8(sp)
800046bc:	c226                	sw	s1,4(sp)
800046be:	0800                	addi	s0,sp,16
800046c0:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
800046c2:	f8ffc0ef          	jal	80001650 <myproc>
800046c6:	862a                	mv	a2,a0

  for (fd = 0; fd < NOFILE; fd++) {
800046c8:	06c50793          	addi	a5,a0,108
800046cc:	4501                	li	a0,0
800046ce:	46c1                	li	a3,16
    if (p->ofile[fd] == 0) {
800046d0:	4398                	lw	a4,0(a5)
800046d2:	cb19                	beqz	a4,800046e8 <fdalloc+0x32>
  for (fd = 0; fd < NOFILE; fd++) {
800046d4:	0505                	addi	a0,a0,1
800046d6:	0791                	addi	a5,a5,4
800046d8:	fed51ce3          	bne	a0,a3,800046d0 <fdalloc+0x1a>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
800046dc:	557d                	li	a0,-1
}
800046de:	40b2                	lw	ra,12(sp)
800046e0:	4422                	lw	s0,8(sp)
800046e2:	4492                	lw	s1,4(sp)
800046e4:	0141                	addi	sp,sp,16
800046e6:	8082                	ret
      p->ofile[fd] = f;
800046e8:	01850793          	addi	a5,a0,24
800046ec:	078a                	slli	a5,a5,0x2
800046ee:	963e                	add	a2,a2,a5
800046f0:	c644                	sw	s1,12(a2)
      return fd;
800046f2:	b7f5                	j	800046de <fdalloc+0x28>

800046f4 <create>:
  return -1;
}

static struct inode *
create(char *path, short type, short major, short minor)
{
800046f4:	7179                	addi	sp,sp,-48
800046f6:	d606                	sw	ra,44(sp)
800046f8:	d422                	sw	s0,40(sp)
800046fa:	d226                	sw	s1,36(sp)
800046fc:	d04a                	sw	s2,32(sp)
800046fe:	ce4e                	sw	s3,28(sp)
80004700:	ca56                	sw	s5,20(sp)
80004702:	c85a                	sw	s6,16(sp)
80004704:	1800                	addi	s0,sp,48
80004706:	8b2e                	mv	s6,a1
80004708:	89b2                	mv	s3,a2
8000470a:	8936                	mv	s2,a3
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if ((dp = nameiparent(path, name)) == 0)
8000470c:	fd040593          	addi	a1,s0,-48
80004710:	f27fe0ef          	jal	80003636 <nameiparent>
80004714:	84aa                	mv	s1,a0
80004716:	10050a63          	beqz	a0,8000482a <create+0x136>
    return 0;

  ilock(dp);
8000471a:	f7cfe0ef          	jal	80002e96 <ilock>

  if ((ip = dirlookup(dp, name, 0)) != 0) {
8000471e:	4601                	li	a2,0
80004720:	fd040593          	addi	a1,s0,-48
80004724:	8526                	mv	a0,s1
80004726:	cb5fe0ef          	jal	800033da <dirlookup>
8000472a:	8aaa                	mv	s5,a0
8000472c:	c129                	beqz	a0,8000476e <create+0x7a>
    iunlockput(dp);
8000472e:	8526                	mv	a0,s1
80004730:	963fe0ef          	jal	80003092 <iunlockput>
    ilock(ip);
80004734:	8556                	mv	a0,s5
80004736:	f60fe0ef          	jal	80002e96 <ilock>
    if (type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
8000473a:	4789                	li	a5,2
8000473c:	02fb1463          	bne	s6,a5,80004764 <create+0x70>
80004740:	028ad783          	lhu	a5,40(s5)
80004744:	17f9                	addi	a5,a5,-2
80004746:	07c2                	slli	a5,a5,0x10
80004748:	83c1                	srli	a5,a5,0x10
8000474a:	4705                	li	a4,1
8000474c:	00f76c63          	bltu	a4,a5,80004764 <create+0x70>
  ip->nlink = 0;
  iupdate(ip);
  iunlockput(ip);
  iunlockput(dp);
  return 0;
}
80004750:	8556                	mv	a0,s5
80004752:	50b2                	lw	ra,44(sp)
80004754:	5422                	lw	s0,40(sp)
80004756:	5492                	lw	s1,36(sp)
80004758:	5902                	lw	s2,32(sp)
8000475a:	49f2                	lw	s3,28(sp)
8000475c:	4ad2                	lw	s5,20(sp)
8000475e:	4b42                	lw	s6,16(sp)
80004760:	6145                	addi	sp,sp,48
80004762:	8082                	ret
    iunlockput(ip);
80004764:	8556                	mv	a0,s5
80004766:	92dfe0ef          	jal	80003092 <iunlockput>
    return 0;
8000476a:	4a81                	li	s5,0
8000476c:	b7d5                	j	80004750 <create+0x5c>
8000476e:	cc52                	sw	s4,24(sp)
  if ((ip = ialloc(dp->dev, type)) == 0) {
80004770:	85da                	mv	a1,s6
80004772:	4088                	lw	a0,0(s1)
80004774:	dbcfe0ef          	jal	80002d30 <ialloc>
80004778:	8a2a                	mv	s4,a0
8000477a:	cd15                	beqz	a0,800047b6 <create+0xc2>
  ilock(ip);
8000477c:	f1afe0ef          	jal	80002e96 <ilock>
  ip->major = major;
80004780:	033a1523          	sh	s3,42(s4)
  ip->minor = minor;
80004784:	032a1623          	sh	s2,44(s4)
  ip->nlink = 1;
80004788:	4905                	li	s2,1
8000478a:	032a1723          	sh	s2,46(s4)
  iupdate(ip);
8000478e:	8552                	mv	a0,s4
80004790:	e54fe0ef          	jal	80002de4 <iupdate>
  if (type == T_DIR) { // Create . and .. entries.
80004794:	032b0763          	beq	s6,s2,800047c2 <create+0xce>
  if (dirlink(dp, name, ip->inum) < 0)
80004798:	004a2603          	lw	a2,4(s4)
8000479c:	fd040593          	addi	a1,s0,-48
800047a0:	8526                	mv	a0,s1
800047a2:	debfe0ef          	jal	8000358c <dirlink>
800047a6:	06054563          	bltz	a0,80004810 <create+0x11c>
  iunlockput(dp);
800047aa:	8526                	mv	a0,s1
800047ac:	8e7fe0ef          	jal	80003092 <iunlockput>
  return ip;
800047b0:	8ad2                	mv	s5,s4
800047b2:	4a62                	lw	s4,24(sp)
800047b4:	bf71                	j	80004750 <create+0x5c>
    iunlockput(dp);
800047b6:	8526                	mv	a0,s1
800047b8:	8dbfe0ef          	jal	80003092 <iunlockput>
    return 0;
800047bc:	8ad2                	mv	s5,s4
800047be:	4a62                	lw	s4,24(sp)
800047c0:	bf41                	j	80004750 <create+0x5c>
    if (dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
800047c2:	004a2603          	lw	a2,4(s4)
800047c6:	00007597          	auipc	a1,0x7
800047ca:	e0658593          	addi	a1,a1,-506 # 8000b5cc <etext+0x5cc>
800047ce:	8552                	mv	a0,s4
800047d0:	dbdfe0ef          	jal	8000358c <dirlink>
800047d4:	02054e63          	bltz	a0,80004810 <create+0x11c>
800047d8:	40d0                	lw	a2,4(s1)
800047da:	00007597          	auipc	a1,0x7
800047de:	df658593          	addi	a1,a1,-522 # 8000b5d0 <etext+0x5d0>
800047e2:	8552                	mv	a0,s4
800047e4:	da9fe0ef          	jal	8000358c <dirlink>
800047e8:	02054463          	bltz	a0,80004810 <create+0x11c>
  if (dirlink(dp, name, ip->inum) < 0)
800047ec:	004a2603          	lw	a2,4(s4)
800047f0:	fd040593          	addi	a1,s0,-48
800047f4:	8526                	mv	a0,s1
800047f6:	d97fe0ef          	jal	8000358c <dirlink>
800047fa:	00054b63          	bltz	a0,80004810 <create+0x11c>
    dp->nlink++; // for ".."
800047fe:	02e4d783          	lhu	a5,46(s1)
80004802:	0785                	addi	a5,a5,1
80004804:	02f49723          	sh	a5,46(s1)
    iupdate(dp);
80004808:	8526                	mv	a0,s1
8000480a:	ddafe0ef          	jal	80002de4 <iupdate>
8000480e:	bf71                	j	800047aa <create+0xb6>
  ip->nlink = 0;
80004810:	020a1723          	sh	zero,46(s4)
  iupdate(ip);
80004814:	8552                	mv	a0,s4
80004816:	dcefe0ef          	jal	80002de4 <iupdate>
  iunlockput(ip);
8000481a:	8552                	mv	a0,s4
8000481c:	877fe0ef          	jal	80003092 <iunlockput>
  iunlockput(dp);
80004820:	8526                	mv	a0,s1
80004822:	871fe0ef          	jal	80003092 <iunlockput>
  return 0;
80004826:	4a62                	lw	s4,24(sp)
80004828:	b725                	j	80004750 <create+0x5c>
    return 0;
8000482a:	8aaa                	mv	s5,a0
8000482c:	b715                	j	80004750 <create+0x5c>

8000482e <sys_dup>:
{
8000482e:	1101                	addi	sp,sp,-32
80004830:	ce06                	sw	ra,28(sp)
80004832:	cc22                	sw	s0,24(sp)
80004834:	1000                	addi	s0,sp,32
  if (argfd(0, 0, &f) < 0)
80004836:	fec40613          	addi	a2,s0,-20
8000483a:	4581                	li	a1,0
8000483c:	4501                	li	a0,0
8000483e:	3505                	jal	8000465e <argfd>
    return -1;
80004840:	57fd                	li	a5,-1
  if (argfd(0, 0, &f) < 0)
80004842:	02054263          	bltz	a0,80004866 <sys_dup+0x38>
80004846:	ca26                	sw	s1,20(sp)
80004848:	c84a                	sw	s2,16(sp)
  if ((fd = fdalloc(f)) < 0)
8000484a:	fec42903          	lw	s2,-20(s0)
8000484e:	854a                	mv	a0,s2
80004850:	359d                	jal	800046b6 <fdalloc>
80004852:	84aa                	mv	s1,a0
    return -1;
80004854:	57fd                	li	a5,-1
  if ((fd = fdalloc(f)) < 0)
80004856:	00054d63          	bltz	a0,80004870 <sys_dup+0x42>
  filedup(f);
8000485a:	854a                	mv	a0,s2
8000485c:	b4aff0ef          	jal	80003ba6 <filedup>
  return fd;
80004860:	87a6                	mv	a5,s1
80004862:	44d2                	lw	s1,20(sp)
80004864:	4942                	lw	s2,16(sp)
}
80004866:	853e                	mv	a0,a5
80004868:	40f2                	lw	ra,28(sp)
8000486a:	4462                	lw	s0,24(sp)
8000486c:	6105                	addi	sp,sp,32
8000486e:	8082                	ret
80004870:	44d2                	lw	s1,20(sp)
80004872:	4942                	lw	s2,16(sp)
80004874:	bfcd                	j	80004866 <sys_dup+0x38>

80004876 <sys_read>:
{
80004876:	1101                	addi	sp,sp,-32
80004878:	ce06                	sw	ra,28(sp)
8000487a:	cc22                	sw	s0,24(sp)
8000487c:	1000                	addi	s0,sp,32
  argaddr(1, &p);
8000487e:	fe440593          	addi	a1,s0,-28
80004882:	4505                	li	a0,1
80004884:	c8dfd0ef          	jal	80002510 <argaddr>
  argint(2, &n);
80004888:	fe840593          	addi	a1,s0,-24
8000488c:	4509                	li	a0,2
8000488e:	c69fd0ef          	jal	800024f6 <argint>
  if (argfd(0, 0, &f) < 0)
80004892:	fec40613          	addi	a2,s0,-20
80004896:	4581                	li	a1,0
80004898:	4501                	li	a0,0
8000489a:	33d1                	jal	8000465e <argfd>
8000489c:	87aa                	mv	a5,a0
    return -1;
8000489e:	557d                	li	a0,-1
  if (argfd(0, 0, &f) < 0)
800048a0:	0007ca63          	bltz	a5,800048b4 <sys_read+0x3e>
  return fileread(f, p, n);
800048a4:	fe842603          	lw	a2,-24(s0)
800048a8:	fe442583          	lw	a1,-28(s0)
800048ac:	fec42503          	lw	a0,-20(s0)
800048b0:	c54ff0ef          	jal	80003d04 <fileread>
}
800048b4:	40f2                	lw	ra,28(sp)
800048b6:	4462                	lw	s0,24(sp)
800048b8:	6105                	addi	sp,sp,32
800048ba:	8082                	ret

800048bc <sys_write>:
{
800048bc:	1101                	addi	sp,sp,-32
800048be:	ce06                	sw	ra,28(sp)
800048c0:	cc22                	sw	s0,24(sp)
800048c2:	1000                	addi	s0,sp,32
  argaddr(1, &p);
800048c4:	fe440593          	addi	a1,s0,-28
800048c8:	4505                	li	a0,1
800048ca:	c47fd0ef          	jal	80002510 <argaddr>
  argint(2, &n);
800048ce:	fe840593          	addi	a1,s0,-24
800048d2:	4509                	li	a0,2
800048d4:	c23fd0ef          	jal	800024f6 <argint>
  if (argfd(0, 0, &f) < 0)
800048d8:	fec40613          	addi	a2,s0,-20
800048dc:	4581                	li	a1,0
800048de:	4501                	li	a0,0
800048e0:	3bbd                	jal	8000465e <argfd>
800048e2:	87aa                	mv	a5,a0
    return -1;
800048e4:	557d                	li	a0,-1
  if (argfd(0, 0, &f) < 0)
800048e6:	0007ca63          	bltz	a5,800048fa <sys_write+0x3e>
  return filewrite(f, p, n);
800048ea:	fe842603          	lw	a2,-24(s0)
800048ee:	fe442583          	lw	a1,-28(s0)
800048f2:	fec42503          	lw	a0,-20(s0)
800048f6:	ccaff0ef          	jal	80003dc0 <filewrite>
}
800048fa:	40f2                	lw	ra,28(sp)
800048fc:	4462                	lw	s0,24(sp)
800048fe:	6105                	addi	sp,sp,32
80004900:	8082                	ret

80004902 <sys_close>:
{
80004902:	1101                	addi	sp,sp,-32
80004904:	ce06                	sw	ra,28(sp)
80004906:	cc22                	sw	s0,24(sp)
80004908:	1000                	addi	s0,sp,32
  if (argfd(0, &fd, &f) < 0)
8000490a:	fe840613          	addi	a2,s0,-24
8000490e:	fec40593          	addi	a1,s0,-20
80004912:	4501                	li	a0,0
80004914:	33a9                	jal	8000465e <argfd>
    return -1;
80004916:	57fd                	li	a5,-1
  if (argfd(0, &fd, &f) < 0)
80004918:	02054063          	bltz	a0,80004938 <sys_close+0x36>
  myproc()->ofile[fd] = 0;
8000491c:	d35fc0ef          	jal	80001650 <myproc>
80004920:	fec42783          	lw	a5,-20(s0)
80004924:	07e1                	addi	a5,a5,24
80004926:	078a                	slli	a5,a5,0x2
80004928:	953e                	add	a0,a0,a5
8000492a:	00052623          	sw	zero,12(a0)
  fileclose(f);
8000492e:	fe842503          	lw	a0,-24(s0)
80004932:	abaff0ef          	jal	80003bec <fileclose>
  return 0;
80004936:	4781                	li	a5,0
}
80004938:	853e                	mv	a0,a5
8000493a:	40f2                	lw	ra,28(sp)
8000493c:	4462                	lw	s0,24(sp)
8000493e:	6105                	addi	sp,sp,32
80004940:	8082                	ret

80004942 <sys_fstat>:
{
80004942:	1101                	addi	sp,sp,-32
80004944:	ce06                	sw	ra,28(sp)
80004946:	cc22                	sw	s0,24(sp)
80004948:	1000                	addi	s0,sp,32
  argaddr(1, &st);
8000494a:	fe840593          	addi	a1,s0,-24
8000494e:	4505                	li	a0,1
80004950:	bc1fd0ef          	jal	80002510 <argaddr>
  if (argfd(0, 0, &f) < 0)
80004954:	fec40613          	addi	a2,s0,-20
80004958:	4581                	li	a1,0
8000495a:	4501                	li	a0,0
8000495c:	3309                	jal	8000465e <argfd>
8000495e:	87aa                	mv	a5,a0
    return -1;
80004960:	557d                	li	a0,-1
  if (argfd(0, 0, &f) < 0)
80004962:	0007c863          	bltz	a5,80004972 <sys_fstat+0x30>
  return filestat(f, st);
80004966:	fe842583          	lw	a1,-24(s0)
8000496a:	fec42503          	lw	a0,-20(s0)
8000496e:	b3aff0ef          	jal	80003ca8 <filestat>
}
80004972:	40f2                	lw	ra,28(sp)
80004974:	4462                	lw	s0,24(sp)
80004976:	6105                	addi	sp,sp,32
80004978:	8082                	ret

8000497a <sys_link>:
{
8000497a:	712d                	addi	sp,sp,-288
8000497c:	10112e23          	sw	ra,284(sp)
80004980:	10812c23          	sw	s0,280(sp)
80004984:	1200                	addi	s0,sp,288
  if (argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
80004986:	08000613          	li	a2,128
8000498a:	ee040593          	addi	a1,s0,-288
8000498e:	4501                	li	a0,0
80004990:	b9bfd0ef          	jal	8000252a <argstr>
    return -1;
80004994:	57fd                	li	a5,-1
  if (argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
80004996:	0e054663          	bltz	a0,80004a82 <sys_link+0x108>
8000499a:	08000613          	li	a2,128
8000499e:	f6040593          	addi	a1,s0,-160
800049a2:	4505                	li	a0,1
800049a4:	b87fd0ef          	jal	8000252a <argstr>
    return -1;
800049a8:	57fd                	li	a5,-1
  if (argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
800049aa:	0c054c63          	bltz	a0,80004a82 <sys_link+0x108>
800049ae:	10912a23          	sw	s1,276(sp)
  begin_op();
800049b2:	e37fe0ef          	jal	800037e8 <begin_op>
  if ((ip = namei(old)) == 0) {
800049b6:	ee040513          	addi	a0,s0,-288
800049ba:	c65fe0ef          	jal	8000361e <namei>
800049be:	84aa                	mv	s1,a0
800049c0:	c935                	beqz	a0,80004a34 <sys_link+0xba>
  ilock(ip);
800049c2:	cd4fe0ef          	jal	80002e96 <ilock>
  if (ip->type == T_DIR) {
800049c6:	02849703          	lh	a4,40(s1)
800049ca:	4785                	li	a5,1
800049cc:	06f70a63          	beq	a4,a5,80004a40 <sys_link+0xc6>
800049d0:	11212823          	sw	s2,272(sp)
  ip->nlink++;
800049d4:	02e4d783          	lhu	a5,46(s1)
800049d8:	0785                	addi	a5,a5,1
800049da:	02f49723          	sh	a5,46(s1)
  iupdate(ip);
800049de:	8526                	mv	a0,s1
800049e0:	c04fe0ef          	jal	80002de4 <iupdate>
  iunlock(ip);
800049e4:	8526                	mv	a0,s1
800049e6:	d5cfe0ef          	jal	80002f42 <iunlock>
  if ((dp = nameiparent(new, name)) == 0)
800049ea:	fe040593          	addi	a1,s0,-32
800049ee:	f6040513          	addi	a0,s0,-160
800049f2:	c45fe0ef          	jal	80003636 <nameiparent>
800049f6:	892a                	mv	s2,a0
800049f8:	c125                	beqz	a0,80004a58 <sys_link+0xde>
  ilock(dp);
800049fa:	c9cfe0ef          	jal	80002e96 <ilock>
  if (dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0) {
800049fe:	00092703          	lw	a4,0(s2)
80004a02:	409c                	lw	a5,0(s1)
80004a04:	04f71763          	bne	a4,a5,80004a52 <sys_link+0xd8>
80004a08:	40d0                	lw	a2,4(s1)
80004a0a:	fe040593          	addi	a1,s0,-32
80004a0e:	854a                	mv	a0,s2
80004a10:	b7dfe0ef          	jal	8000358c <dirlink>
80004a14:	02054f63          	bltz	a0,80004a52 <sys_link+0xd8>
  iunlockput(dp);
80004a18:	854a                	mv	a0,s2
80004a1a:	e78fe0ef          	jal	80003092 <iunlockput>
  iput(ip);
80004a1e:	8526                	mv	a0,s1
80004a20:	deefe0ef          	jal	8000300e <iput>
  end_op();
80004a24:	e2dfe0ef          	jal	80003850 <end_op>
  return 0;
80004a28:	4781                	li	a5,0
80004a2a:	11412483          	lw	s1,276(sp)
80004a2e:	11012903          	lw	s2,272(sp)
80004a32:	a881                	j	80004a82 <sys_link+0x108>
    end_op();
80004a34:	e1dfe0ef          	jal	80003850 <end_op>
    return -1;
80004a38:	57fd                	li	a5,-1
80004a3a:	11412483          	lw	s1,276(sp)
80004a3e:	a091                	j	80004a82 <sys_link+0x108>
    iunlockput(ip);
80004a40:	8526                	mv	a0,s1
80004a42:	e50fe0ef          	jal	80003092 <iunlockput>
    end_op();
80004a46:	e0bfe0ef          	jal	80003850 <end_op>
    return -1;
80004a4a:	57fd                	li	a5,-1
80004a4c:	11412483          	lw	s1,276(sp)
80004a50:	a80d                	j	80004a82 <sys_link+0x108>
    iunlockput(dp);
80004a52:	854a                	mv	a0,s2
80004a54:	e3efe0ef          	jal	80003092 <iunlockput>
  ilock(ip);
80004a58:	8526                	mv	a0,s1
80004a5a:	c3cfe0ef          	jal	80002e96 <ilock>
  ip->nlink--;
80004a5e:	02e4d783          	lhu	a5,46(s1)
80004a62:	17fd                	addi	a5,a5,-1
80004a64:	02f49723          	sh	a5,46(s1)
  iupdate(ip);
80004a68:	8526                	mv	a0,s1
80004a6a:	b7afe0ef          	jal	80002de4 <iupdate>
  iunlockput(ip);
80004a6e:	8526                	mv	a0,s1
80004a70:	e22fe0ef          	jal	80003092 <iunlockput>
  end_op();
80004a74:	dddfe0ef          	jal	80003850 <end_op>
  return -1;
80004a78:	57fd                	li	a5,-1
80004a7a:	11412483          	lw	s1,276(sp)
80004a7e:	11012903          	lw	s2,272(sp)
}
80004a82:	853e                	mv	a0,a5
80004a84:	11c12083          	lw	ra,284(sp)
80004a88:	11812403          	lw	s0,280(sp)
80004a8c:	6115                	addi	sp,sp,288
80004a8e:	8082                	ret

80004a90 <sys_unlink>:
{
80004a90:	7115                	addi	sp,sp,-224
80004a92:	cf86                	sw	ra,220(sp)
80004a94:	cda2                	sw	s0,216(sp)
80004a96:	1180                	addi	s0,sp,224
  if (argstr(0, path, MAXPATH) < 0)
80004a98:	08000613          	li	a2,128
80004a9c:	f4040593          	addi	a1,s0,-192
80004aa0:	4501                	li	a0,0
80004aa2:	a89fd0ef          	jal	8000252a <argstr>
80004aa6:	16054063          	bltz	a0,80004c06 <sys_unlink+0x176>
80004aaa:	cba6                	sw	s1,212(sp)
  begin_op();
80004aac:	d3dfe0ef          	jal	800037e8 <begin_op>
  if ((dp = nameiparent(path, name)) == 0) {
80004ab0:	fc040593          	addi	a1,s0,-64
80004ab4:	f4040513          	addi	a0,s0,-192
80004ab8:	b7ffe0ef          	jal	80003636 <nameiparent>
80004abc:	84aa                	mv	s1,a0
80004abe:	c945                	beqz	a0,80004b6e <sys_unlink+0xde>
  ilock(dp);
80004ac0:	bd6fe0ef          	jal	80002e96 <ilock>
  if (namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80004ac4:	00007597          	auipc	a1,0x7
80004ac8:	b0858593          	addi	a1,a1,-1272 # 8000b5cc <etext+0x5cc>
80004acc:	fc040513          	addi	a0,s0,-64
80004ad0:	8f5fe0ef          	jal	800033c4 <namecmp>
80004ad4:	10050e63          	beqz	a0,80004bf0 <sys_unlink+0x160>
80004ad8:	00007597          	auipc	a1,0x7
80004adc:	af858593          	addi	a1,a1,-1288 # 8000b5d0 <etext+0x5d0>
80004ae0:	fc040513          	addi	a0,s0,-64
80004ae4:	8e1fe0ef          	jal	800033c4 <namecmp>
80004ae8:	10050463          	beqz	a0,80004bf0 <sys_unlink+0x160>
80004aec:	c9ca                	sw	s2,208(sp)
  if ((ip = dirlookup(dp, name, &off)) == 0)
80004aee:	f3c40613          	addi	a2,s0,-196
80004af2:	fc040593          	addi	a1,s0,-64
80004af6:	8526                	mv	a0,s1
80004af8:	8e3fe0ef          	jal	800033da <dirlookup>
80004afc:	892a                	mv	s2,a0
80004afe:	0e050863          	beqz	a0,80004bee <sys_unlink+0x15e>
  ilock(ip);
80004b02:	b94fe0ef          	jal	80002e96 <ilock>
  if (ip->nlink < 1)
80004b06:	02e91783          	lh	a5,46(s2)
80004b0a:	06f05763          	blez	a5,80004b78 <sys_unlink+0xe8>
  if (ip->type == T_DIR && !isdirempty(ip)) {
80004b0e:	02891703          	lh	a4,40(s2)
80004b12:	4785                	li	a5,1
80004b14:	06f70963          	beq	a4,a5,80004b86 <sys_unlink+0xf6>
  memset(&de, 0, sizeof(de));
80004b18:	4641                	li	a2,16
80004b1a:	4581                	li	a1,0
80004b1c:	fd040513          	addi	a0,s0,-48
80004b20:	844fc0ef          	jal	80000b64 <memset>
  if (writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
80004b24:	4741                	li	a4,16
80004b26:	f3c42683          	lw	a3,-196(s0)
80004b2a:	fd040613          	addi	a2,s0,-48
80004b2e:	4581                	li	a1,0
80004b30:	8526                	mv	a0,s1
80004b32:	fa6fe0ef          	jal	800032d8 <writei>
80004b36:	47c1                	li	a5,16
80004b38:	08f51b63          	bne	a0,a5,80004bce <sys_unlink+0x13e>
  if (ip->type == T_DIR) {
80004b3c:	02891703          	lh	a4,40(s2)
80004b40:	4785                	li	a5,1
80004b42:	08f70d63          	beq	a4,a5,80004bdc <sys_unlink+0x14c>
  iunlockput(dp);
80004b46:	8526                	mv	a0,s1
80004b48:	d4afe0ef          	jal	80003092 <iunlockput>
  ip->nlink--;
80004b4c:	02e95783          	lhu	a5,46(s2)
80004b50:	17fd                	addi	a5,a5,-1
80004b52:	02f91723          	sh	a5,46(s2)
  iupdate(ip);
80004b56:	854a                	mv	a0,s2
80004b58:	a8cfe0ef          	jal	80002de4 <iupdate>
  iunlockput(ip);
80004b5c:	854a                	mv	a0,s2
80004b5e:	d34fe0ef          	jal	80003092 <iunlockput>
  end_op();
80004b62:	ceffe0ef          	jal	80003850 <end_op>
  return 0;
80004b66:	4501                	li	a0,0
80004b68:	44de                	lw	s1,212(sp)
80004b6a:	494e                	lw	s2,208(sp)
80004b6c:	a849                	j	80004bfe <sys_unlink+0x16e>
    end_op();
80004b6e:	ce3fe0ef          	jal	80003850 <end_op>
    return -1;
80004b72:	557d                	li	a0,-1
80004b74:	44de                	lw	s1,212(sp)
80004b76:	a061                	j	80004bfe <sys_unlink+0x16e>
80004b78:	c7ce                	sw	s3,204(sp)
    panic("unlink: nlink < 1");
80004b7a:	00007517          	auipc	a0,0x7
80004b7e:	a5a50513          	addi	a0,a0,-1446 # 8000b5d4 <etext+0x5d4>
80004b82:	c37fb0ef          	jal	800007b8 <panic>
  for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
80004b86:	03092703          	lw	a4,48(s2)
80004b8a:	02000793          	li	a5,32
80004b8e:	f8e7f5e3          	bgeu	a5,a4,80004b18 <sys_unlink+0x88>
80004b92:	c7ce                	sw	s3,204(sp)
80004b94:	02000993          	li	s3,32
    if (readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
80004b98:	4741                	li	a4,16
80004b9a:	86ce                	mv	a3,s3
80004b9c:	f2c40613          	addi	a2,s0,-212
80004ba0:	4581                	li	a1,0
80004ba2:	854a                	mv	a0,s2
80004ba4:	e58fe0ef          	jal	800031fc <readi>
80004ba8:	47c1                	li	a5,16
80004baa:	00f51c63          	bne	a0,a5,80004bc2 <sys_unlink+0x132>
    if (de.inum != 0)
80004bae:	f2c45783          	lhu	a5,-212(s0)
80004bb2:	efa1                	bnez	a5,80004c0a <sys_unlink+0x17a>
  for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
80004bb4:	09c1                	addi	s3,s3,16
80004bb6:	03092783          	lw	a5,48(s2)
80004bba:	fcf9efe3          	bltu	s3,a5,80004b98 <sys_unlink+0x108>
80004bbe:	49be                	lw	s3,204(sp)
80004bc0:	bfa1                	j	80004b18 <sys_unlink+0x88>
      panic("isdirempty: readi");
80004bc2:	00007517          	auipc	a0,0x7
80004bc6:	a2650513          	addi	a0,a0,-1498 # 8000b5e8 <etext+0x5e8>
80004bca:	beffb0ef          	jal	800007b8 <panic>
80004bce:	c7ce                	sw	s3,204(sp)
    panic("unlink: writei");
80004bd0:	00007517          	auipc	a0,0x7
80004bd4:	a2c50513          	addi	a0,a0,-1492 # 8000b5fc <etext+0x5fc>
80004bd8:	be1fb0ef          	jal	800007b8 <panic>
    dp->nlink--;
80004bdc:	02e4d783          	lhu	a5,46(s1)
80004be0:	17fd                	addi	a5,a5,-1
80004be2:	02f49723          	sh	a5,46(s1)
    iupdate(dp);
80004be6:	8526                	mv	a0,s1
80004be8:	9fcfe0ef          	jal	80002de4 <iupdate>
80004bec:	bfa9                	j	80004b46 <sys_unlink+0xb6>
80004bee:	494e                	lw	s2,208(sp)
  iunlockput(dp);
80004bf0:	8526                	mv	a0,s1
80004bf2:	ca0fe0ef          	jal	80003092 <iunlockput>
  end_op();
80004bf6:	c5bfe0ef          	jal	80003850 <end_op>
  return -1;
80004bfa:	557d                	li	a0,-1
80004bfc:	44de                	lw	s1,212(sp)
}
80004bfe:	40fe                	lw	ra,220(sp)
80004c00:	446e                	lw	s0,216(sp)
80004c02:	612d                	addi	sp,sp,224
80004c04:	8082                	ret
    return -1;
80004c06:	557d                	li	a0,-1
80004c08:	bfdd                	j	80004bfe <sys_unlink+0x16e>
    iunlockput(ip);
80004c0a:	854a                	mv	a0,s2
80004c0c:	c86fe0ef          	jal	80003092 <iunlockput>
    goto bad;
80004c10:	494e                	lw	s2,208(sp)
80004c12:	49be                	lw	s3,204(sp)
80004c14:	bff1                	j	80004bf0 <sys_unlink+0x160>

80004c16 <sys_open>:

uint64
sys_open(void)
{
80004c16:	7171                	addi	sp,sp,-176
80004c18:	d706                	sw	ra,172(sp)
80004c1a:	d522                	sw	s0,168(sp)
80004c1c:	1900                	addi	s0,sp,176
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
80004c1e:	f5c40593          	addi	a1,s0,-164
80004c22:	4505                	li	a0,1
80004c24:	8d3fd0ef          	jal	800024f6 <argint>
  if ((n = argstr(0, path, MAXPATH)) < 0)
80004c28:	08000613          	li	a2,128
80004c2c:	f6040593          	addi	a1,s0,-160
80004c30:	4501                	li	a0,0
80004c32:	8f9fd0ef          	jal	8000252a <argstr>
80004c36:	87aa                	mv	a5,a0
    return -1;
80004c38:	557d                	li	a0,-1
  if ((n = argstr(0, path, MAXPATH)) < 0)
80004c3a:	0a07c063          	bltz	a5,80004cda <sys_open+0xc4>
80004c3e:	d326                	sw	s1,164(sp)

  begin_op();
80004c40:	ba9fe0ef          	jal	800037e8 <begin_op>

  if (omode & O_CREATE) {
80004c44:	f5c42783          	lw	a5,-164(s0)
80004c48:	2007f793          	andi	a5,a5,512
80004c4c:	c3c5                	beqz	a5,80004cec <sys_open+0xd6>
    ip = create(path, T_FILE, 0, 0);
80004c4e:	4681                	li	a3,0
80004c50:	4601                	li	a2,0
80004c52:	4589                	li	a1,2
80004c54:	f6040513          	addi	a0,s0,-160
80004c58:	3c71                	jal	800046f4 <create>
80004c5a:	84aa                	mv	s1,a0
    if (ip == 0) {
80004c5c:	c159                	beqz	a0,80004ce2 <sys_open+0xcc>
      end_op();
      return -1;
    }
  }

  if (ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)) {
80004c5e:	02849703          	lh	a4,40(s1)
80004c62:	478d                	li	a5,3
80004c64:	00f71763          	bne	a4,a5,80004c72 <sys_open+0x5c>
80004c68:	02a4d703          	lhu	a4,42(s1)
80004c6c:	47a5                	li	a5,9
80004c6e:	0ae7ec63          	bltu	a5,a4,80004d26 <sys_open+0x110>
80004c72:	d14a                	sw	s2,160(sp)
    iunlockput(ip);
    end_op();
    return -1;
  }

  if ((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0) {
80004c74:	ed7fe0ef          	jal	80003b4a <filealloc>
80004c78:	892a                	mv	s2,a0
80004c7a:	c171                	beqz	a0,80004d3e <sys_open+0x128>
80004c7c:	cf4e                	sw	s3,156(sp)
80004c7e:	3c25                	jal	800046b6 <fdalloc>
80004c80:	89aa                	mv	s3,a0
80004c82:	0a054a63          	bltz	a0,80004d36 <sys_open+0x120>
    iunlockput(ip);
    end_op();
    return -1;
  }

  if (ip->type == T_DEVICE) {
80004c86:	02849703          	lh	a4,40(s1)
80004c8a:	478d                	li	a5,3
80004c8c:	0cf70263          	beq	a4,a5,80004d50 <sys_open+0x13a>
    f->type = FD_DEVICE;
    f->major = ip->major;
  } else {
    f->type = FD_INODE;
80004c90:	4789                	li	a5,2
80004c92:	00f92023          	sw	a5,0(s2)
    f->off = 0;
80004c96:	00092a23          	sw	zero,20(s2)
  }
  f->ip = ip;
80004c9a:	00992823          	sw	s1,16(s2)
  f->readable = !(omode & O_WRONLY);
80004c9e:	f5c42783          	lw	a5,-164(s0)
80004ca2:	0017c713          	xori	a4,a5,1
80004ca6:	8b05                	andi	a4,a4,1
80004ca8:	00e90423          	sb	a4,8(s2)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80004cac:	0037f713          	andi	a4,a5,3
80004cb0:	00e03733          	snez	a4,a4
80004cb4:	00e904a3          	sb	a4,9(s2)

  if ((omode & O_TRUNC) && ip->type == T_FILE) {
80004cb8:	4007f793          	andi	a5,a5,1024
80004cbc:	c791                	beqz	a5,80004cc8 <sys_open+0xb2>
80004cbe:	02849703          	lh	a4,40(s1)
80004cc2:	4789                	li	a5,2
80004cc4:	08f70d63          	beq	a4,a5,80004d5e <sys_open+0x148>
    itrunc(ip);
  }

  iunlock(ip);
80004cc8:	8526                	mv	a0,s1
80004cca:	a78fe0ef          	jal	80002f42 <iunlock>
  end_op();
80004cce:	b83fe0ef          	jal	80003850 <end_op>

  return fd;
80004cd2:	854e                	mv	a0,s3
80004cd4:	549a                	lw	s1,164(sp)
80004cd6:	590a                	lw	s2,160(sp)
80004cd8:	49fa                	lw	s3,156(sp)
}
80004cda:	50ba                	lw	ra,172(sp)
80004cdc:	542a                	lw	s0,168(sp)
80004cde:	614d                	addi	sp,sp,176
80004ce0:	8082                	ret
      end_op();
80004ce2:	b6ffe0ef          	jal	80003850 <end_op>
      return -1;
80004ce6:	557d                	li	a0,-1
80004ce8:	549a                	lw	s1,164(sp)
80004cea:	bfc5                	j	80004cda <sys_open+0xc4>
    if ((ip = namei(path)) == 0) {
80004cec:	f6040513          	addi	a0,s0,-160
80004cf0:	92ffe0ef          	jal	8000361e <namei>
80004cf4:	84aa                	mv	s1,a0
80004cf6:	c11d                	beqz	a0,80004d1c <sys_open+0x106>
    ilock(ip);
80004cf8:	99efe0ef          	jal	80002e96 <ilock>
    if (ip->type == T_DIR && omode != O_RDONLY) {
80004cfc:	02849703          	lh	a4,40(s1)
80004d00:	4785                	li	a5,1
80004d02:	f4f71ee3          	bne	a4,a5,80004c5e <sys_open+0x48>
80004d06:	f5c42783          	lw	a5,-164(s0)
80004d0a:	d7a5                	beqz	a5,80004c72 <sys_open+0x5c>
      iunlockput(ip);
80004d0c:	8526                	mv	a0,s1
80004d0e:	b84fe0ef          	jal	80003092 <iunlockput>
      end_op();
80004d12:	b3ffe0ef          	jal	80003850 <end_op>
      return -1;
80004d16:	557d                	li	a0,-1
80004d18:	549a                	lw	s1,164(sp)
80004d1a:	b7c1                	j	80004cda <sys_open+0xc4>
      end_op();
80004d1c:	b35fe0ef          	jal	80003850 <end_op>
      return -1;
80004d20:	557d                	li	a0,-1
80004d22:	549a                	lw	s1,164(sp)
80004d24:	bf5d                	j	80004cda <sys_open+0xc4>
    iunlockput(ip);
80004d26:	8526                	mv	a0,s1
80004d28:	b6afe0ef          	jal	80003092 <iunlockput>
    end_op();
80004d2c:	b25fe0ef          	jal	80003850 <end_op>
    return -1;
80004d30:	557d                	li	a0,-1
80004d32:	549a                	lw	s1,164(sp)
80004d34:	b75d                	j	80004cda <sys_open+0xc4>
      fileclose(f);
80004d36:	854a                	mv	a0,s2
80004d38:	eb5fe0ef          	jal	80003bec <fileclose>
80004d3c:	49fa                	lw	s3,156(sp)
    iunlockput(ip);
80004d3e:	8526                	mv	a0,s1
80004d40:	b52fe0ef          	jal	80003092 <iunlockput>
    end_op();
80004d44:	b0dfe0ef          	jal	80003850 <end_op>
    return -1;
80004d48:	557d                	li	a0,-1
80004d4a:	549a                	lw	s1,164(sp)
80004d4c:	590a                	lw	s2,160(sp)
80004d4e:	b771                	j	80004cda <sys_open+0xc4>
    f->type = FD_DEVICE;
80004d50:	00f92023          	sw	a5,0(s2)
    f->major = ip->major;
80004d54:	02a49783          	lh	a5,42(s1)
80004d58:	00f91c23          	sh	a5,24(s2)
80004d5c:	bf3d                	j	80004c9a <sys_open+0x84>
    itrunc(ip);
80004d5e:	8526                	mv	a0,s1
80004d60:	a22fe0ef          	jal	80002f82 <itrunc>
80004d64:	b795                	j	80004cc8 <sys_open+0xb2>

80004d66 <sys_mkdir>:

uint64
sys_mkdir(void)
{
80004d66:	7175                	addi	sp,sp,-144
80004d68:	c706                	sw	ra,140(sp)
80004d6a:	c522                	sw	s0,136(sp)
80004d6c:	0900                	addi	s0,sp,144
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
80004d6e:	a7bfe0ef          	jal	800037e8 <begin_op>
  if (argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0) {
80004d72:	08000613          	li	a2,128
80004d76:	f7040593          	addi	a1,s0,-144
80004d7a:	4501                	li	a0,0
80004d7c:	faefd0ef          	jal	8000252a <argstr>
80004d80:	02054363          	bltz	a0,80004da6 <sys_mkdir+0x40>
80004d84:	4681                	li	a3,0
80004d86:	4601                	li	a2,0
80004d88:	4585                	li	a1,1
80004d8a:	f7040513          	addi	a0,s0,-144
80004d8e:	967ff0ef          	jal	800046f4 <create>
80004d92:	c911                	beqz	a0,80004da6 <sys_mkdir+0x40>
    end_op();
    return -1;
  }
  iunlockput(ip);
80004d94:	afefe0ef          	jal	80003092 <iunlockput>
  end_op();
80004d98:	ab9fe0ef          	jal	80003850 <end_op>
  return 0;
80004d9c:	4501                	li	a0,0
}
80004d9e:	40ba                	lw	ra,140(sp)
80004da0:	442a                	lw	s0,136(sp)
80004da2:	6149                	addi	sp,sp,144
80004da4:	8082                	ret
    end_op();
80004da6:	aabfe0ef          	jal	80003850 <end_op>
    return -1;
80004daa:	557d                	li	a0,-1
80004dac:	bfcd                	j	80004d9e <sys_mkdir+0x38>

80004dae <sys_mknod>:

uint64
sys_mknod(void)
{
80004dae:	7135                	addi	sp,sp,-160
80004db0:	cf06                	sw	ra,156(sp)
80004db2:	cd22                	sw	s0,152(sp)
80004db4:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
80004db6:	a33fe0ef          	jal	800037e8 <begin_op>
  argint(1, &major);
80004dba:	f6c40593          	addi	a1,s0,-148
80004dbe:	4505                	li	a0,1
80004dc0:	f36fd0ef          	jal	800024f6 <argint>
  argint(2, &minor);
80004dc4:	f6840593          	addi	a1,s0,-152
80004dc8:	4509                	li	a0,2
80004dca:	f2cfd0ef          	jal	800024f6 <argint>
  if ((argstr(0, path, MAXPATH)) < 0 ||
80004dce:	08000613          	li	a2,128
80004dd2:	f7040593          	addi	a1,s0,-144
80004dd6:	4501                	li	a0,0
80004dd8:	f52fd0ef          	jal	8000252a <argstr>
80004ddc:	02054563          	bltz	a0,80004e06 <sys_mknod+0x58>
      (ip = create(path, T_DEVICE, major, minor)) == 0) {
80004de0:	f6841683          	lh	a3,-152(s0)
80004de4:	f6c41603          	lh	a2,-148(s0)
80004de8:	458d                	li	a1,3
80004dea:	f7040513          	addi	a0,s0,-144
80004dee:	907ff0ef          	jal	800046f4 <create>
  if ((argstr(0, path, MAXPATH)) < 0 ||
80004df2:	c911                	beqz	a0,80004e06 <sys_mknod+0x58>
    end_op();
    return -1;
  }
  iunlockput(ip);
80004df4:	a9efe0ef          	jal	80003092 <iunlockput>
  end_op();
80004df8:	a59fe0ef          	jal	80003850 <end_op>
  return 0;
80004dfc:	4501                	li	a0,0
}
80004dfe:	40fa                	lw	ra,156(sp)
80004e00:	446a                	lw	s0,152(sp)
80004e02:	610d                	addi	sp,sp,160
80004e04:	8082                	ret
    end_op();
80004e06:	a4bfe0ef          	jal	80003850 <end_op>
    return -1;
80004e0a:	557d                	li	a0,-1
80004e0c:	bfcd                	j	80004dfe <sys_mknod+0x50>

80004e0e <sys_chdir>:

uint64
sys_chdir(void)
{
80004e0e:	7175                	addi	sp,sp,-144
80004e10:	c706                	sw	ra,140(sp)
80004e12:	c522                	sw	s0,136(sp)
80004e14:	c14a                	sw	s2,128(sp)
80004e16:	0900                	addi	s0,sp,144
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
80004e18:	839fc0ef          	jal	80001650 <myproc>
80004e1c:	892a                	mv	s2,a0

  begin_op();
80004e1e:	9cbfe0ef          	jal	800037e8 <begin_op>
  if (argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0) {
80004e22:	08000613          	li	a2,128
80004e26:	f7040593          	addi	a1,s0,-144
80004e2a:	4501                	li	a0,0
80004e2c:	efefd0ef          	jal	8000252a <argstr>
80004e30:	04054363          	bltz	a0,80004e76 <sys_chdir+0x68>
80004e34:	c326                	sw	s1,132(sp)
80004e36:	f7040513          	addi	a0,s0,-144
80004e3a:	fe4fe0ef          	jal	8000361e <namei>
80004e3e:	84aa                	mv	s1,a0
80004e40:	c915                	beqz	a0,80004e74 <sys_chdir+0x66>
    end_op();
    return -1;
  }
  ilock(ip);
80004e42:	854fe0ef          	jal	80002e96 <ilock>
  if (ip->type != T_DIR) {
80004e46:	02849703          	lh	a4,40(s1)
80004e4a:	4785                	li	a5,1
80004e4c:	02f71963          	bne	a4,a5,80004e7e <sys_chdir+0x70>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80004e50:	8526                	mv	a0,s1
80004e52:	8f0fe0ef          	jal	80002f42 <iunlock>
  iput(p->cwd);
80004e56:	0ac92503          	lw	a0,172(s2)
80004e5a:	9b4fe0ef          	jal	8000300e <iput>
  end_op();
80004e5e:	9f3fe0ef          	jal	80003850 <end_op>
  p->cwd = ip;
80004e62:	0a992623          	sw	s1,172(s2)
  return 0;
80004e66:	4501                	li	a0,0
80004e68:	449a                	lw	s1,132(sp)
}
80004e6a:	40ba                	lw	ra,140(sp)
80004e6c:	442a                	lw	s0,136(sp)
80004e6e:	490a                	lw	s2,128(sp)
80004e70:	6149                	addi	sp,sp,144
80004e72:	8082                	ret
80004e74:	449a                	lw	s1,132(sp)
    end_op();
80004e76:	9dbfe0ef          	jal	80003850 <end_op>
    return -1;
80004e7a:	557d                	li	a0,-1
80004e7c:	b7fd                	j	80004e6a <sys_chdir+0x5c>
    iunlockput(ip);
80004e7e:	8526                	mv	a0,s1
80004e80:	a12fe0ef          	jal	80003092 <iunlockput>
    end_op();
80004e84:	9cdfe0ef          	jal	80003850 <end_op>
    return -1;
80004e88:	557d                	li	a0,-1
80004e8a:	449a                	lw	s1,132(sp)
80004e8c:	bff9                	j	80004e6a <sys_chdir+0x5c>

80004e8e <sys_exec>:

uint64
sys_exec(void)
{
80004e8e:	7169                	addi	sp,sp,-304
80004e90:	12112623          	sw	ra,300(sp)
80004e94:	12812423          	sw	s0,296(sp)
80004e98:	1a00                	addi	s0,sp,304
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
80004e9a:	edc40593          	addi	a1,s0,-292
80004e9e:	4505                	li	a0,1
80004ea0:	e70fd0ef          	jal	80002510 <argaddr>
  if (argstr(0, path, MAXPATH) < 0) {
80004ea4:	08000613          	li	a2,128
80004ea8:	f6040593          	addi	a1,s0,-160
80004eac:	4501                	li	a0,0
80004eae:	e7cfd0ef          	jal	8000252a <argstr>
80004eb2:	87aa                	mv	a5,a0
    return -1;
80004eb4:	557d                	li	a0,-1
  if (argstr(0, path, MAXPATH) < 0) {
80004eb6:	0e07c363          	bltz	a5,80004f9c <sys_exec+0x10e>
80004eba:	12912223          	sw	s1,292(sp)
80004ebe:	13212023          	sw	s2,288(sp)
80004ec2:	11312e23          	sw	s3,284(sp)
80004ec6:	11412c23          	sw	s4,280(sp)
  }
  memset(argv, 0, sizeof(argv));
80004eca:	08000613          	li	a2,128
80004ece:	4581                	li	a1,0
80004ed0:	ee040513          	addi	a0,s0,-288
80004ed4:	c91fb0ef          	jal	80000b64 <memset>
  for (i = 0;; i++) {
    if (i >= NELEM(argv)) {
80004ed8:	ee040493          	addi	s1,s0,-288
  memset(argv, 0, sizeof(argv));
80004edc:	89a6                	mv	s3,s1
  for (i = 0;; i++) {
80004ede:	4901                	li	s2,0
    if (i >= NELEM(argv)) {
80004ee0:	02000a13          	li	s4,32
      goto bad;
    }
    // fetchaddr now reads 4 bytes (RV32 pointers), stride by 4
    if (fetchaddr(uargv + sizeof(uint32) * i, (uint64 *)&uarg) < 0) {
80004ee4:	00291513          	slli	a0,s2,0x2
80004ee8:	ed840593          	addi	a1,s0,-296
80004eec:	edc42783          	lw	a5,-292(s0)
80004ef0:	953e                	add	a0,a0,a5
80004ef2:	d7afd0ef          	jal	8000246c <fetchaddr>
80004ef6:	02054663          	bltz	a0,80004f22 <sys_exec+0x94>
      goto bad;
    }
    if (uarg == 0) {
80004efa:	ed842783          	lw	a5,-296(s0)
80004efe:	c7a9                	beqz	a5,80004f48 <sys_exec+0xba>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
80004f00:	ae7fb0ef          	jal	800009e6 <kalloc>
80004f04:	85aa                	mv	a1,a0
80004f06:	00a9a023          	sw	a0,0(s3)
    if (argv[i] == 0)
80004f0a:	cd01                	beqz	a0,80004f22 <sys_exec+0x94>
      goto bad;
    if (fetchstr(uarg, argv[i], PGSIZE) < 0)
80004f0c:	6605                	lui	a2,0x1
80004f0e:	ed842503          	lw	a0,-296(s0)
80004f12:	da4fd0ef          	jal	800024b6 <fetchstr>
80004f16:	00054663          	bltz	a0,80004f22 <sys_exec+0x94>
  for (i = 0;; i++) {
80004f1a:	0905                	addi	s2,s2,1
    if (i >= NELEM(argv)) {
80004f1c:	0991                	addi	s3,s3,4
80004f1e:	fd4913e3          	bne	s2,s4,80004ee4 <sys_exec+0x56>
    kfree(argv[i]);

  return ret;

bad:
  for (i = 0; i < NELEM(argv) && argv[i] != 0; i++)
80004f22:	f6040913          	addi	s2,s0,-160
80004f26:	4088                	lw	a0,0(s1)
80004f28:	c12d                	beqz	a0,80004f8a <sys_exec+0xfc>
    kfree(argv[i]);
80004f2a:	9e9fb0ef          	jal	80000912 <kfree>
  for (i = 0; i < NELEM(argv) && argv[i] != 0; i++)
80004f2e:	0491                	addi	s1,s1,4
80004f30:	ff249be3          	bne	s1,s2,80004f26 <sys_exec+0x98>
  return -1;
80004f34:	557d                	li	a0,-1
80004f36:	12412483          	lw	s1,292(sp)
80004f3a:	12012903          	lw	s2,288(sp)
80004f3e:	11c12983          	lw	s3,284(sp)
80004f42:	11812a03          	lw	s4,280(sp)
80004f46:	a899                	j	80004f9c <sys_exec+0x10e>
      argv[i] = 0;
80004f48:	090a                	slli	s2,s2,0x2
80004f4a:	fe090793          	addi	a5,s2,-32
80004f4e:	00878933          	add	s2,a5,s0
80004f52:	f0092023          	sw	zero,-256(s2)
  int ret = kexec(path, argv);
80004f56:	ee040593          	addi	a1,s0,-288
80004f5a:	f6040513          	addi	a0,s0,-160
80004f5e:	a78ff0ef          	jal	800041d6 <kexec>
80004f62:	892a                	mv	s2,a0
  for (i = 0; i < NELEM(argv) && argv[i] != 0; i++)
80004f64:	f6040993          	addi	s3,s0,-160
80004f68:	4088                	lw	a0,0(s1)
80004f6a:	c511                	beqz	a0,80004f76 <sys_exec+0xe8>
    kfree(argv[i]);
80004f6c:	9a7fb0ef          	jal	80000912 <kfree>
  for (i = 0; i < NELEM(argv) && argv[i] != 0; i++)
80004f70:	0491                	addi	s1,s1,4
80004f72:	ff349be3          	bne	s1,s3,80004f68 <sys_exec+0xda>
  return ret;
80004f76:	854a                	mv	a0,s2
80004f78:	12412483          	lw	s1,292(sp)
80004f7c:	12012903          	lw	s2,288(sp)
80004f80:	11c12983          	lw	s3,284(sp)
80004f84:	11812a03          	lw	s4,280(sp)
80004f88:	a811                	j	80004f9c <sys_exec+0x10e>
  return -1;
80004f8a:	557d                	li	a0,-1
80004f8c:	12412483          	lw	s1,292(sp)
80004f90:	12012903          	lw	s2,288(sp)
80004f94:	11c12983          	lw	s3,284(sp)
80004f98:	11812a03          	lw	s4,280(sp)
}
80004f9c:	12c12083          	lw	ra,300(sp)
80004fa0:	12812403          	lw	s0,296(sp)
80004fa4:	6155                	addi	sp,sp,304
80004fa6:	8082                	ret

80004fa8 <sys_pipe>:

uint64
sys_pipe(void)
{
80004fa8:	7179                	addi	sp,sp,-48
80004faa:	d606                	sw	ra,44(sp)
80004fac:	d422                	sw	s0,40(sp)
80004fae:	d226                	sw	s1,36(sp)
80004fb0:	1800                	addi	s0,sp,48
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
80004fb2:	e9efc0ef          	jal	80001650 <myproc>
80004fb6:	84aa                	mv	s1,a0

  argaddr(0, &fdarray);
80004fb8:	fec40593          	addi	a1,s0,-20
80004fbc:	4501                	li	a0,0
80004fbe:	d52fd0ef          	jal	80002510 <argaddr>
  if (pipealloc(&rf, &wf) < 0)
80004fc2:	fe440593          	addi	a1,s0,-28
80004fc6:	fe840513          	addi	a0,s0,-24
80004fca:	f09fe0ef          	jal	80003ed2 <pipealloc>
    return -1;
80004fce:	57fd                	li	a5,-1
  if (pipealloc(&rf, &wf) < 0)
80004fd0:	0a054463          	bltz	a0,80005078 <sys_pipe+0xd0>
  fd0 = -1;
80004fd4:	fef42023          	sw	a5,-32(s0)
  if ((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0) {
80004fd8:	fe842503          	lw	a0,-24(s0)
80004fdc:	edaff0ef          	jal	800046b6 <fdalloc>
80004fe0:	fea42023          	sw	a0,-32(s0)
80004fe4:	08054163          	bltz	a0,80005066 <sys_pipe+0xbe>
80004fe8:	fe442503          	lw	a0,-28(s0)
80004fec:	ecaff0ef          	jal	800046b6 <fdalloc>
80004ff0:	fca42e23          	sw	a0,-36(s0)
80004ff4:	06054063          	bltz	a0,80005054 <sys_pipe+0xac>
      p->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  if (copyout(p->pagetable, fdarray, (char *)&fd0, sizeof(fd0)) < 0 ||
80004ff8:	4691                	li	a3,4
80004ffa:	fe040613          	addi	a2,s0,-32
80004ffe:	fec42583          	lw	a1,-20(s0)
80005002:	54c8                	lw	a0,44(s1)
80005004:	b56fc0ef          	jal	8000135a <copyout>
80005008:	00054e63          	bltz	a0,80005024 <sys_pipe+0x7c>
      copyout(p->pagetable, fdarray + sizeof(fd0), (char *)&fd1, sizeof(fd1)) <
8000500c:	4691                	li	a3,4
8000500e:	fdc40613          	addi	a2,s0,-36
80005012:	fec42583          	lw	a1,-20(s0)
80005016:	0591                	addi	a1,a1,4
80005018:	54c8                	lw	a0,44(s1)
8000501a:	b40fc0ef          	jal	8000135a <copyout>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
8000501e:	4781                	li	a5,0
  if (copyout(p->pagetable, fdarray, (char *)&fd0, sizeof(fd0)) < 0 ||
80005020:	04055c63          	bgez	a0,80005078 <sys_pipe+0xd0>
    p->ofile[fd0] = 0;
80005024:	fe042783          	lw	a5,-32(s0)
80005028:	07e1                	addi	a5,a5,24
8000502a:	078a                	slli	a5,a5,0x2
8000502c:	97a6                	add	a5,a5,s1
8000502e:	0007a623          	sw	zero,12(a5)
    p->ofile[fd1] = 0;
80005032:	fdc42783          	lw	a5,-36(s0)
80005036:	07e1                	addi	a5,a5,24
80005038:	078a                	slli	a5,a5,0x2
8000503a:	94be                	add	s1,s1,a5
8000503c:	0004a623          	sw	zero,12(s1)
    fileclose(rf);
80005040:	fe842503          	lw	a0,-24(s0)
80005044:	ba9fe0ef          	jal	80003bec <fileclose>
    fileclose(wf);
80005048:	fe442503          	lw	a0,-28(s0)
8000504c:	ba1fe0ef          	jal	80003bec <fileclose>
    return -1;
80005050:	57fd                	li	a5,-1
80005052:	a01d                	j	80005078 <sys_pipe+0xd0>
    if (fd0 >= 0)
80005054:	fe042783          	lw	a5,-32(s0)
80005058:	0007c763          	bltz	a5,80005066 <sys_pipe+0xbe>
      p->ofile[fd0] = 0;
8000505c:	07e1                	addi	a5,a5,24
8000505e:	078a                	slli	a5,a5,0x2
80005060:	97a6                	add	a5,a5,s1
80005062:	0007a623          	sw	zero,12(a5)
    fileclose(rf);
80005066:	fe842503          	lw	a0,-24(s0)
8000506a:	b83fe0ef          	jal	80003bec <fileclose>
    fileclose(wf);
8000506e:	fe442503          	lw	a0,-28(s0)
80005072:	b7bfe0ef          	jal	80003bec <fileclose>
    return -1;
80005076:	57fd                	li	a5,-1
}
80005078:	853e                	mv	a0,a5
8000507a:	50b2                	lw	ra,44(sp)
8000507c:	5422                	lw	s0,40(sp)
8000507e:	5492                	lw	s1,36(sp)
80005080:	6145                	addi	sp,sp,48
80005082:	8082                	ret
	...

80005090 <kernelvec>:
.globl kerneltrap
.globl kernelvec
.align 4
kernelvec:
        # make room to save registers.
        addi sp, sp, -128
80005090:	7119                	addi	sp,sp,-128

        # save caller-saved registers.
        sw ra, 0(sp)
80005092:	c006                	sw	ra,0(sp)
        # sw sp, 4(sp)
        sw gp, 8(sp)
80005094:	c40e                	sw	gp,8(sp)
        # sw tp, 12(sp)
        sw t0, 16(sp)
80005096:	c816                	sw	t0,16(sp)
        sw t1, 20(sp)
80005098:	ca1a                	sw	t1,20(sp)
        sw t2, 24(sp)
8000509a:	cc1e                	sw	t2,24(sp)
        sw a0, 36(sp)
8000509c:	d22a                	sw	a0,36(sp)
        sw a1, 40(sp)
8000509e:	d42e                	sw	a1,40(sp)
        sw a2, 44(sp)
800050a0:	d632                	sw	a2,44(sp)
        sw a3, 48(sp)
800050a2:	d836                	sw	a3,48(sp)
        sw a4, 52(sp)
800050a4:	da3a                	sw	a4,52(sp)
        sw a5, 56(sp)
800050a6:	dc3e                	sw	a5,56(sp)
        sw a6, 60(sp)
800050a8:	de42                	sw	a6,60(sp)
        sw a7, 64(sp)
800050aa:	c0c6                	sw	a7,64(sp)
        sw t3, 108(sp)
800050ac:	d6f2                	sw	t3,108(sp)
        sw t4, 112(sp)
800050ae:	d8f6                	sw	t4,112(sp)
        sw t5, 116(sp)
800050b0:	dafa                	sw	t5,116(sp)
        sw t6, 120(sp)
800050b2:	dcfe                	sw	t6,120(sp)

        # call the C trap handler in trap.c
        call kerneltrap
800050b4:	acafd0ef          	jal	8000237e <kerneltrap>

        # restore registers.
        lw ra, 0(sp)
800050b8:	4082                	lw	ra,0(sp)
        # lw sp, 4(sp)
        lw gp, 8(sp)
800050ba:	41a2                	lw	gp,8(sp)
        # not tp (contains hartid), in case we moved CPUs
        lw t0, 16(sp)
800050bc:	42c2                	lw	t0,16(sp)
        lw t1, 20(sp)
800050be:	4352                	lw	t1,20(sp)
        lw t2, 24(sp)
800050c0:	43e2                	lw	t2,24(sp)
        lw a0, 36(sp)
800050c2:	5512                	lw	a0,36(sp)
        lw a1, 40(sp)
800050c4:	55a2                	lw	a1,40(sp)
        lw a2, 44(sp)
800050c6:	5632                	lw	a2,44(sp)
        lw a3, 48(sp)
800050c8:	56c2                	lw	a3,48(sp)
        lw a4, 52(sp)
800050ca:	5752                	lw	a4,52(sp)
        lw a5, 56(sp)
800050cc:	57e2                	lw	a5,56(sp)
        lw a6, 60(sp)
800050ce:	5872                	lw	a6,60(sp)
        lw a7, 64(sp)
800050d0:	4886                	lw	a7,64(sp)
        lw t3, 108(sp)
800050d2:	5e36                	lw	t3,108(sp)
        lw t4, 112(sp)
800050d4:	5ec6                	lw	t4,112(sp)
        lw t5, 116(sp)
800050d6:	5f56                	lw	t5,116(sp)
        lw t6, 120(sp)
800050d8:	5fe6                	lw	t6,120(sp)

        addi sp, sp, 128
800050da:	6109                	addi	sp,sp,128

        # return to whatever we were doing in the kernel.
        sret
800050dc:	10200073          	sret
	...

800050ee <stubs_get_block>:

// Block data lookup: fills buf with data for the given block number.
// Returns 1 if found, 0 if block is beyond FSSIZE.
int
stubs_get_block(uint blockno, uchar *buf)
{
800050ee:	1141                	addi	sp,sp,-16
800050f0:	c606                	sw	ra,12(sp)
800050f2:	c422                	sw	s0,8(sp)
800050f4:	c226                	sw	s1,4(sp)
800050f6:	c04a                	sw	s2,0(sp)
800050f8:	0800                	addi	s0,sp,16
800050fa:	84aa                	mv	s1,a0
800050fc:	892e                	mv	s2,a1
  memset(buf, 0, BSIZE);
800050fe:	40000613          	li	a2,1024
80005102:	4581                	li	a1,0
80005104:	854a                	mv	a0,s2
80005106:	a5ffb0ef          	jal	80000b64 <memset>
  if (blockno >= FSSIZE) return 0;
8000510a:	7cf00793          	li	a5,1999
8000510e:	4501                	li	a0,0
80005110:	0297eb63          	bltu	a5,s1,80005146 <stubs_get_block+0x58>

  switch (blockno) {
80005114:	29a00793          	li	a5,666
80005118:	0097f463          	bgeu	a5,s1,80005120 <stubs_get_block+0x32>
8000511c:	60b0306f          	j	80008f26 <stubs_get_block+0x3e38>
80005120:	048a                	slli	s1,s1,0x2
80005122:	00006717          	auipc	a4,0x6
80005126:	58670713          	addi	a4,a4,1414 # 8000b6a8 <syscalls+0x58>
8000512a:	94ba                	add	s1,s1,a4
8000512c:	409c                	lw	a5,0(s1)
8000512e:	97ba                	add	a5,a5,a4
80005130:	8782                	jr	a5
  case 0:
    {
      static const uchar d[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
      memmove(buf, d, BSIZE);
80005132:	40000613          	li	a2,1024
80005136:	00007597          	auipc	a1,0x7
8000513a:	fde58593          	addi	a1,a1,-34 # 8000c114 <d.666>
8000513e:	854a                	mv	a0,s2
80005140:	a71fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005144:	4505                	li	a0,1
      return 1;
    }
  default:
    return 1; // zeroed block
  }
}
80005146:	40b2                	lw	ra,12(sp)
80005148:	4422                	lw	s0,8(sp)
8000514a:	4492                	lw	s1,4(sp)
8000514c:	4902                	lw	s2,0(sp)
8000514e:	0141                	addi	sp,sp,16
80005150:	8082                	ret
      memmove(buf, d, BSIZE);
80005152:	40000613          	li	a2,1024
80005156:	00007597          	auipc	a1,0x7
8000515a:	3be58593          	addi	a1,a1,958 # 8000c514 <d.665>
8000515e:	854a                	mv	a0,s2
80005160:	a51fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005164:	4505                	li	a0,1
80005166:	b7c5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005168:	40000613          	li	a2,1024
8000516c:	00007597          	auipc	a1,0x7
80005170:	7a858593          	addi	a1,a1,1960 # 8000c914 <d.664>
80005174:	854a                	mv	a0,s2
80005176:	a3bfb0ef          	jal	80000bb0 <memmove>
      return 1;
8000517a:	4505                	li	a0,1
8000517c:	b7e9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000517e:	40000613          	li	a2,1024
80005182:	00008597          	auipc	a1,0x8
80005186:	b9258593          	addi	a1,a1,-1134 # 8000cd14 <d.663>
8000518a:	854a                	mv	a0,s2
8000518c:	a25fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005190:	4505                	li	a0,1
80005192:	bf55                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005194:	40000613          	li	a2,1024
80005198:	00008597          	auipc	a1,0x8
8000519c:	f7c58593          	addi	a1,a1,-132 # 8000d114 <d.662>
800051a0:	854a                	mv	a0,s2
800051a2:	a0ffb0ef          	jal	80000bb0 <memmove>
      return 1;
800051a6:	4505                	li	a0,1
800051a8:	bf79                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800051aa:	40000613          	li	a2,1024
800051ae:	00008597          	auipc	a1,0x8
800051b2:	36658593          	addi	a1,a1,870 # 8000d514 <d.661>
800051b6:	854a                	mv	a0,s2
800051b8:	9f9fb0ef          	jal	80000bb0 <memmove>
      return 1;
800051bc:	4505                	li	a0,1
800051be:	b761                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800051c0:	40000613          	li	a2,1024
800051c4:	00008597          	auipc	a1,0x8
800051c8:	75058593          	addi	a1,a1,1872 # 8000d914 <d.660>
800051cc:	854a                	mv	a0,s2
800051ce:	9e3fb0ef          	jal	80000bb0 <memmove>
      return 1;
800051d2:	4505                	li	a0,1
800051d4:	bf8d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800051d6:	40000613          	li	a2,1024
800051da:	00009597          	auipc	a1,0x9
800051de:	b3a58593          	addi	a1,a1,-1222 # 8000dd14 <d.659>
800051e2:	854a                	mv	a0,s2
800051e4:	9cdfb0ef          	jal	80000bb0 <memmove>
      return 1;
800051e8:	4505                	li	a0,1
800051ea:	bfb1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800051ec:	40000613          	li	a2,1024
800051f0:	00009597          	auipc	a1,0x9
800051f4:	f2458593          	addi	a1,a1,-220 # 8000e114 <d.658>
800051f8:	854a                	mv	a0,s2
800051fa:	9b7fb0ef          	jal	80000bb0 <memmove>
      return 1;
800051fe:	4505                	li	a0,1
80005200:	b799                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005202:	40000613          	li	a2,1024
80005206:	00009597          	auipc	a1,0x9
8000520a:	30e58593          	addi	a1,a1,782 # 8000e514 <d.657>
8000520e:	854a                	mv	a0,s2
80005210:	9a1fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005214:	4505                	li	a0,1
80005216:	bf05                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005218:	40000613          	li	a2,1024
8000521c:	00009597          	auipc	a1,0x9
80005220:	6f858593          	addi	a1,a1,1784 # 8000e914 <d.656>
80005224:	854a                	mv	a0,s2
80005226:	98bfb0ef          	jal	80000bb0 <memmove>
      return 1;
8000522a:	4505                	li	a0,1
8000522c:	bf29                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000522e:	40000613          	li	a2,1024
80005232:	0000a597          	auipc	a1,0xa
80005236:	ae258593          	addi	a1,a1,-1310 # 8000ed14 <d.655>
8000523a:	854a                	mv	a0,s2
8000523c:	975fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005240:	4505                	li	a0,1
80005242:	b711                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005244:	40000613          	li	a2,1024
80005248:	0000a597          	auipc	a1,0xa
8000524c:	ecc58593          	addi	a1,a1,-308 # 8000f114 <d.654>
80005250:	854a                	mv	a0,s2
80005252:	95ffb0ef          	jal	80000bb0 <memmove>
      return 1;
80005256:	4505                	li	a0,1
80005258:	b5fd                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000525a:	40000613          	li	a2,1024
8000525e:	0000a597          	auipc	a1,0xa
80005262:	2b658593          	addi	a1,a1,694 # 8000f514 <d.653>
80005266:	854a                	mv	a0,s2
80005268:	949fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000526c:	4505                	li	a0,1
8000526e:	bde1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005270:	40000613          	li	a2,1024
80005274:	0000a597          	auipc	a1,0xa
80005278:	6a058593          	addi	a1,a1,1696 # 8000f914 <d.652>
8000527c:	854a                	mv	a0,s2
8000527e:	933fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005282:	4505                	li	a0,1
80005284:	b5c9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005286:	40000613          	li	a2,1024
8000528a:	0000b597          	auipc	a1,0xb
8000528e:	a8a58593          	addi	a1,a1,-1398 # 8000fd14 <d.651>
80005292:	854a                	mv	a0,s2
80005294:	91dfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005298:	4505                	li	a0,1
8000529a:	b575                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000529c:	40000613          	li	a2,1024
800052a0:	0000b597          	auipc	a1,0xb
800052a4:	e7458593          	addi	a1,a1,-396 # 80010114 <d.650>
800052a8:	854a                	mv	a0,s2
800052aa:	907fb0ef          	jal	80000bb0 <memmove>
      return 1;
800052ae:	4505                	li	a0,1
800052b0:	bd59                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800052b2:	40000613          	li	a2,1024
800052b6:	0000b597          	auipc	a1,0xb
800052ba:	25e58593          	addi	a1,a1,606 # 80010514 <d.649>
800052be:	854a                	mv	a0,s2
800052c0:	8f1fb0ef          	jal	80000bb0 <memmove>
      return 1;
800052c4:	4505                	li	a0,1
800052c6:	b541                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800052c8:	40000613          	li	a2,1024
800052cc:	0000b597          	auipc	a1,0xb
800052d0:	64858593          	addi	a1,a1,1608 # 80010914 <d.648>
800052d4:	854a                	mv	a0,s2
800052d6:	8dbfb0ef          	jal	80000bb0 <memmove>
      return 1;
800052da:	4505                	li	a0,1
800052dc:	b5ad                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800052de:	40000613          	li	a2,1024
800052e2:	0000c597          	auipc	a1,0xc
800052e6:	a3258593          	addi	a1,a1,-1486 # 80010d14 <d.647>
800052ea:	854a                	mv	a0,s2
800052ec:	8c5fb0ef          	jal	80000bb0 <memmove>
      return 1;
800052f0:	4505                	li	a0,1
800052f2:	bd91                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800052f4:	40000613          	li	a2,1024
800052f8:	0000c597          	auipc	a1,0xc
800052fc:	e1c58593          	addi	a1,a1,-484 # 80011114 <d.646>
80005300:	854a                	mv	a0,s2
80005302:	8affb0ef          	jal	80000bb0 <memmove>
      return 1;
80005306:	4505                	li	a0,1
80005308:	bd3d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000530a:	40000613          	li	a2,1024
8000530e:	0000c597          	auipc	a1,0xc
80005312:	20658593          	addi	a1,a1,518 # 80011514 <d.645>
80005316:	854a                	mv	a0,s2
80005318:	899fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000531c:	4505                	li	a0,1
8000531e:	b525                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005320:	40000613          	li	a2,1024
80005324:	0000c597          	auipc	a1,0xc
80005328:	5f058593          	addi	a1,a1,1520 # 80011914 <d.644>
8000532c:	854a                	mv	a0,s2
8000532e:	883fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005332:	4505                	li	a0,1
80005334:	bd09                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005336:	40000613          	li	a2,1024
8000533a:	0000d597          	auipc	a1,0xd
8000533e:	9da58593          	addi	a1,a1,-1574 # 80011d14 <d.643>
80005342:	854a                	mv	a0,s2
80005344:	86dfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005348:	4505                	li	a0,1
8000534a:	bbf5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000534c:	40000613          	li	a2,1024
80005350:	0000d597          	auipc	a1,0xd
80005354:	dc458593          	addi	a1,a1,-572 # 80012114 <d.642>
80005358:	854a                	mv	a0,s2
8000535a:	857fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000535e:	4505                	li	a0,1
80005360:	b3dd                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005362:	40000613          	li	a2,1024
80005366:	0000d597          	auipc	a1,0xd
8000536a:	1ae58593          	addi	a1,a1,430 # 80012514 <d.641>
8000536e:	854a                	mv	a0,s2
80005370:	841fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005374:	4505                	li	a0,1
80005376:	bbc1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005378:	40000613          	li	a2,1024
8000537c:	0000d597          	auipc	a1,0xd
80005380:	59858593          	addi	a1,a1,1432 # 80012914 <d.640>
80005384:	854a                	mv	a0,s2
80005386:	82bfb0ef          	jal	80000bb0 <memmove>
      return 1;
8000538a:	4505                	li	a0,1
8000538c:	bb6d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000538e:	40000613          	li	a2,1024
80005392:	0000e597          	auipc	a1,0xe
80005396:	98258593          	addi	a1,a1,-1662 # 80012d14 <d.639>
8000539a:	854a                	mv	a0,s2
8000539c:	815fb0ef          	jal	80000bb0 <memmove>
      return 1;
800053a0:	4505                	li	a0,1
800053a2:	b355                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800053a4:	40000613          	li	a2,1024
800053a8:	0000e597          	auipc	a1,0xe
800053ac:	d6c58593          	addi	a1,a1,-660 # 80013114 <d.638>
800053b0:	854a                	mv	a0,s2
800053b2:	ffefb0ef          	jal	80000bb0 <memmove>
      return 1;
800053b6:	4505                	li	a0,1
800053b8:	b379                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800053ba:	40000613          	li	a2,1024
800053be:	0000e597          	auipc	a1,0xe
800053c2:	15658593          	addi	a1,a1,342 # 80013514 <d.637>
800053c6:	854a                	mv	a0,s2
800053c8:	fe8fb0ef          	jal	80000bb0 <memmove>
      return 1;
800053cc:	4505                	li	a0,1
800053ce:	bba5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800053d0:	40000613          	li	a2,1024
800053d4:	0000e597          	auipc	a1,0xe
800053d8:	54058593          	addi	a1,a1,1344 # 80013914 <d.636>
800053dc:	854a                	mv	a0,s2
800053de:	fd2fb0ef          	jal	80000bb0 <memmove>
      return 1;
800053e2:	4505                	li	a0,1
800053e4:	b38d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800053e6:	40000613          	li	a2,1024
800053ea:	0000f597          	auipc	a1,0xf
800053ee:	92a58593          	addi	a1,a1,-1750 # 80013d14 <d.635>
800053f2:	854a                	mv	a0,s2
800053f4:	fbcfb0ef          	jal	80000bb0 <memmove>
      return 1;
800053f8:	4505                	li	a0,1
800053fa:	b3b1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800053fc:	40000613          	li	a2,1024
80005400:	0000f597          	auipc	a1,0xf
80005404:	d1458593          	addi	a1,a1,-748 # 80014114 <d.634>
80005408:	854a                	mv	a0,s2
8000540a:	fa6fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000540e:	4505                	li	a0,1
80005410:	bb1d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005412:	40000613          	li	a2,1024
80005416:	0000f597          	auipc	a1,0xf
8000541a:	0fe58593          	addi	a1,a1,254 # 80014514 <d.633>
8000541e:	854a                	mv	a0,s2
80005420:	f90fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005424:	4505                	li	a0,1
80005426:	b305                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005428:	40000613          	li	a2,1024
8000542c:	0000f597          	auipc	a1,0xf
80005430:	4e858593          	addi	a1,a1,1256 # 80014914 <d.632>
80005434:	854a                	mv	a0,s2
80005436:	f7afb0ef          	jal	80000bb0 <memmove>
      return 1;
8000543a:	4505                	li	a0,1
8000543c:	b329                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000543e:	40000613          	li	a2,1024
80005442:	00010597          	auipc	a1,0x10
80005446:	8d258593          	addi	a1,a1,-1838 # 80014d14 <d.631>
8000544a:	854a                	mv	a0,s2
8000544c:	f64fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005450:	4505                	li	a0,1
80005452:	b9d5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005454:	40000613          	li	a2,1024
80005458:	00010597          	auipc	a1,0x10
8000545c:	cbc58593          	addi	a1,a1,-836 # 80015114 <d.630>
80005460:	854a                	mv	a0,s2
80005462:	f4efb0ef          	jal	80000bb0 <memmove>
      return 1;
80005466:	4505                	li	a0,1
80005468:	b9f9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000546a:	40000613          	li	a2,1024
8000546e:	00010597          	auipc	a1,0x10
80005472:	0a658593          	addi	a1,a1,166 # 80015514 <d.629>
80005476:	854a                	mv	a0,s2
80005478:	f38fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000547c:	4505                	li	a0,1
8000547e:	b1e1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005480:	40000613          	li	a2,1024
80005484:	00010597          	auipc	a1,0x10
80005488:	49058593          	addi	a1,a1,1168 # 80015914 <d.628>
8000548c:	854a                	mv	a0,s2
8000548e:	f22fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005492:	4505                	li	a0,1
80005494:	b94d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005496:	40000613          	li	a2,1024
8000549a:	00011597          	auipc	a1,0x11
8000549e:	87a58593          	addi	a1,a1,-1926 # 80015d14 <d.627>
800054a2:	854a                	mv	a0,s2
800054a4:	f0cfb0ef          	jal	80000bb0 <memmove>
      return 1;
800054a8:	4505                	li	a0,1
800054aa:	b971                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800054ac:	40000613          	li	a2,1024
800054b0:	00011597          	auipc	a1,0x11
800054b4:	c6458593          	addi	a1,a1,-924 # 80016114 <d.626>
800054b8:	854a                	mv	a0,s2
800054ba:	ef6fb0ef          	jal	80000bb0 <memmove>
      return 1;
800054be:	4505                	li	a0,1
800054c0:	b159                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800054c2:	40000613          	li	a2,1024
800054c6:	00011597          	auipc	a1,0x11
800054ca:	04e58593          	addi	a1,a1,78 # 80016514 <d.625>
800054ce:	854a                	mv	a0,s2
800054d0:	ee0fb0ef          	jal	80000bb0 <memmove>
      return 1;
800054d4:	4505                	li	a0,1
800054d6:	b985                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800054d8:	40000613          	li	a2,1024
800054dc:	00011597          	auipc	a1,0x11
800054e0:	43858593          	addi	a1,a1,1080 # 80016914 <d.624>
800054e4:	854a                	mv	a0,s2
800054e6:	ecafb0ef          	jal	80000bb0 <memmove>
      return 1;
800054ea:	4505                	li	a0,1
800054ec:	b9a9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800054ee:	40000613          	li	a2,1024
800054f2:	00012597          	auipc	a1,0x12
800054f6:	82258593          	addi	a1,a1,-2014 # 80016d14 <d.623>
800054fa:	854a                	mv	a0,s2
800054fc:	eb4fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005500:	4505                	li	a0,1
80005502:	b191                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005504:	40000613          	li	a2,1024
80005508:	00012597          	auipc	a1,0x12
8000550c:	c0c58593          	addi	a1,a1,-1012 # 80017114 <d.622>
80005510:	854a                	mv	a0,s2
80005512:	e9efb0ef          	jal	80000bb0 <memmove>
      return 1;
80005516:	4505                	li	a0,1
80005518:	b13d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000551a:	40000613          	li	a2,1024
8000551e:	00012597          	auipc	a1,0x12
80005522:	ff658593          	addi	a1,a1,-10 # 80017514 <d.621>
80005526:	854a                	mv	a0,s2
80005528:	e88fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000552c:	4505                	li	a0,1
8000552e:	b921                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005530:	40000613          	li	a2,1024
80005534:	00012597          	auipc	a1,0x12
80005538:	3e058593          	addi	a1,a1,992 # 80017914 <d.620>
8000553c:	854a                	mv	a0,s2
8000553e:	e72fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005542:	4505                	li	a0,1
80005544:	b109                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005546:	40000613          	li	a2,1024
8000554a:	00012597          	auipc	a1,0x12
8000554e:	7ca58593          	addi	a1,a1,1994 # 80017d14 <d.619>
80005552:	854a                	mv	a0,s2
80005554:	e5cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005558:	4505                	li	a0,1
8000555a:	b6f5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000555c:	40000613          	li	a2,1024
80005560:	00013597          	auipc	a1,0x13
80005564:	bb458593          	addi	a1,a1,-1100 # 80018114 <d.618>
80005568:	854a                	mv	a0,s2
8000556a:	e46fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000556e:	4505                	li	a0,1
80005570:	bed9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005572:	40000613          	li	a2,1024
80005576:	00013597          	auipc	a1,0x13
8000557a:	f9e58593          	addi	a1,a1,-98 # 80018514 <d.617>
8000557e:	854a                	mv	a0,s2
80005580:	e30fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005584:	4505                	li	a0,1
80005586:	b6c1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005588:	40000613          	li	a2,1024
8000558c:	00013597          	auipc	a1,0x13
80005590:	38858593          	addi	a1,a1,904 # 80018914 <d.616>
80005594:	854a                	mv	a0,s2
80005596:	e1afb0ef          	jal	80000bb0 <memmove>
      return 1;
8000559a:	4505                	li	a0,1
8000559c:	b66d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000559e:	40000613          	li	a2,1024
800055a2:	00013597          	auipc	a1,0x13
800055a6:	77258593          	addi	a1,a1,1906 # 80018d14 <d.615>
800055aa:	854a                	mv	a0,s2
800055ac:	e04fb0ef          	jal	80000bb0 <memmove>
      return 1;
800055b0:	4505                	li	a0,1
800055b2:	be51                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800055b4:	40000613          	li	a2,1024
800055b8:	00014597          	auipc	a1,0x14
800055bc:	b5c58593          	addi	a1,a1,-1188 # 80019114 <d.614>
800055c0:	854a                	mv	a0,s2
800055c2:	deefb0ef          	jal	80000bb0 <memmove>
      return 1;
800055c6:	4505                	li	a0,1
800055c8:	bebd                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800055ca:	40000613          	li	a2,1024
800055ce:	00014597          	auipc	a1,0x14
800055d2:	f4658593          	addi	a1,a1,-186 # 80019514 <d.613>
800055d6:	854a                	mv	a0,s2
800055d8:	dd8fb0ef          	jal	80000bb0 <memmove>
      return 1;
800055dc:	4505                	li	a0,1
800055de:	b6a5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800055e0:	40000613          	li	a2,1024
800055e4:	00014597          	auipc	a1,0x14
800055e8:	33058593          	addi	a1,a1,816 # 80019914 <d.612>
800055ec:	854a                	mv	a0,s2
800055ee:	dc2fb0ef          	jal	80000bb0 <memmove>
      return 1;
800055f2:	4505                	li	a0,1
800055f4:	be89                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800055f6:	40000613          	li	a2,1024
800055fa:	00014597          	auipc	a1,0x14
800055fe:	71a58593          	addi	a1,a1,1818 # 80019d14 <d.611>
80005602:	854a                	mv	a0,s2
80005604:	dacfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005608:	4505                	li	a0,1
8000560a:	be35                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000560c:	40000613          	li	a2,1024
80005610:	00015597          	auipc	a1,0x15
80005614:	b0458593          	addi	a1,a1,-1276 # 8001a114 <d.610>
80005618:	854a                	mv	a0,s2
8000561a:	d96fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000561e:	4505                	li	a0,1
80005620:	b61d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005622:	40000613          	li	a2,1024
80005626:	00015597          	auipc	a1,0x15
8000562a:	eee58593          	addi	a1,a1,-274 # 8001a514 <d.609>
8000562e:	854a                	mv	a0,s2
80005630:	d80fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005634:	4505                	li	a0,1
80005636:	be01                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005638:	40000613          	li	a2,1024
8000563c:	00015597          	auipc	a1,0x15
80005640:	2d858593          	addi	a1,a1,728 # 8001a914 <d.608>
80005644:	854a                	mv	a0,s2
80005646:	d6afb0ef          	jal	80000bb0 <memmove>
      return 1;
8000564a:	4505                	li	a0,1
8000564c:	bced                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000564e:	40000613          	li	a2,1024
80005652:	00015597          	auipc	a1,0x15
80005656:	6c258593          	addi	a1,a1,1730 # 8001ad14 <d.607>
8000565a:	854a                	mv	a0,s2
8000565c:	d54fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005660:	4505                	li	a0,1
80005662:	b4d5                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005664:	40000613          	li	a2,1024
80005668:	00016597          	auipc	a1,0x16
8000566c:	aac58593          	addi	a1,a1,-1364 # 8001b114 <d.606>
80005670:	854a                	mv	a0,s2
80005672:	d3efb0ef          	jal	80000bb0 <memmove>
      return 1;
80005676:	4505                	li	a0,1
80005678:	b4f9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000567a:	40000613          	li	a2,1024
8000567e:	00016597          	auipc	a1,0x16
80005682:	e9658593          	addi	a1,a1,-362 # 8001b514 <d.605>
80005686:	854a                	mv	a0,s2
80005688:	d28fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000568c:	4505                	li	a0,1
8000568e:	bc65                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005690:	40000613          	li	a2,1024
80005694:	00016597          	auipc	a1,0x16
80005698:	28058593          	addi	a1,a1,640 # 8001b914 <d.604>
8000569c:	854a                	mv	a0,s2
8000569e:	d12fb0ef          	jal	80000bb0 <memmove>
      return 1;
800056a2:	4505                	li	a0,1
800056a4:	b44d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800056a6:	40000613          	li	a2,1024
800056aa:	00016597          	auipc	a1,0x16
800056ae:	66a58593          	addi	a1,a1,1642 # 8001bd14 <d.603>
800056b2:	854a                	mv	a0,s2
800056b4:	cfcfb0ef          	jal	80000bb0 <memmove>
      return 1;
800056b8:	4505                	li	a0,1
800056ba:	b471                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800056bc:	40000613          	li	a2,1024
800056c0:	00017597          	auipc	a1,0x17
800056c4:	a5458593          	addi	a1,a1,-1452 # 8001c114 <d.602>
800056c8:	854a                	mv	a0,s2
800056ca:	ce6fb0ef          	jal	80000bb0 <memmove>
      return 1;
800056ce:	4505                	li	a0,1
800056d0:	bc9d                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800056d2:	40000613          	li	a2,1024
800056d6:	00017597          	auipc	a1,0x17
800056da:	e3e58593          	addi	a1,a1,-450 # 8001c514 <d.601>
800056de:	854a                	mv	a0,s2
800056e0:	cd0fb0ef          	jal	80000bb0 <memmove>
      return 1;
800056e4:	4505                	li	a0,1
800056e6:	b485                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800056e8:	40000613          	li	a2,1024
800056ec:	00017597          	auipc	a1,0x17
800056f0:	22858593          	addi	a1,a1,552 # 8001c914 <d.600>
800056f4:	854a                	mv	a0,s2
800056f6:	cbafb0ef          	jal	80000bb0 <memmove>
      return 1;
800056fa:	4505                	li	a0,1
800056fc:	b4a9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800056fe:	40000613          	li	a2,1024
80005702:	00017597          	auipc	a1,0x17
80005706:	61258593          	addi	a1,a1,1554 # 8001cd14 <d.599>
8000570a:	854a                	mv	a0,s2
8000570c:	ca4fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005710:	4505                	li	a0,1
80005712:	bc15                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005714:	40000613          	li	a2,1024
80005718:	00018597          	auipc	a1,0x18
8000571c:	9fc58593          	addi	a1,a1,-1540 # 8001d114 <d.598>
80005720:	854a                	mv	a0,s2
80005722:	c8efb0ef          	jal	80000bb0 <memmove>
      return 1;
80005726:	4505                	li	a0,1
80005728:	bc39                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000572a:	40000613          	li	a2,1024
8000572e:	00018597          	auipc	a1,0x18
80005732:	de658593          	addi	a1,a1,-538 # 8001d514 <d.597>
80005736:	854a                	mv	a0,s2
80005738:	c78fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000573c:	4505                	li	a0,1
8000573e:	b421                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005740:	40000613          	li	a2,1024
80005744:	00018597          	auipc	a1,0x18
80005748:	1d058593          	addi	a1,a1,464 # 8001d914 <d.596>
8000574c:	854a                	mv	a0,s2
8000574e:	c62fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005752:	4505                	li	a0,1
80005754:	bacd                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005756:	40000613          	li	a2,1024
8000575a:	00018597          	auipc	a1,0x18
8000575e:	5ba58593          	addi	a1,a1,1466 # 8001dd14 <d.595>
80005762:	854a                	mv	a0,s2
80005764:	c4cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005768:	4505                	li	a0,1
8000576a:	baf1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000576c:	40000613          	li	a2,1024
80005770:	00019597          	auipc	a1,0x19
80005774:	9a458593          	addi	a1,a1,-1628 # 8001e114 <d.594>
80005778:	854a                	mv	a0,s2
8000577a:	c36fb0ef          	jal	80000bb0 <memmove>
      return 1;
8000577e:	4505                	li	a0,1
80005780:	b2d9                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005782:	40000613          	li	a2,1024
80005786:	00019597          	auipc	a1,0x19
8000578a:	d8e58593          	addi	a1,a1,-626 # 8001e514 <d.593>
8000578e:	854a                	mv	a0,s2
80005790:	c20fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005794:	4505                	li	a0,1
80005796:	ba45                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005798:	40000613          	li	a2,1024
8000579c:	00019597          	auipc	a1,0x19
800057a0:	17858593          	addi	a1,a1,376 # 8001e914 <d.592>
800057a4:	854a                	mv	a0,s2
800057a6:	c0afb0ef          	jal	80000bb0 <memmove>
      return 1;
800057aa:	4505                	li	a0,1
800057ac:	ba69                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800057ae:	40000613          	li	a2,1024
800057b2:	00019597          	auipc	a1,0x19
800057b6:	56258593          	addi	a1,a1,1378 # 8001ed14 <d.591>
800057ba:	854a                	mv	a0,s2
800057bc:	bf4fb0ef          	jal	80000bb0 <memmove>
      return 1;
800057c0:	4505                	li	a0,1
800057c2:	b251                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800057c4:	40000613          	li	a2,1024
800057c8:	0001a597          	auipc	a1,0x1a
800057cc:	94c58593          	addi	a1,a1,-1716 # 8001f114 <d.590>
800057d0:	854a                	mv	a0,s2
800057d2:	bdefb0ef          	jal	80000bb0 <memmove>
      return 1;
800057d6:	4505                	li	a0,1
800057d8:	b2bd                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800057da:	40000613          	li	a2,1024
800057de:	0001a597          	auipc	a1,0x1a
800057e2:	d3658593          	addi	a1,a1,-714 # 8001f514 <d.589>
800057e6:	854a                	mv	a0,s2
800057e8:	bc8fb0ef          	jal	80000bb0 <memmove>
      return 1;
800057ec:	4505                	li	a0,1
800057ee:	baa1                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800057f0:	40000613          	li	a2,1024
800057f4:	0001a597          	auipc	a1,0x1a
800057f8:	12058593          	addi	a1,a1,288 # 8001f914 <d.588>
800057fc:	854a                	mv	a0,s2
800057fe:	bb2fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005802:	4505                	li	a0,1
80005804:	b289                	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005806:	40000613          	li	a2,1024
8000580a:	0001a597          	auipc	a1,0x1a
8000580e:	50a58593          	addi	a1,a1,1290 # 8001fd14 <d.587>
80005812:	854a                	mv	a0,s2
80005814:	b9cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005818:	4505                	li	a0,1
8000581a:	92dff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000581e:	40000613          	li	a2,1024
80005822:	0001b597          	auipc	a1,0x1b
80005826:	8f258593          	addi	a1,a1,-1806 # 80020114 <d.586>
8000582a:	854a                	mv	a0,s2
8000582c:	b84fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005830:	4505                	li	a0,1
80005832:	915ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005836:	40000613          	li	a2,1024
8000583a:	0001b597          	auipc	a1,0x1b
8000583e:	cda58593          	addi	a1,a1,-806 # 80020514 <d.585>
80005842:	854a                	mv	a0,s2
80005844:	b6cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005848:	4505                	li	a0,1
8000584a:	8fdff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000584e:	40000613          	li	a2,1024
80005852:	0001b597          	auipc	a1,0x1b
80005856:	0c258593          	addi	a1,a1,194 # 80020914 <d.584>
8000585a:	854a                	mv	a0,s2
8000585c:	b54fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005860:	4505                	li	a0,1
80005862:	8e5ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005866:	40000613          	li	a2,1024
8000586a:	0001b597          	auipc	a1,0x1b
8000586e:	4aa58593          	addi	a1,a1,1194 # 80020d14 <d.583>
80005872:	854a                	mv	a0,s2
80005874:	b3cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005878:	4505                	li	a0,1
8000587a:	8cdff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000587e:	40000613          	li	a2,1024
80005882:	0001c597          	auipc	a1,0x1c
80005886:	89258593          	addi	a1,a1,-1902 # 80021114 <d.582>
8000588a:	854a                	mv	a0,s2
8000588c:	b24fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005890:	4505                	li	a0,1
80005892:	8b5ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005896:	40000613          	li	a2,1024
8000589a:	0001c597          	auipc	a1,0x1c
8000589e:	c7a58593          	addi	a1,a1,-902 # 80021514 <d.581>
800058a2:	854a                	mv	a0,s2
800058a4:	b0cfb0ef          	jal	80000bb0 <memmove>
      return 1;
800058a8:	4505                	li	a0,1
800058aa:	89dff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800058ae:	40000613          	li	a2,1024
800058b2:	0001c597          	auipc	a1,0x1c
800058b6:	06258593          	addi	a1,a1,98 # 80021914 <d.580>
800058ba:	854a                	mv	a0,s2
800058bc:	af4fb0ef          	jal	80000bb0 <memmove>
      return 1;
800058c0:	4505                	li	a0,1
800058c2:	885ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800058c6:	40000613          	li	a2,1024
800058ca:	0001c597          	auipc	a1,0x1c
800058ce:	44a58593          	addi	a1,a1,1098 # 80021d14 <d.579>
800058d2:	854a                	mv	a0,s2
800058d4:	adcfb0ef          	jal	80000bb0 <memmove>
      return 1;
800058d8:	4505                	li	a0,1
800058da:	86dff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800058de:	40000613          	li	a2,1024
800058e2:	0001d597          	auipc	a1,0x1d
800058e6:	83258593          	addi	a1,a1,-1998 # 80022114 <d.578>
800058ea:	854a                	mv	a0,s2
800058ec:	ac4fb0ef          	jal	80000bb0 <memmove>
      return 1;
800058f0:	4505                	li	a0,1
800058f2:	855ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800058f6:	40000613          	li	a2,1024
800058fa:	0001d597          	auipc	a1,0x1d
800058fe:	c1a58593          	addi	a1,a1,-998 # 80022514 <d.577>
80005902:	854a                	mv	a0,s2
80005904:	aacfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005908:	4505                	li	a0,1
8000590a:	83dff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000590e:	40000613          	li	a2,1024
80005912:	0001d597          	auipc	a1,0x1d
80005916:	00258593          	addi	a1,a1,2 # 80022914 <d.576>
8000591a:	854a                	mv	a0,s2
8000591c:	a94fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005920:	4505                	li	a0,1
80005922:	825ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005926:	40000613          	li	a2,1024
8000592a:	0001d597          	auipc	a1,0x1d
8000592e:	3ea58593          	addi	a1,a1,1002 # 80022d14 <d.575>
80005932:	854a                	mv	a0,s2
80005934:	a7cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005938:	4505                	li	a0,1
8000593a:	80dff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000593e:	40000613          	li	a2,1024
80005942:	0001d597          	auipc	a1,0x1d
80005946:	7d258593          	addi	a1,a1,2002 # 80023114 <d.574>
8000594a:	854a                	mv	a0,s2
8000594c:	a64fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005950:	4505                	li	a0,1
80005952:	ff4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005956:	40000613          	li	a2,1024
8000595a:	0001e597          	auipc	a1,0x1e
8000595e:	bba58593          	addi	a1,a1,-1094 # 80023514 <d.573>
80005962:	854a                	mv	a0,s2
80005964:	a4cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005968:	4505                	li	a0,1
8000596a:	fdcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000596e:	40000613          	li	a2,1024
80005972:	0001e597          	auipc	a1,0x1e
80005976:	fa258593          	addi	a1,a1,-94 # 80023914 <d.572>
8000597a:	854a                	mv	a0,s2
8000597c:	a34fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005980:	4505                	li	a0,1
80005982:	fc4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005986:	40000613          	li	a2,1024
8000598a:	0001e597          	auipc	a1,0x1e
8000598e:	38a58593          	addi	a1,a1,906 # 80023d14 <d.571>
80005992:	854a                	mv	a0,s2
80005994:	a1cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005998:	4505                	li	a0,1
8000599a:	facff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000599e:	40000613          	li	a2,1024
800059a2:	0001e597          	auipc	a1,0x1e
800059a6:	77258593          	addi	a1,a1,1906 # 80024114 <d.570>
800059aa:	854a                	mv	a0,s2
800059ac:	a04fb0ef          	jal	80000bb0 <memmove>
      return 1;
800059b0:	4505                	li	a0,1
800059b2:	f94ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800059b6:	40000613          	li	a2,1024
800059ba:	0001f597          	auipc	a1,0x1f
800059be:	b5a58593          	addi	a1,a1,-1190 # 80024514 <d.569>
800059c2:	854a                	mv	a0,s2
800059c4:	9ecfb0ef          	jal	80000bb0 <memmove>
      return 1;
800059c8:	4505                	li	a0,1
800059ca:	f7cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800059ce:	40000613          	li	a2,1024
800059d2:	0001f597          	auipc	a1,0x1f
800059d6:	f4258593          	addi	a1,a1,-190 # 80024914 <d.568>
800059da:	854a                	mv	a0,s2
800059dc:	9d4fb0ef          	jal	80000bb0 <memmove>
      return 1;
800059e0:	4505                	li	a0,1
800059e2:	f64ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800059e6:	40000613          	li	a2,1024
800059ea:	0001f597          	auipc	a1,0x1f
800059ee:	32a58593          	addi	a1,a1,810 # 80024d14 <d.567>
800059f2:	854a                	mv	a0,s2
800059f4:	9bcfb0ef          	jal	80000bb0 <memmove>
      return 1;
800059f8:	4505                	li	a0,1
800059fa:	f4cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800059fe:	40000613          	li	a2,1024
80005a02:	0001f597          	auipc	a1,0x1f
80005a06:	71258593          	addi	a1,a1,1810 # 80025114 <d.566>
80005a0a:	854a                	mv	a0,s2
80005a0c:	9a4fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005a10:	4505                	li	a0,1
80005a12:	f34ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005a16:	40000613          	li	a2,1024
80005a1a:	00020597          	auipc	a1,0x20
80005a1e:	afa58593          	addi	a1,a1,-1286 # 80025514 <d.565>
80005a22:	854a                	mv	a0,s2
80005a24:	98cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005a28:	4505                	li	a0,1
80005a2a:	f1cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005a2e:	40000613          	li	a2,1024
80005a32:	00020597          	auipc	a1,0x20
80005a36:	ee258593          	addi	a1,a1,-286 # 80025914 <d.564>
80005a3a:	854a                	mv	a0,s2
80005a3c:	974fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005a40:	4505                	li	a0,1
80005a42:	f04ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005a46:	40000613          	li	a2,1024
80005a4a:	00020597          	auipc	a1,0x20
80005a4e:	2ca58593          	addi	a1,a1,714 # 80025d14 <d.563>
80005a52:	854a                	mv	a0,s2
80005a54:	95cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005a58:	4505                	li	a0,1
80005a5a:	eecff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005a5e:	40000613          	li	a2,1024
80005a62:	00020597          	auipc	a1,0x20
80005a66:	6b258593          	addi	a1,a1,1714 # 80026114 <d.562>
80005a6a:	854a                	mv	a0,s2
80005a6c:	944fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005a70:	4505                	li	a0,1
80005a72:	ed4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005a76:	40000613          	li	a2,1024
80005a7a:	00021597          	auipc	a1,0x21
80005a7e:	a9a58593          	addi	a1,a1,-1382 # 80026514 <d.561>
80005a82:	854a                	mv	a0,s2
80005a84:	92cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005a88:	4505                	li	a0,1
80005a8a:	ebcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005a8e:	40000613          	li	a2,1024
80005a92:	00021597          	auipc	a1,0x21
80005a96:	e8258593          	addi	a1,a1,-382 # 80026914 <d.560>
80005a9a:	854a                	mv	a0,s2
80005a9c:	914fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005aa0:	4505                	li	a0,1
80005aa2:	ea4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005aa6:	40000613          	li	a2,1024
80005aaa:	00021597          	auipc	a1,0x21
80005aae:	26a58593          	addi	a1,a1,618 # 80026d14 <d.559>
80005ab2:	854a                	mv	a0,s2
80005ab4:	8fcfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005ab8:	4505                	li	a0,1
80005aba:	e8cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005abe:	40000613          	li	a2,1024
80005ac2:	00021597          	auipc	a1,0x21
80005ac6:	65258593          	addi	a1,a1,1618 # 80027114 <d.558>
80005aca:	854a                	mv	a0,s2
80005acc:	8e4fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005ad0:	4505                	li	a0,1
80005ad2:	e74ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005ad6:	40000613          	li	a2,1024
80005ada:	00022597          	auipc	a1,0x22
80005ade:	a3a58593          	addi	a1,a1,-1478 # 80027514 <d.557>
80005ae2:	854a                	mv	a0,s2
80005ae4:	8ccfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005ae8:	4505                	li	a0,1
80005aea:	e5cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005aee:	40000613          	li	a2,1024
80005af2:	00022597          	auipc	a1,0x22
80005af6:	e2258593          	addi	a1,a1,-478 # 80027914 <d.556>
80005afa:	854a                	mv	a0,s2
80005afc:	8b4fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b00:	4505                	li	a0,1
80005b02:	e44ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b06:	40000613          	li	a2,1024
80005b0a:	00022597          	auipc	a1,0x22
80005b0e:	20a58593          	addi	a1,a1,522 # 80027d14 <d.555>
80005b12:	854a                	mv	a0,s2
80005b14:	89cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b18:	4505                	li	a0,1
80005b1a:	e2cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b1e:	40000613          	li	a2,1024
80005b22:	00022597          	auipc	a1,0x22
80005b26:	5f258593          	addi	a1,a1,1522 # 80028114 <d.554>
80005b2a:	854a                	mv	a0,s2
80005b2c:	884fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b30:	4505                	li	a0,1
80005b32:	e14ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b36:	40000613          	li	a2,1024
80005b3a:	00023597          	auipc	a1,0x23
80005b3e:	9da58593          	addi	a1,a1,-1574 # 80028514 <d.553>
80005b42:	854a                	mv	a0,s2
80005b44:	86cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b48:	4505                	li	a0,1
80005b4a:	dfcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b4e:	40000613          	li	a2,1024
80005b52:	00023597          	auipc	a1,0x23
80005b56:	dc258593          	addi	a1,a1,-574 # 80028914 <d.552>
80005b5a:	854a                	mv	a0,s2
80005b5c:	854fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b60:	4505                	li	a0,1
80005b62:	de4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b66:	40000613          	li	a2,1024
80005b6a:	00023597          	auipc	a1,0x23
80005b6e:	1aa58593          	addi	a1,a1,426 # 80028d14 <d.551>
80005b72:	854a                	mv	a0,s2
80005b74:	83cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b78:	4505                	li	a0,1
80005b7a:	dccff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b7e:	40000613          	li	a2,1024
80005b82:	00023597          	auipc	a1,0x23
80005b86:	59258593          	addi	a1,a1,1426 # 80029114 <d.550>
80005b8a:	854a                	mv	a0,s2
80005b8c:	824fb0ef          	jal	80000bb0 <memmove>
      return 1;
80005b90:	4505                	li	a0,1
80005b92:	db4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005b96:	40000613          	li	a2,1024
80005b9a:	00024597          	auipc	a1,0x24
80005b9e:	97a58593          	addi	a1,a1,-1670 # 80029514 <d.549>
80005ba2:	854a                	mv	a0,s2
80005ba4:	80cfb0ef          	jal	80000bb0 <memmove>
      return 1;
80005ba8:	4505                	li	a0,1
80005baa:	d9cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005bae:	40000613          	li	a2,1024
80005bb2:	00024597          	auipc	a1,0x24
80005bb6:	d6258593          	addi	a1,a1,-670 # 80029914 <d.548>
80005bba:	854a                	mv	a0,s2
80005bbc:	ff5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005bc0:	4505                	li	a0,1
80005bc2:	d84ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005bc6:	40000613          	li	a2,1024
80005bca:	00024597          	auipc	a1,0x24
80005bce:	14a58593          	addi	a1,a1,330 # 80029d14 <d.547>
80005bd2:	854a                	mv	a0,s2
80005bd4:	fddfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005bd8:	4505                	li	a0,1
80005bda:	d6cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005bde:	40000613          	li	a2,1024
80005be2:	00024597          	auipc	a1,0x24
80005be6:	53258593          	addi	a1,a1,1330 # 8002a114 <d.546>
80005bea:	854a                	mv	a0,s2
80005bec:	fc5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005bf0:	4505                	li	a0,1
80005bf2:	d54ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005bf6:	40000613          	li	a2,1024
80005bfa:	00025597          	auipc	a1,0x25
80005bfe:	91a58593          	addi	a1,a1,-1766 # 8002a514 <d.545>
80005c02:	854a                	mv	a0,s2
80005c04:	fadfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c08:	4505                	li	a0,1
80005c0a:	d3cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c0e:	40000613          	li	a2,1024
80005c12:	00025597          	auipc	a1,0x25
80005c16:	d0258593          	addi	a1,a1,-766 # 8002a914 <d.544>
80005c1a:	854a                	mv	a0,s2
80005c1c:	f95fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c20:	4505                	li	a0,1
80005c22:	d24ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c26:	40000613          	li	a2,1024
80005c2a:	00025597          	auipc	a1,0x25
80005c2e:	0ea58593          	addi	a1,a1,234 # 8002ad14 <d.543>
80005c32:	854a                	mv	a0,s2
80005c34:	f7dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c38:	4505                	li	a0,1
80005c3a:	d0cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c3e:	40000613          	li	a2,1024
80005c42:	00025597          	auipc	a1,0x25
80005c46:	4d258593          	addi	a1,a1,1234 # 8002b114 <d.542>
80005c4a:	854a                	mv	a0,s2
80005c4c:	f65fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c50:	4505                	li	a0,1
80005c52:	cf4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c56:	40000613          	li	a2,1024
80005c5a:	00026597          	auipc	a1,0x26
80005c5e:	8ba58593          	addi	a1,a1,-1862 # 8002b514 <d.541>
80005c62:	854a                	mv	a0,s2
80005c64:	f4dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c68:	4505                	li	a0,1
80005c6a:	cdcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c6e:	40000613          	li	a2,1024
80005c72:	00026597          	auipc	a1,0x26
80005c76:	ca258593          	addi	a1,a1,-862 # 8002b914 <d.540>
80005c7a:	854a                	mv	a0,s2
80005c7c:	f35fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c80:	4505                	li	a0,1
80005c82:	cc4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c86:	40000613          	li	a2,1024
80005c8a:	00026597          	auipc	a1,0x26
80005c8e:	08a58593          	addi	a1,a1,138 # 8002bd14 <d.539>
80005c92:	854a                	mv	a0,s2
80005c94:	f1dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005c98:	4505                	li	a0,1
80005c9a:	cacff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005c9e:	40000613          	li	a2,1024
80005ca2:	00026597          	auipc	a1,0x26
80005ca6:	47258593          	addi	a1,a1,1138 # 8002c114 <d.538>
80005caa:	854a                	mv	a0,s2
80005cac:	f05fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005cb0:	4505                	li	a0,1
80005cb2:	c94ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005cb6:	40000613          	li	a2,1024
80005cba:	00027597          	auipc	a1,0x27
80005cbe:	85a58593          	addi	a1,a1,-1958 # 8002c514 <d.537>
80005cc2:	854a                	mv	a0,s2
80005cc4:	eedfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005cc8:	4505                	li	a0,1
80005cca:	c7cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005cce:	40000613          	li	a2,1024
80005cd2:	00027597          	auipc	a1,0x27
80005cd6:	c4258593          	addi	a1,a1,-958 # 8002c914 <d.536>
80005cda:	854a                	mv	a0,s2
80005cdc:	ed5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005ce0:	4505                	li	a0,1
80005ce2:	c64ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005ce6:	40000613          	li	a2,1024
80005cea:	00027597          	auipc	a1,0x27
80005cee:	02a58593          	addi	a1,a1,42 # 8002cd14 <d.535>
80005cf2:	854a                	mv	a0,s2
80005cf4:	ebdfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005cf8:	4505                	li	a0,1
80005cfa:	c4cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005cfe:	40000613          	li	a2,1024
80005d02:	00027597          	auipc	a1,0x27
80005d06:	41258593          	addi	a1,a1,1042 # 8002d114 <d.534>
80005d0a:	854a                	mv	a0,s2
80005d0c:	ea5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005d10:	4505                	li	a0,1
80005d12:	c34ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005d16:	40000613          	li	a2,1024
80005d1a:	00027597          	auipc	a1,0x27
80005d1e:	7fa58593          	addi	a1,a1,2042 # 8002d514 <d.533>
80005d22:	854a                	mv	a0,s2
80005d24:	e8dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005d28:	4505                	li	a0,1
80005d2a:	c1cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005d2e:	40000613          	li	a2,1024
80005d32:	00028597          	auipc	a1,0x28
80005d36:	be258593          	addi	a1,a1,-1054 # 8002d914 <d.532>
80005d3a:	854a                	mv	a0,s2
80005d3c:	e75fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005d40:	4505                	li	a0,1
80005d42:	c04ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005d46:	40000613          	li	a2,1024
80005d4a:	00028597          	auipc	a1,0x28
80005d4e:	fca58593          	addi	a1,a1,-54 # 8002dd14 <d.531>
80005d52:	854a                	mv	a0,s2
80005d54:	e5dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005d58:	4505                	li	a0,1
80005d5a:	becff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005d5e:	40000613          	li	a2,1024
80005d62:	00028597          	auipc	a1,0x28
80005d66:	3b258593          	addi	a1,a1,946 # 8002e114 <d.530>
80005d6a:	854a                	mv	a0,s2
80005d6c:	e45fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005d70:	4505                	li	a0,1
80005d72:	bd4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005d76:	40000613          	li	a2,1024
80005d7a:	00028597          	auipc	a1,0x28
80005d7e:	79a58593          	addi	a1,a1,1946 # 8002e514 <d.529>
80005d82:	854a                	mv	a0,s2
80005d84:	e2dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005d88:	4505                	li	a0,1
80005d8a:	bbcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005d8e:	40000613          	li	a2,1024
80005d92:	00029597          	auipc	a1,0x29
80005d96:	b8258593          	addi	a1,a1,-1150 # 8002e914 <d.528>
80005d9a:	854a                	mv	a0,s2
80005d9c:	e15fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005da0:	4505                	li	a0,1
80005da2:	ba4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005da6:	40000613          	li	a2,1024
80005daa:	00029597          	auipc	a1,0x29
80005dae:	f6a58593          	addi	a1,a1,-150 # 8002ed14 <d.527>
80005db2:	854a                	mv	a0,s2
80005db4:	dfdfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005db8:	4505                	li	a0,1
80005dba:	b8cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005dbe:	40000613          	li	a2,1024
80005dc2:	00029597          	auipc	a1,0x29
80005dc6:	35258593          	addi	a1,a1,850 # 8002f114 <d.526>
80005dca:	854a                	mv	a0,s2
80005dcc:	de5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005dd0:	4505                	li	a0,1
80005dd2:	b74ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005dd6:	40000613          	li	a2,1024
80005dda:	00029597          	auipc	a1,0x29
80005dde:	73a58593          	addi	a1,a1,1850 # 8002f514 <d.525>
80005de2:	854a                	mv	a0,s2
80005de4:	dcdfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005de8:	4505                	li	a0,1
80005dea:	b5cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005dee:	40000613          	li	a2,1024
80005df2:	0002a597          	auipc	a1,0x2a
80005df6:	b2258593          	addi	a1,a1,-1246 # 8002f914 <d.524>
80005dfa:	854a                	mv	a0,s2
80005dfc:	db5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e00:	4505                	li	a0,1
80005e02:	b44ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e06:	40000613          	li	a2,1024
80005e0a:	0002a597          	auipc	a1,0x2a
80005e0e:	f0a58593          	addi	a1,a1,-246 # 8002fd14 <d.523>
80005e12:	854a                	mv	a0,s2
80005e14:	d9dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e18:	4505                	li	a0,1
80005e1a:	b2cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e1e:	40000613          	li	a2,1024
80005e22:	0002a597          	auipc	a1,0x2a
80005e26:	2f258593          	addi	a1,a1,754 # 80030114 <d.522>
80005e2a:	854a                	mv	a0,s2
80005e2c:	d85fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e30:	4505                	li	a0,1
80005e32:	b14ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e36:	40000613          	li	a2,1024
80005e3a:	0002a597          	auipc	a1,0x2a
80005e3e:	6da58593          	addi	a1,a1,1754 # 80030514 <d.521>
80005e42:	854a                	mv	a0,s2
80005e44:	d6dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e48:	4505                	li	a0,1
80005e4a:	afcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e4e:	40000613          	li	a2,1024
80005e52:	0002b597          	auipc	a1,0x2b
80005e56:	ac258593          	addi	a1,a1,-1342 # 80030914 <d.520>
80005e5a:	854a                	mv	a0,s2
80005e5c:	d55fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e60:	4505                	li	a0,1
80005e62:	ae4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e66:	40000613          	li	a2,1024
80005e6a:	0002b597          	auipc	a1,0x2b
80005e6e:	eaa58593          	addi	a1,a1,-342 # 80030d14 <d.519>
80005e72:	854a                	mv	a0,s2
80005e74:	d3dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e78:	4505                	li	a0,1
80005e7a:	accff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e7e:	40000613          	li	a2,1024
80005e82:	0002b597          	auipc	a1,0x2b
80005e86:	29258593          	addi	a1,a1,658 # 80031114 <d.518>
80005e8a:	854a                	mv	a0,s2
80005e8c:	d25fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005e90:	4505                	li	a0,1
80005e92:	ab4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005e96:	40000613          	li	a2,1024
80005e9a:	0002b597          	auipc	a1,0x2b
80005e9e:	67a58593          	addi	a1,a1,1658 # 80031514 <d.517>
80005ea2:	854a                	mv	a0,s2
80005ea4:	d0dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005ea8:	4505                	li	a0,1
80005eaa:	a9cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005eae:	40000613          	li	a2,1024
80005eb2:	0002c597          	auipc	a1,0x2c
80005eb6:	a6258593          	addi	a1,a1,-1438 # 80031914 <d.516>
80005eba:	854a                	mv	a0,s2
80005ebc:	cf5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005ec0:	4505                	li	a0,1
80005ec2:	a84ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005ec6:	40000613          	li	a2,1024
80005eca:	0002c597          	auipc	a1,0x2c
80005ece:	e4a58593          	addi	a1,a1,-438 # 80031d14 <d.515>
80005ed2:	854a                	mv	a0,s2
80005ed4:	cddfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005ed8:	4505                	li	a0,1
80005eda:	a6cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005ede:	40000613          	li	a2,1024
80005ee2:	0002c597          	auipc	a1,0x2c
80005ee6:	23258593          	addi	a1,a1,562 # 80032114 <d.514>
80005eea:	854a                	mv	a0,s2
80005eec:	cc5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005ef0:	4505                	li	a0,1
80005ef2:	a54ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005ef6:	40000613          	li	a2,1024
80005efa:	0002c597          	auipc	a1,0x2c
80005efe:	61a58593          	addi	a1,a1,1562 # 80032514 <d.513>
80005f02:	854a                	mv	a0,s2
80005f04:	cadfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f08:	4505                	li	a0,1
80005f0a:	a3cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f0e:	40000613          	li	a2,1024
80005f12:	0002d597          	auipc	a1,0x2d
80005f16:	a0258593          	addi	a1,a1,-1534 # 80032914 <d.512>
80005f1a:	854a                	mv	a0,s2
80005f1c:	c95fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f20:	4505                	li	a0,1
80005f22:	a24ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f26:	40000613          	li	a2,1024
80005f2a:	0002d597          	auipc	a1,0x2d
80005f2e:	dea58593          	addi	a1,a1,-534 # 80032d14 <d.511>
80005f32:	854a                	mv	a0,s2
80005f34:	c7dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f38:	4505                	li	a0,1
80005f3a:	a0cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f3e:	40000613          	li	a2,1024
80005f42:	0002d597          	auipc	a1,0x2d
80005f46:	1d258593          	addi	a1,a1,466 # 80033114 <d.510>
80005f4a:	854a                	mv	a0,s2
80005f4c:	c65fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f50:	4505                	li	a0,1
80005f52:	9f4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f56:	40000613          	li	a2,1024
80005f5a:	0002d597          	auipc	a1,0x2d
80005f5e:	5ba58593          	addi	a1,a1,1466 # 80033514 <d.509>
80005f62:	854a                	mv	a0,s2
80005f64:	c4dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f68:	4505                	li	a0,1
80005f6a:	9dcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f6e:	40000613          	li	a2,1024
80005f72:	0002e597          	auipc	a1,0x2e
80005f76:	9a258593          	addi	a1,a1,-1630 # 80033914 <d.508>
80005f7a:	854a                	mv	a0,s2
80005f7c:	c35fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f80:	4505                	li	a0,1
80005f82:	9c4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f86:	40000613          	li	a2,1024
80005f8a:	0002e597          	auipc	a1,0x2e
80005f8e:	d8a58593          	addi	a1,a1,-630 # 80033d14 <d.507>
80005f92:	854a                	mv	a0,s2
80005f94:	c1dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005f98:	4505                	li	a0,1
80005f9a:	9acff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005f9e:	40000613          	li	a2,1024
80005fa2:	0002e597          	auipc	a1,0x2e
80005fa6:	17258593          	addi	a1,a1,370 # 80034114 <d.506>
80005faa:	854a                	mv	a0,s2
80005fac:	c05fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005fb0:	4505                	li	a0,1
80005fb2:	994ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005fb6:	40000613          	li	a2,1024
80005fba:	0002e597          	auipc	a1,0x2e
80005fbe:	55a58593          	addi	a1,a1,1370 # 80034514 <d.505>
80005fc2:	854a                	mv	a0,s2
80005fc4:	bedfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005fc8:	4505                	li	a0,1
80005fca:	97cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005fce:	40000613          	li	a2,1024
80005fd2:	0002f597          	auipc	a1,0x2f
80005fd6:	94258593          	addi	a1,a1,-1726 # 80034914 <d.504>
80005fda:	854a                	mv	a0,s2
80005fdc:	bd5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80005fe0:	4505                	li	a0,1
80005fe2:	964ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005fe6:	40000613          	li	a2,1024
80005fea:	0002f597          	auipc	a1,0x2f
80005fee:	d2a58593          	addi	a1,a1,-726 # 80034d14 <d.503>
80005ff2:	854a                	mv	a0,s2
80005ff4:	bbdfa0ef          	jal	80000bb0 <memmove>
      return 1;
80005ff8:	4505                	li	a0,1
80005ffa:	94cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80005ffe:	40000613          	li	a2,1024
80006002:	0002f597          	auipc	a1,0x2f
80006006:	11258593          	addi	a1,a1,274 # 80035114 <d.502>
8000600a:	854a                	mv	a0,s2
8000600c:	ba5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006010:	4505                	li	a0,1
80006012:	934ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006016:	40000613          	li	a2,1024
8000601a:	0002f597          	auipc	a1,0x2f
8000601e:	4fa58593          	addi	a1,a1,1274 # 80035514 <d.501>
80006022:	854a                	mv	a0,s2
80006024:	b8dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006028:	4505                	li	a0,1
8000602a:	91cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000602e:	40000613          	li	a2,1024
80006032:	00030597          	auipc	a1,0x30
80006036:	8e258593          	addi	a1,a1,-1822 # 80035914 <d.500>
8000603a:	854a                	mv	a0,s2
8000603c:	b75fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006040:	4505                	li	a0,1
80006042:	904ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006046:	40000613          	li	a2,1024
8000604a:	00030597          	auipc	a1,0x30
8000604e:	cca58593          	addi	a1,a1,-822 # 80035d14 <d.499>
80006052:	854a                	mv	a0,s2
80006054:	b5dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006058:	4505                	li	a0,1
8000605a:	8ecff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000605e:	40000613          	li	a2,1024
80006062:	00030597          	auipc	a1,0x30
80006066:	0b258593          	addi	a1,a1,178 # 80036114 <d.498>
8000606a:	854a                	mv	a0,s2
8000606c:	b45fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006070:	4505                	li	a0,1
80006072:	8d4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006076:	40000613          	li	a2,1024
8000607a:	00030597          	auipc	a1,0x30
8000607e:	49a58593          	addi	a1,a1,1178 # 80036514 <d.497>
80006082:	854a                	mv	a0,s2
80006084:	b2dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006088:	4505                	li	a0,1
8000608a:	8bcff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000608e:	40000613          	li	a2,1024
80006092:	00031597          	auipc	a1,0x31
80006096:	88258593          	addi	a1,a1,-1918 # 80036914 <d.496>
8000609a:	854a                	mv	a0,s2
8000609c:	b15fa0ef          	jal	80000bb0 <memmove>
      return 1;
800060a0:	4505                	li	a0,1
800060a2:	8a4ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800060a6:	40000613          	li	a2,1024
800060aa:	00031597          	auipc	a1,0x31
800060ae:	c6a58593          	addi	a1,a1,-918 # 80036d14 <d.495>
800060b2:	854a                	mv	a0,s2
800060b4:	afdfa0ef          	jal	80000bb0 <memmove>
      return 1;
800060b8:	4505                	li	a0,1
800060ba:	88cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800060be:	40000613          	li	a2,1024
800060c2:	00031597          	auipc	a1,0x31
800060c6:	05258593          	addi	a1,a1,82 # 80037114 <d.494>
800060ca:	854a                	mv	a0,s2
800060cc:	ae5fa0ef          	jal	80000bb0 <memmove>
      return 1;
800060d0:	4505                	li	a0,1
800060d2:	874ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800060d6:	40000613          	li	a2,1024
800060da:	00031597          	auipc	a1,0x31
800060de:	43a58593          	addi	a1,a1,1082 # 80037514 <d.493>
800060e2:	854a                	mv	a0,s2
800060e4:	acdfa0ef          	jal	80000bb0 <memmove>
      return 1;
800060e8:	4505                	li	a0,1
800060ea:	85cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800060ee:	40000613          	li	a2,1024
800060f2:	00032597          	auipc	a1,0x32
800060f6:	82258593          	addi	a1,a1,-2014 # 80037914 <d.492>
800060fa:	854a                	mv	a0,s2
800060fc:	ab5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006100:	4505                	li	a0,1
80006102:	844ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006106:	40000613          	li	a2,1024
8000610a:	00032597          	auipc	a1,0x32
8000610e:	c0a58593          	addi	a1,a1,-1014 # 80037d14 <d.491>
80006112:	854a                	mv	a0,s2
80006114:	a9dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006118:	4505                	li	a0,1
8000611a:	82cff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000611e:	40000613          	li	a2,1024
80006122:	00032597          	auipc	a1,0x32
80006126:	ff258593          	addi	a1,a1,-14 # 80038114 <d.490>
8000612a:	854a                	mv	a0,s2
8000612c:	a85fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006130:	4505                	li	a0,1
80006132:	814ff06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006136:	40000613          	li	a2,1024
8000613a:	00032597          	auipc	a1,0x32
8000613e:	3da58593          	addi	a1,a1,986 # 80038514 <d.489>
80006142:	854a                	mv	a0,s2
80006144:	a6dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006148:	4505                	li	a0,1
8000614a:	ffdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000614e:	40000613          	li	a2,1024
80006152:	00032597          	auipc	a1,0x32
80006156:	7c258593          	addi	a1,a1,1986 # 80038914 <d.488>
8000615a:	854a                	mv	a0,s2
8000615c:	a55fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006160:	4505                	li	a0,1
80006162:	fe5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006166:	40000613          	li	a2,1024
8000616a:	00033597          	auipc	a1,0x33
8000616e:	baa58593          	addi	a1,a1,-1110 # 80038d14 <d.487>
80006172:	854a                	mv	a0,s2
80006174:	a3dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006178:	4505                	li	a0,1
8000617a:	fcdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000617e:	40000613          	li	a2,1024
80006182:	00033597          	auipc	a1,0x33
80006186:	f9258593          	addi	a1,a1,-110 # 80039114 <d.486>
8000618a:	854a                	mv	a0,s2
8000618c:	a25fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006190:	4505                	li	a0,1
80006192:	fb5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006196:	40000613          	li	a2,1024
8000619a:	00033597          	auipc	a1,0x33
8000619e:	37a58593          	addi	a1,a1,890 # 80039514 <d.485>
800061a2:	854a                	mv	a0,s2
800061a4:	a0dfa0ef          	jal	80000bb0 <memmove>
      return 1;
800061a8:	4505                	li	a0,1
800061aa:	f9dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800061ae:	40000613          	li	a2,1024
800061b2:	00033597          	auipc	a1,0x33
800061b6:	76258593          	addi	a1,a1,1890 # 80039914 <d.484>
800061ba:	854a                	mv	a0,s2
800061bc:	9f5fa0ef          	jal	80000bb0 <memmove>
      return 1;
800061c0:	4505                	li	a0,1
800061c2:	f85fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800061c6:	40000613          	li	a2,1024
800061ca:	00034597          	auipc	a1,0x34
800061ce:	b4a58593          	addi	a1,a1,-1206 # 80039d14 <d.483>
800061d2:	854a                	mv	a0,s2
800061d4:	9ddfa0ef          	jal	80000bb0 <memmove>
      return 1;
800061d8:	4505                	li	a0,1
800061da:	f6dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800061de:	40000613          	li	a2,1024
800061e2:	00034597          	auipc	a1,0x34
800061e6:	f3258593          	addi	a1,a1,-206 # 8003a114 <d.482>
800061ea:	854a                	mv	a0,s2
800061ec:	9c5fa0ef          	jal	80000bb0 <memmove>
      return 1;
800061f0:	4505                	li	a0,1
800061f2:	f55fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800061f6:	40000613          	li	a2,1024
800061fa:	00034597          	auipc	a1,0x34
800061fe:	31a58593          	addi	a1,a1,794 # 8003a514 <d.481>
80006202:	854a                	mv	a0,s2
80006204:	9adfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006208:	4505                	li	a0,1
8000620a:	f3dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000620e:	40000613          	li	a2,1024
80006212:	00034597          	auipc	a1,0x34
80006216:	70258593          	addi	a1,a1,1794 # 8003a914 <d.480>
8000621a:	854a                	mv	a0,s2
8000621c:	995fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006220:	4505                	li	a0,1
80006222:	f25fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006226:	40000613          	li	a2,1024
8000622a:	00035597          	auipc	a1,0x35
8000622e:	aea58593          	addi	a1,a1,-1302 # 8003ad14 <d.479>
80006232:	854a                	mv	a0,s2
80006234:	97dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006238:	4505                	li	a0,1
8000623a:	f0dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000623e:	40000613          	li	a2,1024
80006242:	00035597          	auipc	a1,0x35
80006246:	ed258593          	addi	a1,a1,-302 # 8003b114 <d.478>
8000624a:	854a                	mv	a0,s2
8000624c:	965fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006250:	4505                	li	a0,1
80006252:	ef5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006256:	40000613          	li	a2,1024
8000625a:	00035597          	auipc	a1,0x35
8000625e:	2ba58593          	addi	a1,a1,698 # 8003b514 <d.477>
80006262:	854a                	mv	a0,s2
80006264:	94dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006268:	4505                	li	a0,1
8000626a:	eddfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000626e:	40000613          	li	a2,1024
80006272:	00035597          	auipc	a1,0x35
80006276:	6a258593          	addi	a1,a1,1698 # 8003b914 <d.476>
8000627a:	854a                	mv	a0,s2
8000627c:	935fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006280:	4505                	li	a0,1
80006282:	ec5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006286:	40000613          	li	a2,1024
8000628a:	00036597          	auipc	a1,0x36
8000628e:	a8a58593          	addi	a1,a1,-1398 # 8003bd14 <d.475>
80006292:	854a                	mv	a0,s2
80006294:	91dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006298:	4505                	li	a0,1
8000629a:	eadfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000629e:	40000613          	li	a2,1024
800062a2:	00036597          	auipc	a1,0x36
800062a6:	e7258593          	addi	a1,a1,-398 # 8003c114 <d.474>
800062aa:	854a                	mv	a0,s2
800062ac:	905fa0ef          	jal	80000bb0 <memmove>
      return 1;
800062b0:	4505                	li	a0,1
800062b2:	e95fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800062b6:	40000613          	li	a2,1024
800062ba:	00036597          	auipc	a1,0x36
800062be:	25a58593          	addi	a1,a1,602 # 8003c514 <d.473>
800062c2:	854a                	mv	a0,s2
800062c4:	8edfa0ef          	jal	80000bb0 <memmove>
      return 1;
800062c8:	4505                	li	a0,1
800062ca:	e7dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800062ce:	40000613          	li	a2,1024
800062d2:	00036597          	auipc	a1,0x36
800062d6:	64258593          	addi	a1,a1,1602 # 8003c914 <d.472>
800062da:	854a                	mv	a0,s2
800062dc:	8d5fa0ef          	jal	80000bb0 <memmove>
      return 1;
800062e0:	4505                	li	a0,1
800062e2:	e65fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800062e6:	40000613          	li	a2,1024
800062ea:	00037597          	auipc	a1,0x37
800062ee:	a2a58593          	addi	a1,a1,-1494 # 8003cd14 <d.471>
800062f2:	854a                	mv	a0,s2
800062f4:	8bdfa0ef          	jal	80000bb0 <memmove>
      return 1;
800062f8:	4505                	li	a0,1
800062fa:	e4dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800062fe:	40000613          	li	a2,1024
80006302:	00037597          	auipc	a1,0x37
80006306:	e1258593          	addi	a1,a1,-494 # 8003d114 <d.470>
8000630a:	854a                	mv	a0,s2
8000630c:	8a5fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006310:	4505                	li	a0,1
80006312:	e35fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006316:	40000613          	li	a2,1024
8000631a:	00037597          	auipc	a1,0x37
8000631e:	1fa58593          	addi	a1,a1,506 # 8003d514 <d.469>
80006322:	854a                	mv	a0,s2
80006324:	88dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006328:	4505                	li	a0,1
8000632a:	e1dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000632e:	40000613          	li	a2,1024
80006332:	00037597          	auipc	a1,0x37
80006336:	5e258593          	addi	a1,a1,1506 # 8003d914 <d.468>
8000633a:	854a                	mv	a0,s2
8000633c:	875fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006340:	4505                	li	a0,1
80006342:	e05fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006346:	40000613          	li	a2,1024
8000634a:	00038597          	auipc	a1,0x38
8000634e:	9ca58593          	addi	a1,a1,-1590 # 8003dd14 <d.467>
80006352:	854a                	mv	a0,s2
80006354:	85dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006358:	4505                	li	a0,1
8000635a:	dedfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000635e:	40000613          	li	a2,1024
80006362:	00038597          	auipc	a1,0x38
80006366:	db258593          	addi	a1,a1,-590 # 8003e114 <d.466>
8000636a:	854a                	mv	a0,s2
8000636c:	845fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006370:	4505                	li	a0,1
80006372:	dd5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006376:	40000613          	li	a2,1024
8000637a:	00038597          	auipc	a1,0x38
8000637e:	19a58593          	addi	a1,a1,410 # 8003e514 <d.465>
80006382:	854a                	mv	a0,s2
80006384:	82dfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006388:	4505                	li	a0,1
8000638a:	dbdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000638e:	40000613          	li	a2,1024
80006392:	00038597          	auipc	a1,0x38
80006396:	58258593          	addi	a1,a1,1410 # 8003e914 <d.464>
8000639a:	854a                	mv	a0,s2
8000639c:	815fa0ef          	jal	80000bb0 <memmove>
      return 1;
800063a0:	4505                	li	a0,1
800063a2:	da5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800063a6:	40000613          	li	a2,1024
800063aa:	00039597          	auipc	a1,0x39
800063ae:	96a58593          	addi	a1,a1,-1686 # 8003ed14 <d.463>
800063b2:	854a                	mv	a0,s2
800063b4:	ffcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800063b8:	4505                	li	a0,1
800063ba:	d8dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800063be:	40000613          	li	a2,1024
800063c2:	00039597          	auipc	a1,0x39
800063c6:	d5258593          	addi	a1,a1,-686 # 8003f114 <d.462>
800063ca:	854a                	mv	a0,s2
800063cc:	fe4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800063d0:	4505                	li	a0,1
800063d2:	d75fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800063d6:	40000613          	li	a2,1024
800063da:	00039597          	auipc	a1,0x39
800063de:	13a58593          	addi	a1,a1,314 # 8003f514 <d.461>
800063e2:	854a                	mv	a0,s2
800063e4:	fccfa0ef          	jal	80000bb0 <memmove>
      return 1;
800063e8:	4505                	li	a0,1
800063ea:	d5dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800063ee:	40000613          	li	a2,1024
800063f2:	00039597          	auipc	a1,0x39
800063f6:	52258593          	addi	a1,a1,1314 # 8003f914 <d.460>
800063fa:	854a                	mv	a0,s2
800063fc:	fb4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006400:	4505                	li	a0,1
80006402:	d45fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006406:	40000613          	li	a2,1024
8000640a:	0003a597          	auipc	a1,0x3a
8000640e:	90a58593          	addi	a1,a1,-1782 # 8003fd14 <d.459>
80006412:	854a                	mv	a0,s2
80006414:	f9cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006418:	4505                	li	a0,1
8000641a:	d2dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000641e:	40000613          	li	a2,1024
80006422:	0003a597          	auipc	a1,0x3a
80006426:	cf258593          	addi	a1,a1,-782 # 80040114 <d.458>
8000642a:	854a                	mv	a0,s2
8000642c:	f84fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006430:	4505                	li	a0,1
80006432:	d15fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006436:	40000613          	li	a2,1024
8000643a:	0003a597          	auipc	a1,0x3a
8000643e:	0da58593          	addi	a1,a1,218 # 80040514 <d.457>
80006442:	854a                	mv	a0,s2
80006444:	f6cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006448:	4505                	li	a0,1
8000644a:	cfdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000644e:	40000613          	li	a2,1024
80006452:	0003a597          	auipc	a1,0x3a
80006456:	4c258593          	addi	a1,a1,1218 # 80040914 <d.456>
8000645a:	854a                	mv	a0,s2
8000645c:	f54fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006460:	4505                	li	a0,1
80006462:	ce5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006466:	40000613          	li	a2,1024
8000646a:	0003b597          	auipc	a1,0x3b
8000646e:	8aa58593          	addi	a1,a1,-1878 # 80040d14 <d.455>
80006472:	854a                	mv	a0,s2
80006474:	f3cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006478:	4505                	li	a0,1
8000647a:	ccdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000647e:	40000613          	li	a2,1024
80006482:	0003b597          	auipc	a1,0x3b
80006486:	c9258593          	addi	a1,a1,-878 # 80041114 <d.454>
8000648a:	854a                	mv	a0,s2
8000648c:	f24fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006490:	4505                	li	a0,1
80006492:	cb5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006496:	40000613          	li	a2,1024
8000649a:	0003b597          	auipc	a1,0x3b
8000649e:	07a58593          	addi	a1,a1,122 # 80041514 <d.453>
800064a2:	854a                	mv	a0,s2
800064a4:	f0cfa0ef          	jal	80000bb0 <memmove>
      return 1;
800064a8:	4505                	li	a0,1
800064aa:	c9dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800064ae:	40000613          	li	a2,1024
800064b2:	0003b597          	auipc	a1,0x3b
800064b6:	46258593          	addi	a1,a1,1122 # 80041914 <d.452>
800064ba:	854a                	mv	a0,s2
800064bc:	ef4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800064c0:	4505                	li	a0,1
800064c2:	c85fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800064c6:	40000613          	li	a2,1024
800064ca:	0003c597          	auipc	a1,0x3c
800064ce:	84a58593          	addi	a1,a1,-1974 # 80041d14 <d.451>
800064d2:	854a                	mv	a0,s2
800064d4:	edcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800064d8:	4505                	li	a0,1
800064da:	c6dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800064de:	40000613          	li	a2,1024
800064e2:	0003c597          	auipc	a1,0x3c
800064e6:	c3258593          	addi	a1,a1,-974 # 80042114 <d.450>
800064ea:	854a                	mv	a0,s2
800064ec:	ec4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800064f0:	4505                	li	a0,1
800064f2:	c55fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800064f6:	40000613          	li	a2,1024
800064fa:	0003c597          	auipc	a1,0x3c
800064fe:	01a58593          	addi	a1,a1,26 # 80042514 <d.449>
80006502:	854a                	mv	a0,s2
80006504:	eacfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006508:	4505                	li	a0,1
8000650a:	c3dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000650e:	40000613          	li	a2,1024
80006512:	0003c597          	auipc	a1,0x3c
80006516:	40258593          	addi	a1,a1,1026 # 80042914 <d.448>
8000651a:	854a                	mv	a0,s2
8000651c:	e94fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006520:	4505                	li	a0,1
80006522:	c25fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006526:	40000613          	li	a2,1024
8000652a:	0003c597          	auipc	a1,0x3c
8000652e:	7ea58593          	addi	a1,a1,2026 # 80042d14 <d.447>
80006532:	854a                	mv	a0,s2
80006534:	e7cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006538:	4505                	li	a0,1
8000653a:	c0dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000653e:	40000613          	li	a2,1024
80006542:	0003d597          	auipc	a1,0x3d
80006546:	bd258593          	addi	a1,a1,-1070 # 80043114 <d.446>
8000654a:	854a                	mv	a0,s2
8000654c:	e64fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006550:	4505                	li	a0,1
80006552:	bf5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006556:	40000613          	li	a2,1024
8000655a:	0003d597          	auipc	a1,0x3d
8000655e:	fba58593          	addi	a1,a1,-70 # 80043514 <d.445>
80006562:	854a                	mv	a0,s2
80006564:	e4cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006568:	4505                	li	a0,1
8000656a:	bddfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000656e:	40000613          	li	a2,1024
80006572:	0003d597          	auipc	a1,0x3d
80006576:	3a258593          	addi	a1,a1,930 # 80043914 <d.444>
8000657a:	854a                	mv	a0,s2
8000657c:	e34fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006580:	4505                	li	a0,1
80006582:	bc5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006586:	40000613          	li	a2,1024
8000658a:	0003d597          	auipc	a1,0x3d
8000658e:	78a58593          	addi	a1,a1,1930 # 80043d14 <d.443>
80006592:	854a                	mv	a0,s2
80006594:	e1cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006598:	4505                	li	a0,1
8000659a:	badfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000659e:	40000613          	li	a2,1024
800065a2:	0003e597          	auipc	a1,0x3e
800065a6:	b7258593          	addi	a1,a1,-1166 # 80044114 <d.442>
800065aa:	854a                	mv	a0,s2
800065ac:	e04fa0ef          	jal	80000bb0 <memmove>
      return 1;
800065b0:	4505                	li	a0,1
800065b2:	b95fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800065b6:	40000613          	li	a2,1024
800065ba:	0003e597          	auipc	a1,0x3e
800065be:	f5a58593          	addi	a1,a1,-166 # 80044514 <d.441>
800065c2:	854a                	mv	a0,s2
800065c4:	decfa0ef          	jal	80000bb0 <memmove>
      return 1;
800065c8:	4505                	li	a0,1
800065ca:	b7dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800065ce:	40000613          	li	a2,1024
800065d2:	0003e597          	auipc	a1,0x3e
800065d6:	34258593          	addi	a1,a1,834 # 80044914 <d.440>
800065da:	854a                	mv	a0,s2
800065dc:	dd4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800065e0:	4505                	li	a0,1
800065e2:	b65fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800065e6:	40000613          	li	a2,1024
800065ea:	0003e597          	auipc	a1,0x3e
800065ee:	72a58593          	addi	a1,a1,1834 # 80044d14 <d.439>
800065f2:	854a                	mv	a0,s2
800065f4:	dbcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800065f8:	4505                	li	a0,1
800065fa:	b4dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800065fe:	40000613          	li	a2,1024
80006602:	0003f597          	auipc	a1,0x3f
80006606:	b1258593          	addi	a1,a1,-1262 # 80045114 <d.438>
8000660a:	854a                	mv	a0,s2
8000660c:	da4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006610:	4505                	li	a0,1
80006612:	b35fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006616:	40000613          	li	a2,1024
8000661a:	0003f597          	auipc	a1,0x3f
8000661e:	efa58593          	addi	a1,a1,-262 # 80045514 <d.437>
80006622:	854a                	mv	a0,s2
80006624:	d8cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006628:	4505                	li	a0,1
8000662a:	b1dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000662e:	40000613          	li	a2,1024
80006632:	0003f597          	auipc	a1,0x3f
80006636:	2e258593          	addi	a1,a1,738 # 80045914 <d.436>
8000663a:	854a                	mv	a0,s2
8000663c:	d74fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006640:	4505                	li	a0,1
80006642:	b05fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006646:	40000613          	li	a2,1024
8000664a:	0003f597          	auipc	a1,0x3f
8000664e:	6ca58593          	addi	a1,a1,1738 # 80045d14 <d.435>
80006652:	854a                	mv	a0,s2
80006654:	d5cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006658:	4505                	li	a0,1
8000665a:	aedfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000665e:	40000613          	li	a2,1024
80006662:	00040597          	auipc	a1,0x40
80006666:	ab258593          	addi	a1,a1,-1358 # 80046114 <d.434>
8000666a:	854a                	mv	a0,s2
8000666c:	d44fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006670:	4505                	li	a0,1
80006672:	ad5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006676:	40000613          	li	a2,1024
8000667a:	00040597          	auipc	a1,0x40
8000667e:	e9a58593          	addi	a1,a1,-358 # 80046514 <d.433>
80006682:	854a                	mv	a0,s2
80006684:	d2cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006688:	4505                	li	a0,1
8000668a:	abdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000668e:	40000613          	li	a2,1024
80006692:	00040597          	auipc	a1,0x40
80006696:	28258593          	addi	a1,a1,642 # 80046914 <d.432>
8000669a:	854a                	mv	a0,s2
8000669c:	d14fa0ef          	jal	80000bb0 <memmove>
      return 1;
800066a0:	4505                	li	a0,1
800066a2:	aa5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800066a6:	40000613          	li	a2,1024
800066aa:	00040597          	auipc	a1,0x40
800066ae:	66a58593          	addi	a1,a1,1642 # 80046d14 <d.431>
800066b2:	854a                	mv	a0,s2
800066b4:	cfcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800066b8:	4505                	li	a0,1
800066ba:	a8dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800066be:	40000613          	li	a2,1024
800066c2:	00041597          	auipc	a1,0x41
800066c6:	a5258593          	addi	a1,a1,-1454 # 80047114 <d.430>
800066ca:	854a                	mv	a0,s2
800066cc:	ce4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800066d0:	4505                	li	a0,1
800066d2:	a75fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800066d6:	40000613          	li	a2,1024
800066da:	00041597          	auipc	a1,0x41
800066de:	e3a58593          	addi	a1,a1,-454 # 80047514 <d.429>
800066e2:	854a                	mv	a0,s2
800066e4:	cccfa0ef          	jal	80000bb0 <memmove>
      return 1;
800066e8:	4505                	li	a0,1
800066ea:	a5dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800066ee:	40000613          	li	a2,1024
800066f2:	00041597          	auipc	a1,0x41
800066f6:	22258593          	addi	a1,a1,546 # 80047914 <d.428>
800066fa:	854a                	mv	a0,s2
800066fc:	cb4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006700:	4505                	li	a0,1
80006702:	a45fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006706:	40000613          	li	a2,1024
8000670a:	00041597          	auipc	a1,0x41
8000670e:	60a58593          	addi	a1,a1,1546 # 80047d14 <d.427>
80006712:	854a                	mv	a0,s2
80006714:	c9cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006718:	4505                	li	a0,1
8000671a:	a2dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000671e:	40000613          	li	a2,1024
80006722:	00042597          	auipc	a1,0x42
80006726:	9f258593          	addi	a1,a1,-1550 # 80048114 <d.426>
8000672a:	854a                	mv	a0,s2
8000672c:	c84fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006730:	4505                	li	a0,1
80006732:	a15fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006736:	40000613          	li	a2,1024
8000673a:	00042597          	auipc	a1,0x42
8000673e:	dda58593          	addi	a1,a1,-550 # 80048514 <d.425>
80006742:	854a                	mv	a0,s2
80006744:	c6cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006748:	4505                	li	a0,1
8000674a:	9fdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000674e:	40000613          	li	a2,1024
80006752:	00042597          	auipc	a1,0x42
80006756:	1c258593          	addi	a1,a1,450 # 80048914 <d.424>
8000675a:	854a                	mv	a0,s2
8000675c:	c54fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006760:	4505                	li	a0,1
80006762:	9e5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006766:	40000613          	li	a2,1024
8000676a:	00042597          	auipc	a1,0x42
8000676e:	5aa58593          	addi	a1,a1,1450 # 80048d14 <d.423>
80006772:	854a                	mv	a0,s2
80006774:	c3cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006778:	4505                	li	a0,1
8000677a:	9cdfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000677e:	40000613          	li	a2,1024
80006782:	00043597          	auipc	a1,0x43
80006786:	99258593          	addi	a1,a1,-1646 # 80049114 <d.422>
8000678a:	854a                	mv	a0,s2
8000678c:	c24fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006790:	4505                	li	a0,1
80006792:	9b5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006796:	40000613          	li	a2,1024
8000679a:	00043597          	auipc	a1,0x43
8000679e:	d7a58593          	addi	a1,a1,-646 # 80049514 <d.421>
800067a2:	854a                	mv	a0,s2
800067a4:	c0cfa0ef          	jal	80000bb0 <memmove>
      return 1;
800067a8:	4505                	li	a0,1
800067aa:	99dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800067ae:	40000613          	li	a2,1024
800067b2:	00043597          	auipc	a1,0x43
800067b6:	16258593          	addi	a1,a1,354 # 80049914 <d.420>
800067ba:	854a                	mv	a0,s2
800067bc:	bf4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800067c0:	4505                	li	a0,1
800067c2:	985fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800067c6:	40000613          	li	a2,1024
800067ca:	00043597          	auipc	a1,0x43
800067ce:	54a58593          	addi	a1,a1,1354 # 80049d14 <d.419>
800067d2:	854a                	mv	a0,s2
800067d4:	bdcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800067d8:	4505                	li	a0,1
800067da:	96dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800067de:	40000613          	li	a2,1024
800067e2:	00044597          	auipc	a1,0x44
800067e6:	93258593          	addi	a1,a1,-1742 # 8004a114 <d.418>
800067ea:	854a                	mv	a0,s2
800067ec:	bc4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800067f0:	4505                	li	a0,1
800067f2:	955fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800067f6:	40000613          	li	a2,1024
800067fa:	00044597          	auipc	a1,0x44
800067fe:	d1a58593          	addi	a1,a1,-742 # 8004a514 <d.417>
80006802:	854a                	mv	a0,s2
80006804:	bacfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006808:	4505                	li	a0,1
8000680a:	93dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000680e:	40000613          	li	a2,1024
80006812:	00044597          	auipc	a1,0x44
80006816:	10258593          	addi	a1,a1,258 # 8004a914 <d.416>
8000681a:	854a                	mv	a0,s2
8000681c:	b94fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006820:	4505                	li	a0,1
80006822:	925fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006826:	40000613          	li	a2,1024
8000682a:	00044597          	auipc	a1,0x44
8000682e:	4ea58593          	addi	a1,a1,1258 # 8004ad14 <d.415>
80006832:	854a                	mv	a0,s2
80006834:	b7cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006838:	4505                	li	a0,1
8000683a:	90dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000683e:	40000613          	li	a2,1024
80006842:	00045597          	auipc	a1,0x45
80006846:	8d258593          	addi	a1,a1,-1838 # 8004b114 <d.414>
8000684a:	854a                	mv	a0,s2
8000684c:	b64fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006850:	4505                	li	a0,1
80006852:	8f5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006856:	40000613          	li	a2,1024
8000685a:	00045597          	auipc	a1,0x45
8000685e:	cba58593          	addi	a1,a1,-838 # 8004b514 <d.413>
80006862:	854a                	mv	a0,s2
80006864:	b4cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006868:	4505                	li	a0,1
8000686a:	8ddfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000686e:	40000613          	li	a2,1024
80006872:	00045597          	auipc	a1,0x45
80006876:	0a258593          	addi	a1,a1,162 # 8004b914 <d.412>
8000687a:	854a                	mv	a0,s2
8000687c:	b34fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006880:	4505                	li	a0,1
80006882:	8c5fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006886:	40000613          	li	a2,1024
8000688a:	00045597          	auipc	a1,0x45
8000688e:	48a58593          	addi	a1,a1,1162 # 8004bd14 <d.411>
80006892:	854a                	mv	a0,s2
80006894:	b1cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006898:	4505                	li	a0,1
8000689a:	8adfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000689e:	40000613          	li	a2,1024
800068a2:	00046597          	auipc	a1,0x46
800068a6:	87258593          	addi	a1,a1,-1934 # 8004c114 <d.410>
800068aa:	854a                	mv	a0,s2
800068ac:	b04fa0ef          	jal	80000bb0 <memmove>
      return 1;
800068b0:	4505                	li	a0,1
800068b2:	895fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800068b6:	40000613          	li	a2,1024
800068ba:	00046597          	auipc	a1,0x46
800068be:	c5a58593          	addi	a1,a1,-934 # 8004c514 <d.409>
800068c2:	854a                	mv	a0,s2
800068c4:	aecfa0ef          	jal	80000bb0 <memmove>
      return 1;
800068c8:	4505                	li	a0,1
800068ca:	87dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800068ce:	40000613          	li	a2,1024
800068d2:	00046597          	auipc	a1,0x46
800068d6:	04258593          	addi	a1,a1,66 # 8004c914 <d.408>
800068da:	854a                	mv	a0,s2
800068dc:	ad4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800068e0:	4505                	li	a0,1
800068e2:	865fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800068e6:	40000613          	li	a2,1024
800068ea:	00046597          	auipc	a1,0x46
800068ee:	42a58593          	addi	a1,a1,1066 # 8004cd14 <d.407>
800068f2:	854a                	mv	a0,s2
800068f4:	abcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800068f8:	4505                	li	a0,1
800068fa:	84dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800068fe:	40000613          	li	a2,1024
80006902:	00047597          	auipc	a1,0x47
80006906:	81258593          	addi	a1,a1,-2030 # 8004d114 <d.406>
8000690a:	854a                	mv	a0,s2
8000690c:	aa4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006910:	4505                	li	a0,1
80006912:	835fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006916:	40000613          	li	a2,1024
8000691a:	00047597          	auipc	a1,0x47
8000691e:	bfa58593          	addi	a1,a1,-1030 # 8004d514 <d.405>
80006922:	854a                	mv	a0,s2
80006924:	a8cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006928:	4505                	li	a0,1
8000692a:	81dfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000692e:	40000613          	li	a2,1024
80006932:	00047597          	auipc	a1,0x47
80006936:	fe258593          	addi	a1,a1,-30 # 8004d914 <d.404>
8000693a:	854a                	mv	a0,s2
8000693c:	a74fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006940:	4505                	li	a0,1
80006942:	805fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006946:	40000613          	li	a2,1024
8000694a:	00047597          	auipc	a1,0x47
8000694e:	3ca58593          	addi	a1,a1,970 # 8004dd14 <d.403>
80006952:	854a                	mv	a0,s2
80006954:	a5cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006958:	4505                	li	a0,1
8000695a:	fecfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000695e:	40000613          	li	a2,1024
80006962:	00047597          	auipc	a1,0x47
80006966:	7b258593          	addi	a1,a1,1970 # 8004e114 <d.402>
8000696a:	854a                	mv	a0,s2
8000696c:	a44fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006970:	4505                	li	a0,1
80006972:	fd4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006976:	40000613          	li	a2,1024
8000697a:	00048597          	auipc	a1,0x48
8000697e:	b9a58593          	addi	a1,a1,-1126 # 8004e514 <d.401>
80006982:	854a                	mv	a0,s2
80006984:	a2cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006988:	4505                	li	a0,1
8000698a:	fbcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000698e:	40000613          	li	a2,1024
80006992:	00048597          	auipc	a1,0x48
80006996:	f8258593          	addi	a1,a1,-126 # 8004e914 <d.400>
8000699a:	854a                	mv	a0,s2
8000699c:	a14fa0ef          	jal	80000bb0 <memmove>
      return 1;
800069a0:	4505                	li	a0,1
800069a2:	fa4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800069a6:	40000613          	li	a2,1024
800069aa:	00048597          	auipc	a1,0x48
800069ae:	36a58593          	addi	a1,a1,874 # 8004ed14 <d.399>
800069b2:	854a                	mv	a0,s2
800069b4:	9fcfa0ef          	jal	80000bb0 <memmove>
      return 1;
800069b8:	4505                	li	a0,1
800069ba:	f8cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800069be:	40000613          	li	a2,1024
800069c2:	00048597          	auipc	a1,0x48
800069c6:	75258593          	addi	a1,a1,1874 # 8004f114 <d.398>
800069ca:	854a                	mv	a0,s2
800069cc:	9e4fa0ef          	jal	80000bb0 <memmove>
      return 1;
800069d0:	4505                	li	a0,1
800069d2:	f74fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800069d6:	40000613          	li	a2,1024
800069da:	00049597          	auipc	a1,0x49
800069de:	b3a58593          	addi	a1,a1,-1222 # 8004f514 <d.397>
800069e2:	854a                	mv	a0,s2
800069e4:	9ccfa0ef          	jal	80000bb0 <memmove>
      return 1;
800069e8:	4505                	li	a0,1
800069ea:	f5cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800069ee:	40000613          	li	a2,1024
800069f2:	00049597          	auipc	a1,0x49
800069f6:	f2258593          	addi	a1,a1,-222 # 8004f914 <d.396>
800069fa:	854a                	mv	a0,s2
800069fc:	9b4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a00:	4505                	li	a0,1
80006a02:	f44fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a06:	40000613          	li	a2,1024
80006a0a:	00049597          	auipc	a1,0x49
80006a0e:	30a58593          	addi	a1,a1,778 # 8004fd14 <d.395>
80006a12:	854a                	mv	a0,s2
80006a14:	99cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a18:	4505                	li	a0,1
80006a1a:	f2cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a1e:	40000613          	li	a2,1024
80006a22:	00049597          	auipc	a1,0x49
80006a26:	6f258593          	addi	a1,a1,1778 # 80050114 <d.394>
80006a2a:	854a                	mv	a0,s2
80006a2c:	984fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a30:	4505                	li	a0,1
80006a32:	f14fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a36:	40000613          	li	a2,1024
80006a3a:	0004a597          	auipc	a1,0x4a
80006a3e:	ada58593          	addi	a1,a1,-1318 # 80050514 <d.393>
80006a42:	854a                	mv	a0,s2
80006a44:	96cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a48:	4505                	li	a0,1
80006a4a:	efcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a4e:	40000613          	li	a2,1024
80006a52:	0004a597          	auipc	a1,0x4a
80006a56:	ec258593          	addi	a1,a1,-318 # 80050914 <d.392>
80006a5a:	854a                	mv	a0,s2
80006a5c:	954fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a60:	4505                	li	a0,1
80006a62:	ee4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a66:	40000613          	li	a2,1024
80006a6a:	0004a597          	auipc	a1,0x4a
80006a6e:	2aa58593          	addi	a1,a1,682 # 80050d14 <d.391>
80006a72:	854a                	mv	a0,s2
80006a74:	93cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a78:	4505                	li	a0,1
80006a7a:	eccfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a7e:	40000613          	li	a2,1024
80006a82:	0004a597          	auipc	a1,0x4a
80006a86:	69258593          	addi	a1,a1,1682 # 80051114 <d.390>
80006a8a:	854a                	mv	a0,s2
80006a8c:	924fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006a90:	4505                	li	a0,1
80006a92:	eb4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006a96:	40000613          	li	a2,1024
80006a9a:	0004b597          	auipc	a1,0x4b
80006a9e:	a7a58593          	addi	a1,a1,-1414 # 80051514 <d.389>
80006aa2:	854a                	mv	a0,s2
80006aa4:	90cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006aa8:	4505                	li	a0,1
80006aaa:	e9cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006aae:	40000613          	li	a2,1024
80006ab2:	0004b597          	auipc	a1,0x4b
80006ab6:	e6258593          	addi	a1,a1,-414 # 80051914 <d.388>
80006aba:	854a                	mv	a0,s2
80006abc:	8f4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006ac0:	4505                	li	a0,1
80006ac2:	e84fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006ac6:	40000613          	li	a2,1024
80006aca:	0004b597          	auipc	a1,0x4b
80006ace:	24a58593          	addi	a1,a1,586 # 80051d14 <d.387>
80006ad2:	854a                	mv	a0,s2
80006ad4:	8dcfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006ad8:	4505                	li	a0,1
80006ada:	e6cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006ade:	40000613          	li	a2,1024
80006ae2:	0004b597          	auipc	a1,0x4b
80006ae6:	63258593          	addi	a1,a1,1586 # 80052114 <d.386>
80006aea:	854a                	mv	a0,s2
80006aec:	8c4fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006af0:	4505                	li	a0,1
80006af2:	e54fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006af6:	40000613          	li	a2,1024
80006afa:	0004c597          	auipc	a1,0x4c
80006afe:	a1a58593          	addi	a1,a1,-1510 # 80052514 <d.385>
80006b02:	854a                	mv	a0,s2
80006b04:	8acfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b08:	4505                	li	a0,1
80006b0a:	e3cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b0e:	40000613          	li	a2,1024
80006b12:	0004c597          	auipc	a1,0x4c
80006b16:	e0258593          	addi	a1,a1,-510 # 80052914 <d.384>
80006b1a:	854a                	mv	a0,s2
80006b1c:	894fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b20:	4505                	li	a0,1
80006b22:	e24fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b26:	40000613          	li	a2,1024
80006b2a:	0004c597          	auipc	a1,0x4c
80006b2e:	1ea58593          	addi	a1,a1,490 # 80052d14 <d.383>
80006b32:	854a                	mv	a0,s2
80006b34:	87cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b38:	4505                	li	a0,1
80006b3a:	e0cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b3e:	40000613          	li	a2,1024
80006b42:	0004c597          	auipc	a1,0x4c
80006b46:	5d258593          	addi	a1,a1,1490 # 80053114 <d.382>
80006b4a:	854a                	mv	a0,s2
80006b4c:	864fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b50:	4505                	li	a0,1
80006b52:	df4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b56:	40000613          	li	a2,1024
80006b5a:	0004d597          	auipc	a1,0x4d
80006b5e:	9ba58593          	addi	a1,a1,-1606 # 80053514 <d.381>
80006b62:	854a                	mv	a0,s2
80006b64:	84cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b68:	4505                	li	a0,1
80006b6a:	ddcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b6e:	40000613          	li	a2,1024
80006b72:	0004d597          	auipc	a1,0x4d
80006b76:	da258593          	addi	a1,a1,-606 # 80053914 <d.380>
80006b7a:	854a                	mv	a0,s2
80006b7c:	834fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b80:	4505                	li	a0,1
80006b82:	dc4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b86:	40000613          	li	a2,1024
80006b8a:	0004d597          	auipc	a1,0x4d
80006b8e:	18a58593          	addi	a1,a1,394 # 80053d14 <d.379>
80006b92:	854a                	mv	a0,s2
80006b94:	81cfa0ef          	jal	80000bb0 <memmove>
      return 1;
80006b98:	4505                	li	a0,1
80006b9a:	dacfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006b9e:	40000613          	li	a2,1024
80006ba2:	0004d597          	auipc	a1,0x4d
80006ba6:	57258593          	addi	a1,a1,1394 # 80054114 <d.378>
80006baa:	854a                	mv	a0,s2
80006bac:	804fa0ef          	jal	80000bb0 <memmove>
      return 1;
80006bb0:	4505                	li	a0,1
80006bb2:	d94fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006bb6:	40000613          	li	a2,1024
80006bba:	0004e597          	auipc	a1,0x4e
80006bbe:	95a58593          	addi	a1,a1,-1702 # 80054514 <d.377>
80006bc2:	854a                	mv	a0,s2
80006bc4:	fedf90ef          	jal	80000bb0 <memmove>
      return 1;
80006bc8:	4505                	li	a0,1
80006bca:	d7cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006bce:	40000613          	li	a2,1024
80006bd2:	0004e597          	auipc	a1,0x4e
80006bd6:	d4258593          	addi	a1,a1,-702 # 80054914 <d.376>
80006bda:	854a                	mv	a0,s2
80006bdc:	fd5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006be0:	4505                	li	a0,1
80006be2:	d64fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006be6:	40000613          	li	a2,1024
80006bea:	0004e597          	auipc	a1,0x4e
80006bee:	12a58593          	addi	a1,a1,298 # 80054d14 <d.375>
80006bf2:	854a                	mv	a0,s2
80006bf4:	fbdf90ef          	jal	80000bb0 <memmove>
      return 1;
80006bf8:	4505                	li	a0,1
80006bfa:	d4cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006bfe:	40000613          	li	a2,1024
80006c02:	0004e597          	auipc	a1,0x4e
80006c06:	51258593          	addi	a1,a1,1298 # 80055114 <d.374>
80006c0a:	854a                	mv	a0,s2
80006c0c:	fa5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006c10:	4505                	li	a0,1
80006c12:	d34fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006c16:	40000613          	li	a2,1024
80006c1a:	0004f597          	auipc	a1,0x4f
80006c1e:	8fa58593          	addi	a1,a1,-1798 # 80055514 <d.373>
80006c22:	854a                	mv	a0,s2
80006c24:	f8df90ef          	jal	80000bb0 <memmove>
      return 1;
80006c28:	4505                	li	a0,1
80006c2a:	d1cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006c2e:	40000613          	li	a2,1024
80006c32:	0004f597          	auipc	a1,0x4f
80006c36:	ce258593          	addi	a1,a1,-798 # 80055914 <d.372>
80006c3a:	854a                	mv	a0,s2
80006c3c:	f75f90ef          	jal	80000bb0 <memmove>
      return 1;
80006c40:	4505                	li	a0,1
80006c42:	d04fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006c46:	40000613          	li	a2,1024
80006c4a:	0004f597          	auipc	a1,0x4f
80006c4e:	0ca58593          	addi	a1,a1,202 # 80055d14 <d.371>
80006c52:	854a                	mv	a0,s2
80006c54:	f5df90ef          	jal	80000bb0 <memmove>
      return 1;
80006c58:	4505                	li	a0,1
80006c5a:	cecfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006c5e:	40000613          	li	a2,1024
80006c62:	0004f597          	auipc	a1,0x4f
80006c66:	4b258593          	addi	a1,a1,1202 # 80056114 <d.370>
80006c6a:	854a                	mv	a0,s2
80006c6c:	f45f90ef          	jal	80000bb0 <memmove>
      return 1;
80006c70:	4505                	li	a0,1
80006c72:	cd4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006c76:	40000613          	li	a2,1024
80006c7a:	00050597          	auipc	a1,0x50
80006c7e:	89a58593          	addi	a1,a1,-1894 # 80056514 <d.369>
80006c82:	854a                	mv	a0,s2
80006c84:	f2df90ef          	jal	80000bb0 <memmove>
      return 1;
80006c88:	4505                	li	a0,1
80006c8a:	cbcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006c8e:	40000613          	li	a2,1024
80006c92:	00050597          	auipc	a1,0x50
80006c96:	c8258593          	addi	a1,a1,-894 # 80056914 <d.368>
80006c9a:	854a                	mv	a0,s2
80006c9c:	f15f90ef          	jal	80000bb0 <memmove>
      return 1;
80006ca0:	4505                	li	a0,1
80006ca2:	ca4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006ca6:	40000613          	li	a2,1024
80006caa:	00050597          	auipc	a1,0x50
80006cae:	06a58593          	addi	a1,a1,106 # 80056d14 <d.367>
80006cb2:	854a                	mv	a0,s2
80006cb4:	efdf90ef          	jal	80000bb0 <memmove>
      return 1;
80006cb8:	4505                	li	a0,1
80006cba:	c8cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006cbe:	40000613          	li	a2,1024
80006cc2:	00050597          	auipc	a1,0x50
80006cc6:	45258593          	addi	a1,a1,1106 # 80057114 <d.366>
80006cca:	854a                	mv	a0,s2
80006ccc:	ee5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006cd0:	4505                	li	a0,1
80006cd2:	c74fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006cd6:	40000613          	li	a2,1024
80006cda:	00051597          	auipc	a1,0x51
80006cde:	83a58593          	addi	a1,a1,-1990 # 80057514 <d.365>
80006ce2:	854a                	mv	a0,s2
80006ce4:	ecdf90ef          	jal	80000bb0 <memmove>
      return 1;
80006ce8:	4505                	li	a0,1
80006cea:	c5cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006cee:	40000613          	li	a2,1024
80006cf2:	00051597          	auipc	a1,0x51
80006cf6:	c2258593          	addi	a1,a1,-990 # 80057914 <d.364>
80006cfa:	854a                	mv	a0,s2
80006cfc:	eb5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006d00:	4505                	li	a0,1
80006d02:	c44fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d06:	40000613          	li	a2,1024
80006d0a:	00051597          	auipc	a1,0x51
80006d0e:	00a58593          	addi	a1,a1,10 # 80057d14 <d.363>
80006d12:	854a                	mv	a0,s2
80006d14:	e9df90ef          	jal	80000bb0 <memmove>
      return 1;
80006d18:	4505                	li	a0,1
80006d1a:	c2cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d1e:	40000613          	li	a2,1024
80006d22:	00051597          	auipc	a1,0x51
80006d26:	3f258593          	addi	a1,a1,1010 # 80058114 <d.362>
80006d2a:	854a                	mv	a0,s2
80006d2c:	e85f90ef          	jal	80000bb0 <memmove>
      return 1;
80006d30:	4505                	li	a0,1
80006d32:	c14fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d36:	40000613          	li	a2,1024
80006d3a:	00051597          	auipc	a1,0x51
80006d3e:	7da58593          	addi	a1,a1,2010 # 80058514 <d.361>
80006d42:	854a                	mv	a0,s2
80006d44:	e6df90ef          	jal	80000bb0 <memmove>
      return 1;
80006d48:	4505                	li	a0,1
80006d4a:	bfcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d4e:	40000613          	li	a2,1024
80006d52:	00052597          	auipc	a1,0x52
80006d56:	bc258593          	addi	a1,a1,-1086 # 80058914 <d.360>
80006d5a:	854a                	mv	a0,s2
80006d5c:	e55f90ef          	jal	80000bb0 <memmove>
      return 1;
80006d60:	4505                	li	a0,1
80006d62:	be4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d66:	40000613          	li	a2,1024
80006d6a:	00052597          	auipc	a1,0x52
80006d6e:	faa58593          	addi	a1,a1,-86 # 80058d14 <d.359>
80006d72:	854a                	mv	a0,s2
80006d74:	e3df90ef          	jal	80000bb0 <memmove>
      return 1;
80006d78:	4505                	li	a0,1
80006d7a:	bccfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d7e:	40000613          	li	a2,1024
80006d82:	00052597          	auipc	a1,0x52
80006d86:	39258593          	addi	a1,a1,914 # 80059114 <d.358>
80006d8a:	854a                	mv	a0,s2
80006d8c:	e25f90ef          	jal	80000bb0 <memmove>
      return 1;
80006d90:	4505                	li	a0,1
80006d92:	bb4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006d96:	40000613          	li	a2,1024
80006d9a:	00052597          	auipc	a1,0x52
80006d9e:	77a58593          	addi	a1,a1,1914 # 80059514 <d.357>
80006da2:	854a                	mv	a0,s2
80006da4:	e0df90ef          	jal	80000bb0 <memmove>
      return 1;
80006da8:	4505                	li	a0,1
80006daa:	b9cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006dae:	40000613          	li	a2,1024
80006db2:	00053597          	auipc	a1,0x53
80006db6:	b6258593          	addi	a1,a1,-1182 # 80059914 <d.356>
80006dba:	854a                	mv	a0,s2
80006dbc:	df5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006dc0:	4505                	li	a0,1
80006dc2:	b84fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006dc6:	40000613          	li	a2,1024
80006dca:	00053597          	auipc	a1,0x53
80006dce:	f4a58593          	addi	a1,a1,-182 # 80059d14 <d.355>
80006dd2:	854a                	mv	a0,s2
80006dd4:	dddf90ef          	jal	80000bb0 <memmove>
      return 1;
80006dd8:	4505                	li	a0,1
80006dda:	b6cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006dde:	40000613          	li	a2,1024
80006de2:	00053597          	auipc	a1,0x53
80006de6:	33258593          	addi	a1,a1,818 # 8005a114 <d.354>
80006dea:	854a                	mv	a0,s2
80006dec:	dc5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006df0:	4505                	li	a0,1
80006df2:	b54fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006df6:	40000613          	li	a2,1024
80006dfa:	00053597          	auipc	a1,0x53
80006dfe:	71a58593          	addi	a1,a1,1818 # 8005a514 <d.353>
80006e02:	854a                	mv	a0,s2
80006e04:	dadf90ef          	jal	80000bb0 <memmove>
      return 1;
80006e08:	4505                	li	a0,1
80006e0a:	b3cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e0e:	40000613          	li	a2,1024
80006e12:	00054597          	auipc	a1,0x54
80006e16:	b0258593          	addi	a1,a1,-1278 # 8005a914 <d.352>
80006e1a:	854a                	mv	a0,s2
80006e1c:	d95f90ef          	jal	80000bb0 <memmove>
      return 1;
80006e20:	4505                	li	a0,1
80006e22:	b24fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e26:	40000613          	li	a2,1024
80006e2a:	00054597          	auipc	a1,0x54
80006e2e:	eea58593          	addi	a1,a1,-278 # 8005ad14 <d.351>
80006e32:	854a                	mv	a0,s2
80006e34:	d7df90ef          	jal	80000bb0 <memmove>
      return 1;
80006e38:	4505                	li	a0,1
80006e3a:	b0cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e3e:	40000613          	li	a2,1024
80006e42:	00054597          	auipc	a1,0x54
80006e46:	2d258593          	addi	a1,a1,722 # 8005b114 <d.350>
80006e4a:	854a                	mv	a0,s2
80006e4c:	d65f90ef          	jal	80000bb0 <memmove>
      return 1;
80006e50:	4505                	li	a0,1
80006e52:	af4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e56:	40000613          	li	a2,1024
80006e5a:	00054597          	auipc	a1,0x54
80006e5e:	6ba58593          	addi	a1,a1,1722 # 8005b514 <d.349>
80006e62:	854a                	mv	a0,s2
80006e64:	d4df90ef          	jal	80000bb0 <memmove>
      return 1;
80006e68:	4505                	li	a0,1
80006e6a:	adcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e6e:	40000613          	li	a2,1024
80006e72:	00055597          	auipc	a1,0x55
80006e76:	aa258593          	addi	a1,a1,-1374 # 8005b914 <d.348>
80006e7a:	854a                	mv	a0,s2
80006e7c:	d35f90ef          	jal	80000bb0 <memmove>
      return 1;
80006e80:	4505                	li	a0,1
80006e82:	ac4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e86:	40000613          	li	a2,1024
80006e8a:	00055597          	auipc	a1,0x55
80006e8e:	e8a58593          	addi	a1,a1,-374 # 8005bd14 <d.347>
80006e92:	854a                	mv	a0,s2
80006e94:	d1df90ef          	jal	80000bb0 <memmove>
      return 1;
80006e98:	4505                	li	a0,1
80006e9a:	aacfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006e9e:	40000613          	li	a2,1024
80006ea2:	00055597          	auipc	a1,0x55
80006ea6:	27258593          	addi	a1,a1,626 # 8005c114 <d.346>
80006eaa:	854a                	mv	a0,s2
80006eac:	d05f90ef          	jal	80000bb0 <memmove>
      return 1;
80006eb0:	4505                	li	a0,1
80006eb2:	a94fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006eb6:	40000613          	li	a2,1024
80006eba:	00055597          	auipc	a1,0x55
80006ebe:	65a58593          	addi	a1,a1,1626 # 8005c514 <d.345>
80006ec2:	854a                	mv	a0,s2
80006ec4:	cedf90ef          	jal	80000bb0 <memmove>
      return 1;
80006ec8:	4505                	li	a0,1
80006eca:	a7cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006ece:	40000613          	li	a2,1024
80006ed2:	00056597          	auipc	a1,0x56
80006ed6:	a4258593          	addi	a1,a1,-1470 # 8005c914 <d.344>
80006eda:	854a                	mv	a0,s2
80006edc:	cd5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006ee0:	4505                	li	a0,1
80006ee2:	a64fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006ee6:	40000613          	li	a2,1024
80006eea:	00056597          	auipc	a1,0x56
80006eee:	e2a58593          	addi	a1,a1,-470 # 8005cd14 <d.343>
80006ef2:	854a                	mv	a0,s2
80006ef4:	cbdf90ef          	jal	80000bb0 <memmove>
      return 1;
80006ef8:	4505                	li	a0,1
80006efa:	a4cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006efe:	40000613          	li	a2,1024
80006f02:	00056597          	auipc	a1,0x56
80006f06:	21258593          	addi	a1,a1,530 # 8005d114 <d.342>
80006f0a:	854a                	mv	a0,s2
80006f0c:	ca5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006f10:	4505                	li	a0,1
80006f12:	a34fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006f16:	40000613          	li	a2,1024
80006f1a:	00056597          	auipc	a1,0x56
80006f1e:	5fa58593          	addi	a1,a1,1530 # 8005d514 <d.341>
80006f22:	854a                	mv	a0,s2
80006f24:	c8df90ef          	jal	80000bb0 <memmove>
      return 1;
80006f28:	4505                	li	a0,1
80006f2a:	a1cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006f2e:	40000613          	li	a2,1024
80006f32:	00057597          	auipc	a1,0x57
80006f36:	9e258593          	addi	a1,a1,-1566 # 8005d914 <d.340>
80006f3a:	854a                	mv	a0,s2
80006f3c:	c75f90ef          	jal	80000bb0 <memmove>
      return 1;
80006f40:	4505                	li	a0,1
80006f42:	a04fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006f46:	40000613          	li	a2,1024
80006f4a:	00057597          	auipc	a1,0x57
80006f4e:	dca58593          	addi	a1,a1,-566 # 8005dd14 <d.339>
80006f52:	854a                	mv	a0,s2
80006f54:	c5df90ef          	jal	80000bb0 <memmove>
      return 1;
80006f58:	4505                	li	a0,1
80006f5a:	9ecfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006f5e:	40000613          	li	a2,1024
80006f62:	00057597          	auipc	a1,0x57
80006f66:	1b258593          	addi	a1,a1,434 # 8005e114 <d.338>
80006f6a:	854a                	mv	a0,s2
80006f6c:	c45f90ef          	jal	80000bb0 <memmove>
      return 1;
80006f70:	4505                	li	a0,1
80006f72:	9d4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006f76:	40000613          	li	a2,1024
80006f7a:	00057597          	auipc	a1,0x57
80006f7e:	59a58593          	addi	a1,a1,1434 # 8005e514 <d.337>
80006f82:	854a                	mv	a0,s2
80006f84:	c2df90ef          	jal	80000bb0 <memmove>
      return 1;
80006f88:	4505                	li	a0,1
80006f8a:	9bcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006f8e:	40000613          	li	a2,1024
80006f92:	00058597          	auipc	a1,0x58
80006f96:	98258593          	addi	a1,a1,-1662 # 8005e914 <d.336>
80006f9a:	854a                	mv	a0,s2
80006f9c:	c15f90ef          	jal	80000bb0 <memmove>
      return 1;
80006fa0:	4505                	li	a0,1
80006fa2:	9a4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006fa6:	40000613          	li	a2,1024
80006faa:	00058597          	auipc	a1,0x58
80006fae:	d6a58593          	addi	a1,a1,-662 # 8005ed14 <d.335>
80006fb2:	854a                	mv	a0,s2
80006fb4:	bfdf90ef          	jal	80000bb0 <memmove>
      return 1;
80006fb8:	4505                	li	a0,1
80006fba:	98cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006fbe:	40000613          	li	a2,1024
80006fc2:	00058597          	auipc	a1,0x58
80006fc6:	15258593          	addi	a1,a1,338 # 8005f114 <d.334>
80006fca:	854a                	mv	a0,s2
80006fcc:	be5f90ef          	jal	80000bb0 <memmove>
      return 1;
80006fd0:	4505                	li	a0,1
80006fd2:	974fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006fd6:	40000613          	li	a2,1024
80006fda:	00058597          	auipc	a1,0x58
80006fde:	53a58593          	addi	a1,a1,1338 # 8005f514 <d.333>
80006fe2:	854a                	mv	a0,s2
80006fe4:	bcdf90ef          	jal	80000bb0 <memmove>
      return 1;
80006fe8:	4505                	li	a0,1
80006fea:	95cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80006fee:	40000613          	li	a2,1024
80006ff2:	00059597          	auipc	a1,0x59
80006ff6:	92258593          	addi	a1,a1,-1758 # 8005f914 <d.332>
80006ffa:	854a                	mv	a0,s2
80006ffc:	bb5f90ef          	jal	80000bb0 <memmove>
      return 1;
80007000:	4505                	li	a0,1
80007002:	944fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007006:	40000613          	li	a2,1024
8000700a:	00059597          	auipc	a1,0x59
8000700e:	d0a58593          	addi	a1,a1,-758 # 8005fd14 <d.331>
80007012:	854a                	mv	a0,s2
80007014:	b9df90ef          	jal	80000bb0 <memmove>
      return 1;
80007018:	4505                	li	a0,1
8000701a:	92cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000701e:	40000613          	li	a2,1024
80007022:	00059597          	auipc	a1,0x59
80007026:	0f258593          	addi	a1,a1,242 # 80060114 <d.330>
8000702a:	854a                	mv	a0,s2
8000702c:	b85f90ef          	jal	80000bb0 <memmove>
      return 1;
80007030:	4505                	li	a0,1
80007032:	914fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007036:	40000613          	li	a2,1024
8000703a:	00059597          	auipc	a1,0x59
8000703e:	4da58593          	addi	a1,a1,1242 # 80060514 <d.329>
80007042:	854a                	mv	a0,s2
80007044:	b6df90ef          	jal	80000bb0 <memmove>
      return 1;
80007048:	4505                	li	a0,1
8000704a:	8fcfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000704e:	40000613          	li	a2,1024
80007052:	0005a597          	auipc	a1,0x5a
80007056:	8c258593          	addi	a1,a1,-1854 # 80060914 <d.328>
8000705a:	854a                	mv	a0,s2
8000705c:	b55f90ef          	jal	80000bb0 <memmove>
      return 1;
80007060:	4505                	li	a0,1
80007062:	8e4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007066:	40000613          	li	a2,1024
8000706a:	0005a597          	auipc	a1,0x5a
8000706e:	caa58593          	addi	a1,a1,-854 # 80060d14 <d.327>
80007072:	854a                	mv	a0,s2
80007074:	b3df90ef          	jal	80000bb0 <memmove>
      return 1;
80007078:	4505                	li	a0,1
8000707a:	8ccfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000707e:	40000613          	li	a2,1024
80007082:	0005a597          	auipc	a1,0x5a
80007086:	09258593          	addi	a1,a1,146 # 80061114 <d.326>
8000708a:	854a                	mv	a0,s2
8000708c:	b25f90ef          	jal	80000bb0 <memmove>
      return 1;
80007090:	4505                	li	a0,1
80007092:	8b4fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007096:	40000613          	li	a2,1024
8000709a:	0005a597          	auipc	a1,0x5a
8000709e:	47a58593          	addi	a1,a1,1146 # 80061514 <d.325>
800070a2:	854a                	mv	a0,s2
800070a4:	b0df90ef          	jal	80000bb0 <memmove>
      return 1;
800070a8:	4505                	li	a0,1
800070aa:	89cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800070ae:	40000613          	li	a2,1024
800070b2:	0005b597          	auipc	a1,0x5b
800070b6:	86258593          	addi	a1,a1,-1950 # 80061914 <d.324>
800070ba:	854a                	mv	a0,s2
800070bc:	af5f90ef          	jal	80000bb0 <memmove>
      return 1;
800070c0:	4505                	li	a0,1
800070c2:	884fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800070c6:	40000613          	li	a2,1024
800070ca:	0005b597          	auipc	a1,0x5b
800070ce:	c4a58593          	addi	a1,a1,-950 # 80061d14 <d.323>
800070d2:	854a                	mv	a0,s2
800070d4:	addf90ef          	jal	80000bb0 <memmove>
      return 1;
800070d8:	4505                	li	a0,1
800070da:	86cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800070de:	40000613          	li	a2,1024
800070e2:	0005b597          	auipc	a1,0x5b
800070e6:	03258593          	addi	a1,a1,50 # 80062114 <d.322>
800070ea:	854a                	mv	a0,s2
800070ec:	ac5f90ef          	jal	80000bb0 <memmove>
      return 1;
800070f0:	4505                	li	a0,1
800070f2:	854fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800070f6:	40000613          	li	a2,1024
800070fa:	0005b597          	auipc	a1,0x5b
800070fe:	41a58593          	addi	a1,a1,1050 # 80062514 <d.321>
80007102:	854a                	mv	a0,s2
80007104:	aadf90ef          	jal	80000bb0 <memmove>
      return 1;
80007108:	4505                	li	a0,1
8000710a:	83cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000710e:	40000613          	li	a2,1024
80007112:	0005c597          	auipc	a1,0x5c
80007116:	80258593          	addi	a1,a1,-2046 # 80062914 <d.320>
8000711a:	854a                	mv	a0,s2
8000711c:	a95f90ef          	jal	80000bb0 <memmove>
      return 1;
80007120:	4505                	li	a0,1
80007122:	824fe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007126:	40000613          	li	a2,1024
8000712a:	0005c597          	auipc	a1,0x5c
8000712e:	bea58593          	addi	a1,a1,-1046 # 80062d14 <d.319>
80007132:	854a                	mv	a0,s2
80007134:	a7df90ef          	jal	80000bb0 <memmove>
      return 1;
80007138:	4505                	li	a0,1
8000713a:	80cfe06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000713e:	40000613          	li	a2,1024
80007142:	0005c597          	auipc	a1,0x5c
80007146:	fd258593          	addi	a1,a1,-46 # 80063114 <d.318>
8000714a:	854a                	mv	a0,s2
8000714c:	a65f90ef          	jal	80000bb0 <memmove>
      return 1;
80007150:	4505                	li	a0,1
80007152:	ff5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007156:	40000613          	li	a2,1024
8000715a:	0005c597          	auipc	a1,0x5c
8000715e:	3ba58593          	addi	a1,a1,954 # 80063514 <d.317>
80007162:	854a                	mv	a0,s2
80007164:	a4df90ef          	jal	80000bb0 <memmove>
      return 1;
80007168:	4505                	li	a0,1
8000716a:	fddfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000716e:	40000613          	li	a2,1024
80007172:	0005c597          	auipc	a1,0x5c
80007176:	7a258593          	addi	a1,a1,1954 # 80063914 <d.316>
8000717a:	854a                	mv	a0,s2
8000717c:	a35f90ef          	jal	80000bb0 <memmove>
      return 1;
80007180:	4505                	li	a0,1
80007182:	fc5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007186:	40000613          	li	a2,1024
8000718a:	0005d597          	auipc	a1,0x5d
8000718e:	b8a58593          	addi	a1,a1,-1142 # 80063d14 <d.315>
80007192:	854a                	mv	a0,s2
80007194:	a1df90ef          	jal	80000bb0 <memmove>
      return 1;
80007198:	4505                	li	a0,1
8000719a:	fadfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000719e:	40000613          	li	a2,1024
800071a2:	0005d597          	auipc	a1,0x5d
800071a6:	f7258593          	addi	a1,a1,-142 # 80064114 <d.314>
800071aa:	854a                	mv	a0,s2
800071ac:	a05f90ef          	jal	80000bb0 <memmove>
      return 1;
800071b0:	4505                	li	a0,1
800071b2:	f95fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800071b6:	40000613          	li	a2,1024
800071ba:	0005d597          	auipc	a1,0x5d
800071be:	35a58593          	addi	a1,a1,858 # 80064514 <d.313>
800071c2:	854a                	mv	a0,s2
800071c4:	9edf90ef          	jal	80000bb0 <memmove>
      return 1;
800071c8:	4505                	li	a0,1
800071ca:	f7dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800071ce:	40000613          	li	a2,1024
800071d2:	0005d597          	auipc	a1,0x5d
800071d6:	74258593          	addi	a1,a1,1858 # 80064914 <d.312>
800071da:	854a                	mv	a0,s2
800071dc:	9d5f90ef          	jal	80000bb0 <memmove>
      return 1;
800071e0:	4505                	li	a0,1
800071e2:	f65fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800071e6:	40000613          	li	a2,1024
800071ea:	0005e597          	auipc	a1,0x5e
800071ee:	b2a58593          	addi	a1,a1,-1238 # 80064d14 <d.311>
800071f2:	854a                	mv	a0,s2
800071f4:	9bdf90ef          	jal	80000bb0 <memmove>
      return 1;
800071f8:	4505                	li	a0,1
800071fa:	f4dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800071fe:	40000613          	li	a2,1024
80007202:	0005e597          	auipc	a1,0x5e
80007206:	f1258593          	addi	a1,a1,-238 # 80065114 <d.310>
8000720a:	854a                	mv	a0,s2
8000720c:	9a5f90ef          	jal	80000bb0 <memmove>
      return 1;
80007210:	4505                	li	a0,1
80007212:	f35fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007216:	40000613          	li	a2,1024
8000721a:	0005e597          	auipc	a1,0x5e
8000721e:	2fa58593          	addi	a1,a1,762 # 80065514 <d.309>
80007222:	854a                	mv	a0,s2
80007224:	98df90ef          	jal	80000bb0 <memmove>
      return 1;
80007228:	4505                	li	a0,1
8000722a:	f1dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000722e:	40000613          	li	a2,1024
80007232:	0005e597          	auipc	a1,0x5e
80007236:	6e258593          	addi	a1,a1,1762 # 80065914 <d.308>
8000723a:	854a                	mv	a0,s2
8000723c:	975f90ef          	jal	80000bb0 <memmove>
      return 1;
80007240:	4505                	li	a0,1
80007242:	f05fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007246:	40000613          	li	a2,1024
8000724a:	0005f597          	auipc	a1,0x5f
8000724e:	aca58593          	addi	a1,a1,-1334 # 80065d14 <d.307>
80007252:	854a                	mv	a0,s2
80007254:	95df90ef          	jal	80000bb0 <memmove>
      return 1;
80007258:	4505                	li	a0,1
8000725a:	eedfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000725e:	40000613          	li	a2,1024
80007262:	0005f597          	auipc	a1,0x5f
80007266:	eb258593          	addi	a1,a1,-334 # 80066114 <d.306>
8000726a:	854a                	mv	a0,s2
8000726c:	945f90ef          	jal	80000bb0 <memmove>
      return 1;
80007270:	4505                	li	a0,1
80007272:	ed5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007276:	40000613          	li	a2,1024
8000727a:	0005f597          	auipc	a1,0x5f
8000727e:	29a58593          	addi	a1,a1,666 # 80066514 <d.305>
80007282:	854a                	mv	a0,s2
80007284:	92df90ef          	jal	80000bb0 <memmove>
      return 1;
80007288:	4505                	li	a0,1
8000728a:	ebdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000728e:	40000613          	li	a2,1024
80007292:	0005f597          	auipc	a1,0x5f
80007296:	68258593          	addi	a1,a1,1666 # 80066914 <d.304>
8000729a:	854a                	mv	a0,s2
8000729c:	915f90ef          	jal	80000bb0 <memmove>
      return 1;
800072a0:	4505                	li	a0,1
800072a2:	ea5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800072a6:	40000613          	li	a2,1024
800072aa:	00060597          	auipc	a1,0x60
800072ae:	a6a58593          	addi	a1,a1,-1430 # 80066d14 <d.303>
800072b2:	854a                	mv	a0,s2
800072b4:	8fdf90ef          	jal	80000bb0 <memmove>
      return 1;
800072b8:	4505                	li	a0,1
800072ba:	e8dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800072be:	40000613          	li	a2,1024
800072c2:	00060597          	auipc	a1,0x60
800072c6:	e5258593          	addi	a1,a1,-430 # 80067114 <d.302>
800072ca:	854a                	mv	a0,s2
800072cc:	8e5f90ef          	jal	80000bb0 <memmove>
      return 1;
800072d0:	4505                	li	a0,1
800072d2:	e75fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800072d6:	40000613          	li	a2,1024
800072da:	00060597          	auipc	a1,0x60
800072de:	23a58593          	addi	a1,a1,570 # 80067514 <d.301>
800072e2:	854a                	mv	a0,s2
800072e4:	8cdf90ef          	jal	80000bb0 <memmove>
      return 1;
800072e8:	4505                	li	a0,1
800072ea:	e5dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800072ee:	40000613          	li	a2,1024
800072f2:	00060597          	auipc	a1,0x60
800072f6:	62258593          	addi	a1,a1,1570 # 80067914 <d.300>
800072fa:	854a                	mv	a0,s2
800072fc:	8b5f90ef          	jal	80000bb0 <memmove>
      return 1;
80007300:	4505                	li	a0,1
80007302:	e45fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007306:	40000613          	li	a2,1024
8000730a:	00061597          	auipc	a1,0x61
8000730e:	a0a58593          	addi	a1,a1,-1526 # 80067d14 <d.299>
80007312:	854a                	mv	a0,s2
80007314:	89df90ef          	jal	80000bb0 <memmove>
      return 1;
80007318:	4505                	li	a0,1
8000731a:	e2dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000731e:	40000613          	li	a2,1024
80007322:	00061597          	auipc	a1,0x61
80007326:	df258593          	addi	a1,a1,-526 # 80068114 <d.298>
8000732a:	854a                	mv	a0,s2
8000732c:	885f90ef          	jal	80000bb0 <memmove>
      return 1;
80007330:	4505                	li	a0,1
80007332:	e15fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007336:	40000613          	li	a2,1024
8000733a:	00061597          	auipc	a1,0x61
8000733e:	1da58593          	addi	a1,a1,474 # 80068514 <d.297>
80007342:	854a                	mv	a0,s2
80007344:	86df90ef          	jal	80000bb0 <memmove>
      return 1;
80007348:	4505                	li	a0,1
8000734a:	dfdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000734e:	40000613          	li	a2,1024
80007352:	00061597          	auipc	a1,0x61
80007356:	5c258593          	addi	a1,a1,1474 # 80068914 <d.296>
8000735a:	854a                	mv	a0,s2
8000735c:	855f90ef          	jal	80000bb0 <memmove>
      return 1;
80007360:	4505                	li	a0,1
80007362:	de5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007366:	40000613          	li	a2,1024
8000736a:	00062597          	auipc	a1,0x62
8000736e:	9aa58593          	addi	a1,a1,-1622 # 80068d14 <d.295>
80007372:	854a                	mv	a0,s2
80007374:	83df90ef          	jal	80000bb0 <memmove>
      return 1;
80007378:	4505                	li	a0,1
8000737a:	dcdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000737e:	40000613          	li	a2,1024
80007382:	00062597          	auipc	a1,0x62
80007386:	d9258593          	addi	a1,a1,-622 # 80069114 <d.294>
8000738a:	854a                	mv	a0,s2
8000738c:	825f90ef          	jal	80000bb0 <memmove>
      return 1;
80007390:	4505                	li	a0,1
80007392:	db5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007396:	40000613          	li	a2,1024
8000739a:	00062597          	auipc	a1,0x62
8000739e:	17a58593          	addi	a1,a1,378 # 80069514 <d.293>
800073a2:	854a                	mv	a0,s2
800073a4:	80df90ef          	jal	80000bb0 <memmove>
      return 1;
800073a8:	4505                	li	a0,1
800073aa:	d9dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800073ae:	40000613          	li	a2,1024
800073b2:	00062597          	auipc	a1,0x62
800073b6:	56258593          	addi	a1,a1,1378 # 80069914 <d.292>
800073ba:	854a                	mv	a0,s2
800073bc:	ff4f90ef          	jal	80000bb0 <memmove>
      return 1;
800073c0:	4505                	li	a0,1
800073c2:	d85fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800073c6:	40000613          	li	a2,1024
800073ca:	00063597          	auipc	a1,0x63
800073ce:	94a58593          	addi	a1,a1,-1718 # 80069d14 <d.291>
800073d2:	854a                	mv	a0,s2
800073d4:	fdcf90ef          	jal	80000bb0 <memmove>
      return 1;
800073d8:	4505                	li	a0,1
800073da:	d6dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800073de:	40000613          	li	a2,1024
800073e2:	00063597          	auipc	a1,0x63
800073e6:	d3258593          	addi	a1,a1,-718 # 8006a114 <d.290>
800073ea:	854a                	mv	a0,s2
800073ec:	fc4f90ef          	jal	80000bb0 <memmove>
      return 1;
800073f0:	4505                	li	a0,1
800073f2:	d55fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800073f6:	40000613          	li	a2,1024
800073fa:	00063597          	auipc	a1,0x63
800073fe:	11a58593          	addi	a1,a1,282 # 8006a514 <d.289>
80007402:	854a                	mv	a0,s2
80007404:	facf90ef          	jal	80000bb0 <memmove>
      return 1;
80007408:	4505                	li	a0,1
8000740a:	d3dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000740e:	40000613          	li	a2,1024
80007412:	00063597          	auipc	a1,0x63
80007416:	50258593          	addi	a1,a1,1282 # 8006a914 <d.288>
8000741a:	854a                	mv	a0,s2
8000741c:	f94f90ef          	jal	80000bb0 <memmove>
      return 1;
80007420:	4505                	li	a0,1
80007422:	d25fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007426:	40000613          	li	a2,1024
8000742a:	00064597          	auipc	a1,0x64
8000742e:	8ea58593          	addi	a1,a1,-1814 # 8006ad14 <d.287>
80007432:	854a                	mv	a0,s2
80007434:	f7cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007438:	4505                	li	a0,1
8000743a:	d0dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000743e:	40000613          	li	a2,1024
80007442:	00064597          	auipc	a1,0x64
80007446:	cd258593          	addi	a1,a1,-814 # 8006b114 <d.286>
8000744a:	854a                	mv	a0,s2
8000744c:	f64f90ef          	jal	80000bb0 <memmove>
      return 1;
80007450:	4505                	li	a0,1
80007452:	cf5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007456:	40000613          	li	a2,1024
8000745a:	00064597          	auipc	a1,0x64
8000745e:	0ba58593          	addi	a1,a1,186 # 8006b514 <d.285>
80007462:	854a                	mv	a0,s2
80007464:	f4cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007468:	4505                	li	a0,1
8000746a:	cddfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000746e:	40000613          	li	a2,1024
80007472:	00064597          	auipc	a1,0x64
80007476:	4a258593          	addi	a1,a1,1186 # 8006b914 <d.284>
8000747a:	854a                	mv	a0,s2
8000747c:	f34f90ef          	jal	80000bb0 <memmove>
      return 1;
80007480:	4505                	li	a0,1
80007482:	cc5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007486:	40000613          	li	a2,1024
8000748a:	00065597          	auipc	a1,0x65
8000748e:	88a58593          	addi	a1,a1,-1910 # 8006bd14 <d.283>
80007492:	854a                	mv	a0,s2
80007494:	f1cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007498:	4505                	li	a0,1
8000749a:	cadfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000749e:	40000613          	li	a2,1024
800074a2:	00065597          	auipc	a1,0x65
800074a6:	c7258593          	addi	a1,a1,-910 # 8006c114 <d.282>
800074aa:	854a                	mv	a0,s2
800074ac:	f04f90ef          	jal	80000bb0 <memmove>
      return 1;
800074b0:	4505                	li	a0,1
800074b2:	c95fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800074b6:	40000613          	li	a2,1024
800074ba:	00065597          	auipc	a1,0x65
800074be:	05a58593          	addi	a1,a1,90 # 8006c514 <d.281>
800074c2:	854a                	mv	a0,s2
800074c4:	eecf90ef          	jal	80000bb0 <memmove>
      return 1;
800074c8:	4505                	li	a0,1
800074ca:	c7dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800074ce:	40000613          	li	a2,1024
800074d2:	00065597          	auipc	a1,0x65
800074d6:	44258593          	addi	a1,a1,1090 # 8006c914 <d.280>
800074da:	854a                	mv	a0,s2
800074dc:	ed4f90ef          	jal	80000bb0 <memmove>
      return 1;
800074e0:	4505                	li	a0,1
800074e2:	c65fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800074e6:	40000613          	li	a2,1024
800074ea:	00066597          	auipc	a1,0x66
800074ee:	82a58593          	addi	a1,a1,-2006 # 8006cd14 <d.279>
800074f2:	854a                	mv	a0,s2
800074f4:	ebcf90ef          	jal	80000bb0 <memmove>
      return 1;
800074f8:	4505                	li	a0,1
800074fa:	c4dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800074fe:	40000613          	li	a2,1024
80007502:	00066597          	auipc	a1,0x66
80007506:	c1258593          	addi	a1,a1,-1006 # 8006d114 <d.278>
8000750a:	854a                	mv	a0,s2
8000750c:	ea4f90ef          	jal	80000bb0 <memmove>
      return 1;
80007510:	4505                	li	a0,1
80007512:	c35fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007516:	40000613          	li	a2,1024
8000751a:	00066597          	auipc	a1,0x66
8000751e:	ffa58593          	addi	a1,a1,-6 # 8006d514 <d.277>
80007522:	854a                	mv	a0,s2
80007524:	e8cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007528:	4505                	li	a0,1
8000752a:	c1dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000752e:	40000613          	li	a2,1024
80007532:	00066597          	auipc	a1,0x66
80007536:	3e258593          	addi	a1,a1,994 # 8006d914 <d.276>
8000753a:	854a                	mv	a0,s2
8000753c:	e74f90ef          	jal	80000bb0 <memmove>
      return 1;
80007540:	4505                	li	a0,1
80007542:	c05fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007546:	40000613          	li	a2,1024
8000754a:	00066597          	auipc	a1,0x66
8000754e:	7ca58593          	addi	a1,a1,1994 # 8006dd14 <d.275>
80007552:	854a                	mv	a0,s2
80007554:	e5cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007558:	4505                	li	a0,1
8000755a:	bedfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000755e:	40000613          	li	a2,1024
80007562:	00067597          	auipc	a1,0x67
80007566:	bb258593          	addi	a1,a1,-1102 # 8006e114 <d.274>
8000756a:	854a                	mv	a0,s2
8000756c:	e44f90ef          	jal	80000bb0 <memmove>
      return 1;
80007570:	4505                	li	a0,1
80007572:	bd5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007576:	40000613          	li	a2,1024
8000757a:	00067597          	auipc	a1,0x67
8000757e:	f9a58593          	addi	a1,a1,-102 # 8006e514 <d.273>
80007582:	854a                	mv	a0,s2
80007584:	e2cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007588:	4505                	li	a0,1
8000758a:	bbdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000758e:	40000613          	li	a2,1024
80007592:	00067597          	auipc	a1,0x67
80007596:	38258593          	addi	a1,a1,898 # 8006e914 <d.272>
8000759a:	854a                	mv	a0,s2
8000759c:	e14f90ef          	jal	80000bb0 <memmove>
      return 1;
800075a0:	4505                	li	a0,1
800075a2:	ba5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800075a6:	40000613          	li	a2,1024
800075aa:	00067597          	auipc	a1,0x67
800075ae:	76a58593          	addi	a1,a1,1898 # 8006ed14 <d.271>
800075b2:	854a                	mv	a0,s2
800075b4:	dfcf90ef          	jal	80000bb0 <memmove>
      return 1;
800075b8:	4505                	li	a0,1
800075ba:	b8dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800075be:	40000613          	li	a2,1024
800075c2:	00068597          	auipc	a1,0x68
800075c6:	b5258593          	addi	a1,a1,-1198 # 8006f114 <d.270>
800075ca:	854a                	mv	a0,s2
800075cc:	de4f90ef          	jal	80000bb0 <memmove>
      return 1;
800075d0:	4505                	li	a0,1
800075d2:	b75fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800075d6:	40000613          	li	a2,1024
800075da:	00068597          	auipc	a1,0x68
800075de:	f3a58593          	addi	a1,a1,-198 # 8006f514 <d.269>
800075e2:	854a                	mv	a0,s2
800075e4:	dccf90ef          	jal	80000bb0 <memmove>
      return 1;
800075e8:	4505                	li	a0,1
800075ea:	b5dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800075ee:	40000613          	li	a2,1024
800075f2:	00068597          	auipc	a1,0x68
800075f6:	32258593          	addi	a1,a1,802 # 8006f914 <d.268>
800075fa:	854a                	mv	a0,s2
800075fc:	db4f90ef          	jal	80000bb0 <memmove>
      return 1;
80007600:	4505                	li	a0,1
80007602:	b45fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007606:	40000613          	li	a2,1024
8000760a:	00068597          	auipc	a1,0x68
8000760e:	70a58593          	addi	a1,a1,1802 # 8006fd14 <d.267>
80007612:	854a                	mv	a0,s2
80007614:	d9cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007618:	4505                	li	a0,1
8000761a:	b2dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000761e:	40000613          	li	a2,1024
80007622:	00069597          	auipc	a1,0x69
80007626:	af258593          	addi	a1,a1,-1294 # 80070114 <d.266>
8000762a:	854a                	mv	a0,s2
8000762c:	d84f90ef          	jal	80000bb0 <memmove>
      return 1;
80007630:	4505                	li	a0,1
80007632:	b15fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007636:	40000613          	li	a2,1024
8000763a:	00069597          	auipc	a1,0x69
8000763e:	eda58593          	addi	a1,a1,-294 # 80070514 <d.265>
80007642:	854a                	mv	a0,s2
80007644:	d6cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007648:	4505                	li	a0,1
8000764a:	afdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000764e:	40000613          	li	a2,1024
80007652:	00069597          	auipc	a1,0x69
80007656:	2c258593          	addi	a1,a1,706 # 80070914 <d.264>
8000765a:	854a                	mv	a0,s2
8000765c:	d54f90ef          	jal	80000bb0 <memmove>
      return 1;
80007660:	4505                	li	a0,1
80007662:	ae5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007666:	40000613          	li	a2,1024
8000766a:	00069597          	auipc	a1,0x69
8000766e:	6aa58593          	addi	a1,a1,1706 # 80070d14 <d.263>
80007672:	854a                	mv	a0,s2
80007674:	d3cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007678:	4505                	li	a0,1
8000767a:	acdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000767e:	40000613          	li	a2,1024
80007682:	0006a597          	auipc	a1,0x6a
80007686:	a9258593          	addi	a1,a1,-1390 # 80071114 <d.262>
8000768a:	854a                	mv	a0,s2
8000768c:	d24f90ef          	jal	80000bb0 <memmove>
      return 1;
80007690:	4505                	li	a0,1
80007692:	ab5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007696:	40000613          	li	a2,1024
8000769a:	0006a597          	auipc	a1,0x6a
8000769e:	e7a58593          	addi	a1,a1,-390 # 80071514 <d.261>
800076a2:	854a                	mv	a0,s2
800076a4:	d0cf90ef          	jal	80000bb0 <memmove>
      return 1;
800076a8:	4505                	li	a0,1
800076aa:	a9dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800076ae:	40000613          	li	a2,1024
800076b2:	0006a597          	auipc	a1,0x6a
800076b6:	26258593          	addi	a1,a1,610 # 80071914 <d.260>
800076ba:	854a                	mv	a0,s2
800076bc:	cf4f90ef          	jal	80000bb0 <memmove>
      return 1;
800076c0:	4505                	li	a0,1
800076c2:	a85fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800076c6:	40000613          	li	a2,1024
800076ca:	0006a597          	auipc	a1,0x6a
800076ce:	64a58593          	addi	a1,a1,1610 # 80071d14 <d.259>
800076d2:	854a                	mv	a0,s2
800076d4:	cdcf90ef          	jal	80000bb0 <memmove>
      return 1;
800076d8:	4505                	li	a0,1
800076da:	a6dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800076de:	40000613          	li	a2,1024
800076e2:	0006b597          	auipc	a1,0x6b
800076e6:	a3258593          	addi	a1,a1,-1486 # 80072114 <d.258>
800076ea:	854a                	mv	a0,s2
800076ec:	cc4f90ef          	jal	80000bb0 <memmove>
      return 1;
800076f0:	4505                	li	a0,1
800076f2:	a55fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800076f6:	40000613          	li	a2,1024
800076fa:	0006b597          	auipc	a1,0x6b
800076fe:	e1a58593          	addi	a1,a1,-486 # 80072514 <d.257>
80007702:	854a                	mv	a0,s2
80007704:	cacf90ef          	jal	80000bb0 <memmove>
      return 1;
80007708:	4505                	li	a0,1
8000770a:	a3dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000770e:	40000613          	li	a2,1024
80007712:	0006b597          	auipc	a1,0x6b
80007716:	20258593          	addi	a1,a1,514 # 80072914 <d.256>
8000771a:	854a                	mv	a0,s2
8000771c:	c94f90ef          	jal	80000bb0 <memmove>
      return 1;
80007720:	4505                	li	a0,1
80007722:	a25fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007726:	40000613          	li	a2,1024
8000772a:	0006b597          	auipc	a1,0x6b
8000772e:	5ea58593          	addi	a1,a1,1514 # 80072d14 <d.255>
80007732:	854a                	mv	a0,s2
80007734:	c7cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007738:	4505                	li	a0,1
8000773a:	a0dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000773e:	40000613          	li	a2,1024
80007742:	0006c597          	auipc	a1,0x6c
80007746:	9d258593          	addi	a1,a1,-1582 # 80073114 <d.254>
8000774a:	854a                	mv	a0,s2
8000774c:	c64f90ef          	jal	80000bb0 <memmove>
      return 1;
80007750:	4505                	li	a0,1
80007752:	9f5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007756:	40000613          	li	a2,1024
8000775a:	0006c597          	auipc	a1,0x6c
8000775e:	dba58593          	addi	a1,a1,-582 # 80073514 <d.253>
80007762:	854a                	mv	a0,s2
80007764:	c4cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007768:	4505                	li	a0,1
8000776a:	9ddfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000776e:	40000613          	li	a2,1024
80007772:	0006c597          	auipc	a1,0x6c
80007776:	1a258593          	addi	a1,a1,418 # 80073914 <d.252>
8000777a:	854a                	mv	a0,s2
8000777c:	c34f90ef          	jal	80000bb0 <memmove>
      return 1;
80007780:	4505                	li	a0,1
80007782:	9c5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007786:	40000613          	li	a2,1024
8000778a:	0006c597          	auipc	a1,0x6c
8000778e:	58a58593          	addi	a1,a1,1418 # 80073d14 <d.251>
80007792:	854a                	mv	a0,s2
80007794:	c1cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007798:	4505                	li	a0,1
8000779a:	9adfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000779e:	40000613          	li	a2,1024
800077a2:	0006d597          	auipc	a1,0x6d
800077a6:	97258593          	addi	a1,a1,-1678 # 80074114 <d.250>
800077aa:	854a                	mv	a0,s2
800077ac:	c04f90ef          	jal	80000bb0 <memmove>
      return 1;
800077b0:	4505                	li	a0,1
800077b2:	995fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800077b6:	40000613          	li	a2,1024
800077ba:	0006d597          	auipc	a1,0x6d
800077be:	d5a58593          	addi	a1,a1,-678 # 80074514 <d.249>
800077c2:	854a                	mv	a0,s2
800077c4:	becf90ef          	jal	80000bb0 <memmove>
      return 1;
800077c8:	4505                	li	a0,1
800077ca:	97dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800077ce:	40000613          	li	a2,1024
800077d2:	0006d597          	auipc	a1,0x6d
800077d6:	14258593          	addi	a1,a1,322 # 80074914 <d.248>
800077da:	854a                	mv	a0,s2
800077dc:	bd4f90ef          	jal	80000bb0 <memmove>
      return 1;
800077e0:	4505                	li	a0,1
800077e2:	965fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800077e6:	40000613          	li	a2,1024
800077ea:	0006d597          	auipc	a1,0x6d
800077ee:	52a58593          	addi	a1,a1,1322 # 80074d14 <d.247>
800077f2:	854a                	mv	a0,s2
800077f4:	bbcf90ef          	jal	80000bb0 <memmove>
      return 1;
800077f8:	4505                	li	a0,1
800077fa:	94dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800077fe:	40000613          	li	a2,1024
80007802:	0006e597          	auipc	a1,0x6e
80007806:	91258593          	addi	a1,a1,-1774 # 80075114 <d.246>
8000780a:	854a                	mv	a0,s2
8000780c:	ba4f90ef          	jal	80000bb0 <memmove>
      return 1;
80007810:	4505                	li	a0,1
80007812:	935fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007816:	40000613          	li	a2,1024
8000781a:	0006e597          	auipc	a1,0x6e
8000781e:	cfa58593          	addi	a1,a1,-774 # 80075514 <d.245>
80007822:	854a                	mv	a0,s2
80007824:	b8cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007828:	4505                	li	a0,1
8000782a:	91dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000782e:	40000613          	li	a2,1024
80007832:	0006e597          	auipc	a1,0x6e
80007836:	0e258593          	addi	a1,a1,226 # 80075914 <d.244>
8000783a:	854a                	mv	a0,s2
8000783c:	b74f90ef          	jal	80000bb0 <memmove>
      return 1;
80007840:	4505                	li	a0,1
80007842:	905fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007846:	40000613          	li	a2,1024
8000784a:	0006e597          	auipc	a1,0x6e
8000784e:	4ca58593          	addi	a1,a1,1226 # 80075d14 <d.243>
80007852:	854a                	mv	a0,s2
80007854:	b5cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007858:	4505                	li	a0,1
8000785a:	8edfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000785e:	40000613          	li	a2,1024
80007862:	0006f597          	auipc	a1,0x6f
80007866:	8b258593          	addi	a1,a1,-1870 # 80076114 <d.242>
8000786a:	854a                	mv	a0,s2
8000786c:	b44f90ef          	jal	80000bb0 <memmove>
      return 1;
80007870:	4505                	li	a0,1
80007872:	8d5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007876:	40000613          	li	a2,1024
8000787a:	0006f597          	auipc	a1,0x6f
8000787e:	c9a58593          	addi	a1,a1,-870 # 80076514 <d.241>
80007882:	854a                	mv	a0,s2
80007884:	b2cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007888:	4505                	li	a0,1
8000788a:	8bdfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000788e:	40000613          	li	a2,1024
80007892:	0006f597          	auipc	a1,0x6f
80007896:	08258593          	addi	a1,a1,130 # 80076914 <d.240>
8000789a:	854a                	mv	a0,s2
8000789c:	b14f90ef          	jal	80000bb0 <memmove>
      return 1;
800078a0:	4505                	li	a0,1
800078a2:	8a5fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800078a6:	40000613          	li	a2,1024
800078aa:	0006f597          	auipc	a1,0x6f
800078ae:	46a58593          	addi	a1,a1,1130 # 80076d14 <d.239>
800078b2:	854a                	mv	a0,s2
800078b4:	afcf90ef          	jal	80000bb0 <memmove>
      return 1;
800078b8:	4505                	li	a0,1
800078ba:	88dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800078be:	40000613          	li	a2,1024
800078c2:	00070597          	auipc	a1,0x70
800078c6:	85258593          	addi	a1,a1,-1966 # 80077114 <d.238>
800078ca:	854a                	mv	a0,s2
800078cc:	ae4f90ef          	jal	80000bb0 <memmove>
      return 1;
800078d0:	4505                	li	a0,1
800078d2:	875fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800078d6:	40000613          	li	a2,1024
800078da:	00070597          	auipc	a1,0x70
800078de:	c3a58593          	addi	a1,a1,-966 # 80077514 <d.237>
800078e2:	854a                	mv	a0,s2
800078e4:	accf90ef          	jal	80000bb0 <memmove>
      return 1;
800078e8:	4505                	li	a0,1
800078ea:	85dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800078ee:	40000613          	li	a2,1024
800078f2:	00070597          	auipc	a1,0x70
800078f6:	02258593          	addi	a1,a1,34 # 80077914 <d.236>
800078fa:	854a                	mv	a0,s2
800078fc:	ab4f90ef          	jal	80000bb0 <memmove>
      return 1;
80007900:	4505                	li	a0,1
80007902:	845fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007906:	40000613          	li	a2,1024
8000790a:	00070597          	auipc	a1,0x70
8000790e:	40a58593          	addi	a1,a1,1034 # 80077d14 <d.235>
80007912:	854a                	mv	a0,s2
80007914:	a9cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007918:	4505                	li	a0,1
8000791a:	82dfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000791e:	40000613          	li	a2,1024
80007922:	00070597          	auipc	a1,0x70
80007926:	7f258593          	addi	a1,a1,2034 # 80078114 <d.234>
8000792a:	854a                	mv	a0,s2
8000792c:	a84f90ef          	jal	80000bb0 <memmove>
      return 1;
80007930:	4505                	li	a0,1
80007932:	815fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007936:	40000613          	li	a2,1024
8000793a:	00071597          	auipc	a1,0x71
8000793e:	bda58593          	addi	a1,a1,-1062 # 80078514 <d.233>
80007942:	854a                	mv	a0,s2
80007944:	a6cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007948:	4505                	li	a0,1
8000794a:	ffcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000794e:	40000613          	li	a2,1024
80007952:	00071597          	auipc	a1,0x71
80007956:	fc258593          	addi	a1,a1,-62 # 80078914 <d.232>
8000795a:	854a                	mv	a0,s2
8000795c:	a54f90ef          	jal	80000bb0 <memmove>
      return 1;
80007960:	4505                	li	a0,1
80007962:	fe4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007966:	40000613          	li	a2,1024
8000796a:	00071597          	auipc	a1,0x71
8000796e:	3aa58593          	addi	a1,a1,938 # 80078d14 <d.231>
80007972:	854a                	mv	a0,s2
80007974:	a3cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007978:	4505                	li	a0,1
8000797a:	fccfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000797e:	40000613          	li	a2,1024
80007982:	00071597          	auipc	a1,0x71
80007986:	79258593          	addi	a1,a1,1938 # 80079114 <d.230>
8000798a:	854a                	mv	a0,s2
8000798c:	a24f90ef          	jal	80000bb0 <memmove>
      return 1;
80007990:	4505                	li	a0,1
80007992:	fb4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007996:	40000613          	li	a2,1024
8000799a:	00072597          	auipc	a1,0x72
8000799e:	b7a58593          	addi	a1,a1,-1158 # 80079514 <d.229>
800079a2:	854a                	mv	a0,s2
800079a4:	a0cf90ef          	jal	80000bb0 <memmove>
      return 1;
800079a8:	4505                	li	a0,1
800079aa:	f9cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800079ae:	40000613          	li	a2,1024
800079b2:	00072597          	auipc	a1,0x72
800079b6:	f6258593          	addi	a1,a1,-158 # 80079914 <d.228>
800079ba:	854a                	mv	a0,s2
800079bc:	9f4f90ef          	jal	80000bb0 <memmove>
      return 1;
800079c0:	4505                	li	a0,1
800079c2:	f84fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800079c6:	40000613          	li	a2,1024
800079ca:	00072597          	auipc	a1,0x72
800079ce:	34a58593          	addi	a1,a1,842 # 80079d14 <d.227>
800079d2:	854a                	mv	a0,s2
800079d4:	9dcf90ef          	jal	80000bb0 <memmove>
      return 1;
800079d8:	4505                	li	a0,1
800079da:	f6cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800079de:	40000613          	li	a2,1024
800079e2:	00072597          	auipc	a1,0x72
800079e6:	73258593          	addi	a1,a1,1842 # 8007a114 <d.226>
800079ea:	854a                	mv	a0,s2
800079ec:	9c4f90ef          	jal	80000bb0 <memmove>
      return 1;
800079f0:	4505                	li	a0,1
800079f2:	f54fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800079f6:	40000613          	li	a2,1024
800079fa:	00073597          	auipc	a1,0x73
800079fe:	b1a58593          	addi	a1,a1,-1254 # 8007a514 <d.225>
80007a02:	854a                	mv	a0,s2
80007a04:	9acf90ef          	jal	80000bb0 <memmove>
      return 1;
80007a08:	4505                	li	a0,1
80007a0a:	f3cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a0e:	40000613          	li	a2,1024
80007a12:	00073597          	auipc	a1,0x73
80007a16:	f0258593          	addi	a1,a1,-254 # 8007a914 <d.224>
80007a1a:	854a                	mv	a0,s2
80007a1c:	994f90ef          	jal	80000bb0 <memmove>
      return 1;
80007a20:	4505                	li	a0,1
80007a22:	f24fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a26:	40000613          	li	a2,1024
80007a2a:	00073597          	auipc	a1,0x73
80007a2e:	2ea58593          	addi	a1,a1,746 # 8007ad14 <d.223>
80007a32:	854a                	mv	a0,s2
80007a34:	97cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007a38:	4505                	li	a0,1
80007a3a:	f0cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a3e:	40000613          	li	a2,1024
80007a42:	00073597          	auipc	a1,0x73
80007a46:	6d258593          	addi	a1,a1,1746 # 8007b114 <d.222>
80007a4a:	854a                	mv	a0,s2
80007a4c:	964f90ef          	jal	80000bb0 <memmove>
      return 1;
80007a50:	4505                	li	a0,1
80007a52:	ef4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a56:	40000613          	li	a2,1024
80007a5a:	00074597          	auipc	a1,0x74
80007a5e:	aba58593          	addi	a1,a1,-1350 # 8007b514 <d.221>
80007a62:	854a                	mv	a0,s2
80007a64:	94cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007a68:	4505                	li	a0,1
80007a6a:	edcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a6e:	40000613          	li	a2,1024
80007a72:	00074597          	auipc	a1,0x74
80007a76:	ea258593          	addi	a1,a1,-350 # 8007b914 <d.220>
80007a7a:	854a                	mv	a0,s2
80007a7c:	934f90ef          	jal	80000bb0 <memmove>
      return 1;
80007a80:	4505                	li	a0,1
80007a82:	ec4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a86:	40000613          	li	a2,1024
80007a8a:	00074597          	auipc	a1,0x74
80007a8e:	28a58593          	addi	a1,a1,650 # 8007bd14 <d.219>
80007a92:	854a                	mv	a0,s2
80007a94:	91cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007a98:	4505                	li	a0,1
80007a9a:	eacfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007a9e:	40000613          	li	a2,1024
80007aa2:	00074597          	auipc	a1,0x74
80007aa6:	67258593          	addi	a1,a1,1650 # 8007c114 <d.218>
80007aaa:	854a                	mv	a0,s2
80007aac:	904f90ef          	jal	80000bb0 <memmove>
      return 1;
80007ab0:	4505                	li	a0,1
80007ab2:	e94fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ab6:	40000613          	li	a2,1024
80007aba:	00075597          	auipc	a1,0x75
80007abe:	a5a58593          	addi	a1,a1,-1446 # 8007c514 <d.217>
80007ac2:	854a                	mv	a0,s2
80007ac4:	8ecf90ef          	jal	80000bb0 <memmove>
      return 1;
80007ac8:	4505                	li	a0,1
80007aca:	e7cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ace:	40000613          	li	a2,1024
80007ad2:	00075597          	auipc	a1,0x75
80007ad6:	e4258593          	addi	a1,a1,-446 # 8007c914 <d.216>
80007ada:	854a                	mv	a0,s2
80007adc:	8d4f90ef          	jal	80000bb0 <memmove>
      return 1;
80007ae0:	4505                	li	a0,1
80007ae2:	e64fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ae6:	40000613          	li	a2,1024
80007aea:	00075597          	auipc	a1,0x75
80007aee:	22a58593          	addi	a1,a1,554 # 8007cd14 <d.215>
80007af2:	854a                	mv	a0,s2
80007af4:	8bcf90ef          	jal	80000bb0 <memmove>
      return 1;
80007af8:	4505                	li	a0,1
80007afa:	e4cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007afe:	40000613          	li	a2,1024
80007b02:	00075597          	auipc	a1,0x75
80007b06:	61258593          	addi	a1,a1,1554 # 8007d114 <d.214>
80007b0a:	854a                	mv	a0,s2
80007b0c:	8a4f90ef          	jal	80000bb0 <memmove>
      return 1;
80007b10:	4505                	li	a0,1
80007b12:	e34fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007b16:	40000613          	li	a2,1024
80007b1a:	00076597          	auipc	a1,0x76
80007b1e:	9fa58593          	addi	a1,a1,-1542 # 8007d514 <d.213>
80007b22:	854a                	mv	a0,s2
80007b24:	88cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007b28:	4505                	li	a0,1
80007b2a:	e1cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007b2e:	40000613          	li	a2,1024
80007b32:	00076597          	auipc	a1,0x76
80007b36:	de258593          	addi	a1,a1,-542 # 8007d914 <d.212>
80007b3a:	854a                	mv	a0,s2
80007b3c:	874f90ef          	jal	80000bb0 <memmove>
      return 1;
80007b40:	4505                	li	a0,1
80007b42:	e04fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007b46:	40000613          	li	a2,1024
80007b4a:	00076597          	auipc	a1,0x76
80007b4e:	1ca58593          	addi	a1,a1,458 # 8007dd14 <d.211>
80007b52:	854a                	mv	a0,s2
80007b54:	85cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007b58:	4505                	li	a0,1
80007b5a:	decfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007b5e:	40000613          	li	a2,1024
80007b62:	00076597          	auipc	a1,0x76
80007b66:	5b258593          	addi	a1,a1,1458 # 8007e114 <d.210>
80007b6a:	854a                	mv	a0,s2
80007b6c:	844f90ef          	jal	80000bb0 <memmove>
      return 1;
80007b70:	4505                	li	a0,1
80007b72:	dd4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007b76:	40000613          	li	a2,1024
80007b7a:	00077597          	auipc	a1,0x77
80007b7e:	99a58593          	addi	a1,a1,-1638 # 8007e514 <d.209>
80007b82:	854a                	mv	a0,s2
80007b84:	82cf90ef          	jal	80000bb0 <memmove>
      return 1;
80007b88:	4505                	li	a0,1
80007b8a:	dbcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007b8e:	40000613          	li	a2,1024
80007b92:	00077597          	auipc	a1,0x77
80007b96:	d8258593          	addi	a1,a1,-638 # 8007e914 <d.208>
80007b9a:	854a                	mv	a0,s2
80007b9c:	814f90ef          	jal	80000bb0 <memmove>
      return 1;
80007ba0:	4505                	li	a0,1
80007ba2:	da4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ba6:	40000613          	li	a2,1024
80007baa:	00077597          	auipc	a1,0x77
80007bae:	16a58593          	addi	a1,a1,362 # 8007ed14 <d.207>
80007bb2:	854a                	mv	a0,s2
80007bb4:	ffdf80ef          	jal	80000bb0 <memmove>
      return 1;
80007bb8:	4505                	li	a0,1
80007bba:	d8cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007bbe:	40000613          	li	a2,1024
80007bc2:	00077597          	auipc	a1,0x77
80007bc6:	55258593          	addi	a1,a1,1362 # 8007f114 <d.206>
80007bca:	854a                	mv	a0,s2
80007bcc:	fe5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007bd0:	4505                	li	a0,1
80007bd2:	d74fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007bd6:	40000613          	li	a2,1024
80007bda:	00078597          	auipc	a1,0x78
80007bde:	93a58593          	addi	a1,a1,-1734 # 8007f514 <d.205>
80007be2:	854a                	mv	a0,s2
80007be4:	fcdf80ef          	jal	80000bb0 <memmove>
      return 1;
80007be8:	4505                	li	a0,1
80007bea:	d5cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007bee:	40000613          	li	a2,1024
80007bf2:	00078597          	auipc	a1,0x78
80007bf6:	d2258593          	addi	a1,a1,-734 # 8007f914 <d.204>
80007bfa:	854a                	mv	a0,s2
80007bfc:	fb5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007c00:	4505                	li	a0,1
80007c02:	d44fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c06:	40000613          	li	a2,1024
80007c0a:	00078597          	auipc	a1,0x78
80007c0e:	10a58593          	addi	a1,a1,266 # 8007fd14 <d.203>
80007c12:	854a                	mv	a0,s2
80007c14:	f9df80ef          	jal	80000bb0 <memmove>
      return 1;
80007c18:	4505                	li	a0,1
80007c1a:	d2cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c1e:	40000613          	li	a2,1024
80007c22:	00078597          	auipc	a1,0x78
80007c26:	4f258593          	addi	a1,a1,1266 # 80080114 <d.202>
80007c2a:	854a                	mv	a0,s2
80007c2c:	f85f80ef          	jal	80000bb0 <memmove>
      return 1;
80007c30:	4505                	li	a0,1
80007c32:	d14fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c36:	40000613          	li	a2,1024
80007c3a:	00079597          	auipc	a1,0x79
80007c3e:	8da58593          	addi	a1,a1,-1830 # 80080514 <d.201>
80007c42:	854a                	mv	a0,s2
80007c44:	f6df80ef          	jal	80000bb0 <memmove>
      return 1;
80007c48:	4505                	li	a0,1
80007c4a:	cfcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c4e:	40000613          	li	a2,1024
80007c52:	00079597          	auipc	a1,0x79
80007c56:	cc258593          	addi	a1,a1,-830 # 80080914 <d.200>
80007c5a:	854a                	mv	a0,s2
80007c5c:	f55f80ef          	jal	80000bb0 <memmove>
      return 1;
80007c60:	4505                	li	a0,1
80007c62:	ce4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c66:	40000613          	li	a2,1024
80007c6a:	00079597          	auipc	a1,0x79
80007c6e:	0aa58593          	addi	a1,a1,170 # 80080d14 <d.199>
80007c72:	854a                	mv	a0,s2
80007c74:	f3df80ef          	jal	80000bb0 <memmove>
      return 1;
80007c78:	4505                	li	a0,1
80007c7a:	cccfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c7e:	40000613          	li	a2,1024
80007c82:	00079597          	auipc	a1,0x79
80007c86:	49258593          	addi	a1,a1,1170 # 80081114 <d.198>
80007c8a:	854a                	mv	a0,s2
80007c8c:	f25f80ef          	jal	80000bb0 <memmove>
      return 1;
80007c90:	4505                	li	a0,1
80007c92:	cb4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007c96:	40000613          	li	a2,1024
80007c9a:	0007a597          	auipc	a1,0x7a
80007c9e:	87a58593          	addi	a1,a1,-1926 # 80081514 <d.197>
80007ca2:	854a                	mv	a0,s2
80007ca4:	f0df80ef          	jal	80000bb0 <memmove>
      return 1;
80007ca8:	4505                	li	a0,1
80007caa:	c9cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007cae:	40000613          	li	a2,1024
80007cb2:	0007a597          	auipc	a1,0x7a
80007cb6:	c6258593          	addi	a1,a1,-926 # 80081914 <d.196>
80007cba:	854a                	mv	a0,s2
80007cbc:	ef5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007cc0:	4505                	li	a0,1
80007cc2:	c84fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007cc6:	40000613          	li	a2,1024
80007cca:	0007a597          	auipc	a1,0x7a
80007cce:	04a58593          	addi	a1,a1,74 # 80081d14 <d.195>
80007cd2:	854a                	mv	a0,s2
80007cd4:	eddf80ef          	jal	80000bb0 <memmove>
      return 1;
80007cd8:	4505                	li	a0,1
80007cda:	c6cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007cde:	40000613          	li	a2,1024
80007ce2:	0007a597          	auipc	a1,0x7a
80007ce6:	43258593          	addi	a1,a1,1074 # 80082114 <d.194>
80007cea:	854a                	mv	a0,s2
80007cec:	ec5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007cf0:	4505                	li	a0,1
80007cf2:	c54fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007cf6:	40000613          	li	a2,1024
80007cfa:	0007b597          	auipc	a1,0x7b
80007cfe:	81a58593          	addi	a1,a1,-2022 # 80082514 <d.193>
80007d02:	854a                	mv	a0,s2
80007d04:	eadf80ef          	jal	80000bb0 <memmove>
      return 1;
80007d08:	4505                	li	a0,1
80007d0a:	c3cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d0e:	40000613          	li	a2,1024
80007d12:	0007b597          	auipc	a1,0x7b
80007d16:	c0258593          	addi	a1,a1,-1022 # 80082914 <d.192>
80007d1a:	854a                	mv	a0,s2
80007d1c:	e95f80ef          	jal	80000bb0 <memmove>
      return 1;
80007d20:	4505                	li	a0,1
80007d22:	c24fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d26:	40000613          	li	a2,1024
80007d2a:	0007b597          	auipc	a1,0x7b
80007d2e:	fea58593          	addi	a1,a1,-22 # 80082d14 <d.191>
80007d32:	854a                	mv	a0,s2
80007d34:	e7df80ef          	jal	80000bb0 <memmove>
      return 1;
80007d38:	4505                	li	a0,1
80007d3a:	c0cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d3e:	40000613          	li	a2,1024
80007d42:	0007b597          	auipc	a1,0x7b
80007d46:	3d258593          	addi	a1,a1,978 # 80083114 <d.190>
80007d4a:	854a                	mv	a0,s2
80007d4c:	e65f80ef          	jal	80000bb0 <memmove>
      return 1;
80007d50:	4505                	li	a0,1
80007d52:	bf4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d56:	40000613          	li	a2,1024
80007d5a:	0007b597          	auipc	a1,0x7b
80007d5e:	7ba58593          	addi	a1,a1,1978 # 80083514 <d.189>
80007d62:	854a                	mv	a0,s2
80007d64:	e4df80ef          	jal	80000bb0 <memmove>
      return 1;
80007d68:	4505                	li	a0,1
80007d6a:	bdcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d6e:	40000613          	li	a2,1024
80007d72:	0007c597          	auipc	a1,0x7c
80007d76:	ba258593          	addi	a1,a1,-1118 # 80083914 <d.188>
80007d7a:	854a                	mv	a0,s2
80007d7c:	e35f80ef          	jal	80000bb0 <memmove>
      return 1;
80007d80:	4505                	li	a0,1
80007d82:	bc4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d86:	40000613          	li	a2,1024
80007d8a:	0007c597          	auipc	a1,0x7c
80007d8e:	f8a58593          	addi	a1,a1,-118 # 80083d14 <d.187>
80007d92:	854a                	mv	a0,s2
80007d94:	e1df80ef          	jal	80000bb0 <memmove>
      return 1;
80007d98:	4505                	li	a0,1
80007d9a:	bacfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007d9e:	40000613          	li	a2,1024
80007da2:	0007c597          	auipc	a1,0x7c
80007da6:	37258593          	addi	a1,a1,882 # 80084114 <d.186>
80007daa:	854a                	mv	a0,s2
80007dac:	e05f80ef          	jal	80000bb0 <memmove>
      return 1;
80007db0:	4505                	li	a0,1
80007db2:	b94fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007db6:	40000613          	li	a2,1024
80007dba:	0007c597          	auipc	a1,0x7c
80007dbe:	75a58593          	addi	a1,a1,1882 # 80084514 <d.185>
80007dc2:	854a                	mv	a0,s2
80007dc4:	dedf80ef          	jal	80000bb0 <memmove>
      return 1;
80007dc8:	4505                	li	a0,1
80007dca:	b7cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007dce:	40000613          	li	a2,1024
80007dd2:	0007d597          	auipc	a1,0x7d
80007dd6:	b4258593          	addi	a1,a1,-1214 # 80084914 <d.184>
80007dda:	854a                	mv	a0,s2
80007ddc:	dd5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007de0:	4505                	li	a0,1
80007de2:	b64fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007de6:	40000613          	li	a2,1024
80007dea:	0007d597          	auipc	a1,0x7d
80007dee:	f2a58593          	addi	a1,a1,-214 # 80084d14 <d.183>
80007df2:	854a                	mv	a0,s2
80007df4:	dbdf80ef          	jal	80000bb0 <memmove>
      return 1;
80007df8:	4505                	li	a0,1
80007dfa:	b4cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007dfe:	40000613          	li	a2,1024
80007e02:	0007d597          	auipc	a1,0x7d
80007e06:	31258593          	addi	a1,a1,786 # 80085114 <d.182>
80007e0a:	854a                	mv	a0,s2
80007e0c:	da5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007e10:	4505                	li	a0,1
80007e12:	b34fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007e16:	40000613          	li	a2,1024
80007e1a:	0007d597          	auipc	a1,0x7d
80007e1e:	6fa58593          	addi	a1,a1,1786 # 80085514 <d.181>
80007e22:	854a                	mv	a0,s2
80007e24:	d8df80ef          	jal	80000bb0 <memmove>
      return 1;
80007e28:	4505                	li	a0,1
80007e2a:	b1cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007e2e:	40000613          	li	a2,1024
80007e32:	0007e597          	auipc	a1,0x7e
80007e36:	ae258593          	addi	a1,a1,-1310 # 80085914 <d.180>
80007e3a:	854a                	mv	a0,s2
80007e3c:	d75f80ef          	jal	80000bb0 <memmove>
      return 1;
80007e40:	4505                	li	a0,1
80007e42:	b04fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007e46:	40000613          	li	a2,1024
80007e4a:	0007e597          	auipc	a1,0x7e
80007e4e:	eca58593          	addi	a1,a1,-310 # 80085d14 <d.179>
80007e52:	854a                	mv	a0,s2
80007e54:	d5df80ef          	jal	80000bb0 <memmove>
      return 1;
80007e58:	4505                	li	a0,1
80007e5a:	aecfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007e5e:	40000613          	li	a2,1024
80007e62:	0007e597          	auipc	a1,0x7e
80007e66:	2b258593          	addi	a1,a1,690 # 80086114 <d.178>
80007e6a:	854a                	mv	a0,s2
80007e6c:	d45f80ef          	jal	80000bb0 <memmove>
      return 1;
80007e70:	4505                	li	a0,1
80007e72:	ad4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007e76:	40000613          	li	a2,1024
80007e7a:	0007e597          	auipc	a1,0x7e
80007e7e:	69a58593          	addi	a1,a1,1690 # 80086514 <d.177>
80007e82:	854a                	mv	a0,s2
80007e84:	d2df80ef          	jal	80000bb0 <memmove>
      return 1;
80007e88:	4505                	li	a0,1
80007e8a:	abcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007e8e:	40000613          	li	a2,1024
80007e92:	0007f597          	auipc	a1,0x7f
80007e96:	a8258593          	addi	a1,a1,-1406 # 80086914 <d.176>
80007e9a:	854a                	mv	a0,s2
80007e9c:	d15f80ef          	jal	80000bb0 <memmove>
      return 1;
80007ea0:	4505                	li	a0,1
80007ea2:	aa4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ea6:	40000613          	li	a2,1024
80007eaa:	0007f597          	auipc	a1,0x7f
80007eae:	e6a58593          	addi	a1,a1,-406 # 80086d14 <d.175>
80007eb2:	854a                	mv	a0,s2
80007eb4:	cfdf80ef          	jal	80000bb0 <memmove>
      return 1;
80007eb8:	4505                	li	a0,1
80007eba:	a8cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ebe:	40000613          	li	a2,1024
80007ec2:	0007f597          	auipc	a1,0x7f
80007ec6:	25258593          	addi	a1,a1,594 # 80087114 <d.174>
80007eca:	854a                	mv	a0,s2
80007ecc:	ce5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007ed0:	4505                	li	a0,1
80007ed2:	a74fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ed6:	40000613          	li	a2,1024
80007eda:	0007f597          	auipc	a1,0x7f
80007ede:	63a58593          	addi	a1,a1,1594 # 80087514 <d.173>
80007ee2:	854a                	mv	a0,s2
80007ee4:	ccdf80ef          	jal	80000bb0 <memmove>
      return 1;
80007ee8:	4505                	li	a0,1
80007eea:	a5cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007eee:	40000613          	li	a2,1024
80007ef2:	00080597          	auipc	a1,0x80
80007ef6:	a2258593          	addi	a1,a1,-1502 # 80087914 <d.172>
80007efa:	854a                	mv	a0,s2
80007efc:	cb5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007f00:	4505                	li	a0,1
80007f02:	a44fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f06:	40000613          	li	a2,1024
80007f0a:	00080597          	auipc	a1,0x80
80007f0e:	e0a58593          	addi	a1,a1,-502 # 80087d14 <d.171>
80007f12:	854a                	mv	a0,s2
80007f14:	c9df80ef          	jal	80000bb0 <memmove>
      return 1;
80007f18:	4505                	li	a0,1
80007f1a:	a2cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f1e:	40000613          	li	a2,1024
80007f22:	00080597          	auipc	a1,0x80
80007f26:	1f258593          	addi	a1,a1,498 # 80088114 <d.170>
80007f2a:	854a                	mv	a0,s2
80007f2c:	c85f80ef          	jal	80000bb0 <memmove>
      return 1;
80007f30:	4505                	li	a0,1
80007f32:	a14fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f36:	40000613          	li	a2,1024
80007f3a:	00080597          	auipc	a1,0x80
80007f3e:	5da58593          	addi	a1,a1,1498 # 80088514 <d.169>
80007f42:	854a                	mv	a0,s2
80007f44:	c6df80ef          	jal	80000bb0 <memmove>
      return 1;
80007f48:	4505                	li	a0,1
80007f4a:	9fcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f4e:	40000613          	li	a2,1024
80007f52:	00081597          	auipc	a1,0x81
80007f56:	9c258593          	addi	a1,a1,-1598 # 80088914 <d.168>
80007f5a:	854a                	mv	a0,s2
80007f5c:	c55f80ef          	jal	80000bb0 <memmove>
      return 1;
80007f60:	4505                	li	a0,1
80007f62:	9e4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f66:	40000613          	li	a2,1024
80007f6a:	00081597          	auipc	a1,0x81
80007f6e:	daa58593          	addi	a1,a1,-598 # 80088d14 <d.167>
80007f72:	854a                	mv	a0,s2
80007f74:	c3df80ef          	jal	80000bb0 <memmove>
      return 1;
80007f78:	4505                	li	a0,1
80007f7a:	9ccfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f7e:	40000613          	li	a2,1024
80007f82:	00081597          	auipc	a1,0x81
80007f86:	19258593          	addi	a1,a1,402 # 80089114 <d.166>
80007f8a:	854a                	mv	a0,s2
80007f8c:	c25f80ef          	jal	80000bb0 <memmove>
      return 1;
80007f90:	4505                	li	a0,1
80007f92:	9b4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007f96:	40000613          	li	a2,1024
80007f9a:	00081597          	auipc	a1,0x81
80007f9e:	57a58593          	addi	a1,a1,1402 # 80089514 <d.165>
80007fa2:	854a                	mv	a0,s2
80007fa4:	c0df80ef          	jal	80000bb0 <memmove>
      return 1;
80007fa8:	4505                	li	a0,1
80007faa:	99cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007fae:	40000613          	li	a2,1024
80007fb2:	00082597          	auipc	a1,0x82
80007fb6:	96258593          	addi	a1,a1,-1694 # 80089914 <d.164>
80007fba:	854a                	mv	a0,s2
80007fbc:	bf5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007fc0:	4505                	li	a0,1
80007fc2:	984fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007fc6:	40000613          	li	a2,1024
80007fca:	00082597          	auipc	a1,0x82
80007fce:	d4a58593          	addi	a1,a1,-694 # 80089d14 <d.163>
80007fd2:	854a                	mv	a0,s2
80007fd4:	bddf80ef          	jal	80000bb0 <memmove>
      return 1;
80007fd8:	4505                	li	a0,1
80007fda:	96cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007fde:	40000613          	li	a2,1024
80007fe2:	00082597          	auipc	a1,0x82
80007fe6:	13258593          	addi	a1,a1,306 # 8008a114 <d.162>
80007fea:	854a                	mv	a0,s2
80007fec:	bc5f80ef          	jal	80000bb0 <memmove>
      return 1;
80007ff0:	4505                	li	a0,1
80007ff2:	954fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80007ff6:	40000613          	li	a2,1024
80007ffa:	00082597          	auipc	a1,0x82
80007ffe:	51a58593          	addi	a1,a1,1306 # 8008a514 <d.161>
80008002:	854a                	mv	a0,s2
80008004:	badf80ef          	jal	80000bb0 <memmove>
      return 1;
80008008:	4505                	li	a0,1
8000800a:	93cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000800e:	40000613          	li	a2,1024
80008012:	00083597          	auipc	a1,0x83
80008016:	90258593          	addi	a1,a1,-1790 # 8008a914 <d.160>
8000801a:	854a                	mv	a0,s2
8000801c:	b95f80ef          	jal	80000bb0 <memmove>
      return 1;
80008020:	4505                	li	a0,1
80008022:	924fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008026:	40000613          	li	a2,1024
8000802a:	00083597          	auipc	a1,0x83
8000802e:	cea58593          	addi	a1,a1,-790 # 8008ad14 <d.159>
80008032:	854a                	mv	a0,s2
80008034:	b7df80ef          	jal	80000bb0 <memmove>
      return 1;
80008038:	4505                	li	a0,1
8000803a:	90cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000803e:	40000613          	li	a2,1024
80008042:	00083597          	auipc	a1,0x83
80008046:	0d258593          	addi	a1,a1,210 # 8008b114 <d.158>
8000804a:	854a                	mv	a0,s2
8000804c:	b65f80ef          	jal	80000bb0 <memmove>
      return 1;
80008050:	4505                	li	a0,1
80008052:	8f4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008056:	40000613          	li	a2,1024
8000805a:	00083597          	auipc	a1,0x83
8000805e:	4ba58593          	addi	a1,a1,1210 # 8008b514 <d.157>
80008062:	854a                	mv	a0,s2
80008064:	b4df80ef          	jal	80000bb0 <memmove>
      return 1;
80008068:	4505                	li	a0,1
8000806a:	8dcfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000806e:	40000613          	li	a2,1024
80008072:	00084597          	auipc	a1,0x84
80008076:	8a258593          	addi	a1,a1,-1886 # 8008b914 <d.156>
8000807a:	854a                	mv	a0,s2
8000807c:	b35f80ef          	jal	80000bb0 <memmove>
      return 1;
80008080:	4505                	li	a0,1
80008082:	8c4fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008086:	40000613          	li	a2,1024
8000808a:	00084597          	auipc	a1,0x84
8000808e:	c8a58593          	addi	a1,a1,-886 # 8008bd14 <d.155>
80008092:	854a                	mv	a0,s2
80008094:	b1df80ef          	jal	80000bb0 <memmove>
      return 1;
80008098:	4505                	li	a0,1
8000809a:	8acfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000809e:	40000613          	li	a2,1024
800080a2:	00084597          	auipc	a1,0x84
800080a6:	07258593          	addi	a1,a1,114 # 8008c114 <d.154>
800080aa:	854a                	mv	a0,s2
800080ac:	b05f80ef          	jal	80000bb0 <memmove>
      return 1;
800080b0:	4505                	li	a0,1
800080b2:	894fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800080b6:	40000613          	li	a2,1024
800080ba:	00084597          	auipc	a1,0x84
800080be:	45a58593          	addi	a1,a1,1114 # 8008c514 <d.153>
800080c2:	854a                	mv	a0,s2
800080c4:	aedf80ef          	jal	80000bb0 <memmove>
      return 1;
800080c8:	4505                	li	a0,1
800080ca:	87cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800080ce:	40000613          	li	a2,1024
800080d2:	00085597          	auipc	a1,0x85
800080d6:	84258593          	addi	a1,a1,-1982 # 8008c914 <d.152>
800080da:	854a                	mv	a0,s2
800080dc:	ad5f80ef          	jal	80000bb0 <memmove>
      return 1;
800080e0:	4505                	li	a0,1
800080e2:	864fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800080e6:	40000613          	li	a2,1024
800080ea:	00085597          	auipc	a1,0x85
800080ee:	c2a58593          	addi	a1,a1,-982 # 8008cd14 <d.151>
800080f2:	854a                	mv	a0,s2
800080f4:	abdf80ef          	jal	80000bb0 <memmove>
      return 1;
800080f8:	4505                	li	a0,1
800080fa:	84cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800080fe:	40000613          	li	a2,1024
80008102:	00085597          	auipc	a1,0x85
80008106:	01258593          	addi	a1,a1,18 # 8008d114 <d.150>
8000810a:	854a                	mv	a0,s2
8000810c:	aa5f80ef          	jal	80000bb0 <memmove>
      return 1;
80008110:	4505                	li	a0,1
80008112:	834fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008116:	40000613          	li	a2,1024
8000811a:	00085597          	auipc	a1,0x85
8000811e:	3fa58593          	addi	a1,a1,1018 # 8008d514 <d.149>
80008122:	854a                	mv	a0,s2
80008124:	a8df80ef          	jal	80000bb0 <memmove>
      return 1;
80008128:	4505                	li	a0,1
8000812a:	81cfd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000812e:	40000613          	li	a2,1024
80008132:	00085597          	auipc	a1,0x85
80008136:	7e258593          	addi	a1,a1,2018 # 8008d914 <d.148>
8000813a:	854a                	mv	a0,s2
8000813c:	a75f80ef          	jal	80000bb0 <memmove>
      return 1;
80008140:	4505                	li	a0,1
80008142:	804fd06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008146:	40000613          	li	a2,1024
8000814a:	00086597          	auipc	a1,0x86
8000814e:	bca58593          	addi	a1,a1,-1078 # 8008dd14 <d.147>
80008152:	854a                	mv	a0,s2
80008154:	a5df80ef          	jal	80000bb0 <memmove>
      return 1;
80008158:	4505                	li	a0,1
8000815a:	fedfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000815e:	40000613          	li	a2,1024
80008162:	00086597          	auipc	a1,0x86
80008166:	fb258593          	addi	a1,a1,-78 # 8008e114 <d.146>
8000816a:	854a                	mv	a0,s2
8000816c:	a45f80ef          	jal	80000bb0 <memmove>
      return 1;
80008170:	4505                	li	a0,1
80008172:	fd5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008176:	40000613          	li	a2,1024
8000817a:	00086597          	auipc	a1,0x86
8000817e:	39a58593          	addi	a1,a1,922 # 8008e514 <d.145>
80008182:	854a                	mv	a0,s2
80008184:	a2df80ef          	jal	80000bb0 <memmove>
      return 1;
80008188:	4505                	li	a0,1
8000818a:	fbdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000818e:	40000613          	li	a2,1024
80008192:	00086597          	auipc	a1,0x86
80008196:	78258593          	addi	a1,a1,1922 # 8008e914 <d.144>
8000819a:	854a                	mv	a0,s2
8000819c:	a15f80ef          	jal	80000bb0 <memmove>
      return 1;
800081a0:	4505                	li	a0,1
800081a2:	fa5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800081a6:	40000613          	li	a2,1024
800081aa:	00087597          	auipc	a1,0x87
800081ae:	b6a58593          	addi	a1,a1,-1174 # 8008ed14 <d.143>
800081b2:	854a                	mv	a0,s2
800081b4:	9fdf80ef          	jal	80000bb0 <memmove>
      return 1;
800081b8:	4505                	li	a0,1
800081ba:	f8dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800081be:	40000613          	li	a2,1024
800081c2:	00087597          	auipc	a1,0x87
800081c6:	f5258593          	addi	a1,a1,-174 # 8008f114 <d.142>
800081ca:	854a                	mv	a0,s2
800081cc:	9e5f80ef          	jal	80000bb0 <memmove>
      return 1;
800081d0:	4505                	li	a0,1
800081d2:	f75fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800081d6:	40000613          	li	a2,1024
800081da:	00087597          	auipc	a1,0x87
800081de:	33a58593          	addi	a1,a1,826 # 8008f514 <d.141>
800081e2:	854a                	mv	a0,s2
800081e4:	9cdf80ef          	jal	80000bb0 <memmove>
      return 1;
800081e8:	4505                	li	a0,1
800081ea:	f5dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800081ee:	40000613          	li	a2,1024
800081f2:	00087597          	auipc	a1,0x87
800081f6:	72258593          	addi	a1,a1,1826 # 8008f914 <d.140>
800081fa:	854a                	mv	a0,s2
800081fc:	9b5f80ef          	jal	80000bb0 <memmove>
      return 1;
80008200:	4505                	li	a0,1
80008202:	f45fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008206:	40000613          	li	a2,1024
8000820a:	00088597          	auipc	a1,0x88
8000820e:	b0a58593          	addi	a1,a1,-1270 # 8008fd14 <d.139>
80008212:	854a                	mv	a0,s2
80008214:	99df80ef          	jal	80000bb0 <memmove>
      return 1;
80008218:	4505                	li	a0,1
8000821a:	f2dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000821e:	40000613          	li	a2,1024
80008222:	00088597          	auipc	a1,0x88
80008226:	ef258593          	addi	a1,a1,-270 # 80090114 <d.138>
8000822a:	854a                	mv	a0,s2
8000822c:	985f80ef          	jal	80000bb0 <memmove>
      return 1;
80008230:	4505                	li	a0,1
80008232:	f15fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008236:	40000613          	li	a2,1024
8000823a:	00088597          	auipc	a1,0x88
8000823e:	2da58593          	addi	a1,a1,730 # 80090514 <d.137>
80008242:	854a                	mv	a0,s2
80008244:	96df80ef          	jal	80000bb0 <memmove>
      return 1;
80008248:	4505                	li	a0,1
8000824a:	efdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000824e:	40000613          	li	a2,1024
80008252:	00088597          	auipc	a1,0x88
80008256:	6c258593          	addi	a1,a1,1730 # 80090914 <d.136>
8000825a:	854a                	mv	a0,s2
8000825c:	955f80ef          	jal	80000bb0 <memmove>
      return 1;
80008260:	4505                	li	a0,1
80008262:	ee5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008266:	40000613          	li	a2,1024
8000826a:	00089597          	auipc	a1,0x89
8000826e:	aaa58593          	addi	a1,a1,-1366 # 80090d14 <d.135>
80008272:	854a                	mv	a0,s2
80008274:	93df80ef          	jal	80000bb0 <memmove>
      return 1;
80008278:	4505                	li	a0,1
8000827a:	ecdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000827e:	40000613          	li	a2,1024
80008282:	00089597          	auipc	a1,0x89
80008286:	e9258593          	addi	a1,a1,-366 # 80091114 <d.134>
8000828a:	854a                	mv	a0,s2
8000828c:	925f80ef          	jal	80000bb0 <memmove>
      return 1;
80008290:	4505                	li	a0,1
80008292:	eb5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008296:	40000613          	li	a2,1024
8000829a:	00089597          	auipc	a1,0x89
8000829e:	27a58593          	addi	a1,a1,634 # 80091514 <d.133>
800082a2:	854a                	mv	a0,s2
800082a4:	90df80ef          	jal	80000bb0 <memmove>
      return 1;
800082a8:	4505                	li	a0,1
800082aa:	e9dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800082ae:	40000613          	li	a2,1024
800082b2:	00089597          	auipc	a1,0x89
800082b6:	66258593          	addi	a1,a1,1634 # 80091914 <d.132>
800082ba:	854a                	mv	a0,s2
800082bc:	8f5f80ef          	jal	80000bb0 <memmove>
      return 1;
800082c0:	4505                	li	a0,1
800082c2:	e85fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800082c6:	40000613          	li	a2,1024
800082ca:	0008a597          	auipc	a1,0x8a
800082ce:	a4a58593          	addi	a1,a1,-1462 # 80091d14 <d.131>
800082d2:	854a                	mv	a0,s2
800082d4:	8ddf80ef          	jal	80000bb0 <memmove>
      return 1;
800082d8:	4505                	li	a0,1
800082da:	e6dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800082de:	40000613          	li	a2,1024
800082e2:	0008a597          	auipc	a1,0x8a
800082e6:	e3258593          	addi	a1,a1,-462 # 80092114 <d.130>
800082ea:	854a                	mv	a0,s2
800082ec:	8c5f80ef          	jal	80000bb0 <memmove>
      return 1;
800082f0:	4505                	li	a0,1
800082f2:	e55fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800082f6:	40000613          	li	a2,1024
800082fa:	0008a597          	auipc	a1,0x8a
800082fe:	21a58593          	addi	a1,a1,538 # 80092514 <d.129>
80008302:	854a                	mv	a0,s2
80008304:	8adf80ef          	jal	80000bb0 <memmove>
      return 1;
80008308:	4505                	li	a0,1
8000830a:	e3dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000830e:	40000613          	li	a2,1024
80008312:	0008a597          	auipc	a1,0x8a
80008316:	60258593          	addi	a1,a1,1538 # 80092914 <d.128>
8000831a:	854a                	mv	a0,s2
8000831c:	895f80ef          	jal	80000bb0 <memmove>
      return 1;
80008320:	4505                	li	a0,1
80008322:	e25fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008326:	40000613          	li	a2,1024
8000832a:	0008b597          	auipc	a1,0x8b
8000832e:	9ea58593          	addi	a1,a1,-1558 # 80092d14 <d.127>
80008332:	854a                	mv	a0,s2
80008334:	87df80ef          	jal	80000bb0 <memmove>
      return 1;
80008338:	4505                	li	a0,1
8000833a:	e0dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000833e:	40000613          	li	a2,1024
80008342:	0008b597          	auipc	a1,0x8b
80008346:	dd258593          	addi	a1,a1,-558 # 80093114 <d.126>
8000834a:	854a                	mv	a0,s2
8000834c:	865f80ef          	jal	80000bb0 <memmove>
      return 1;
80008350:	4505                	li	a0,1
80008352:	df5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008356:	40000613          	li	a2,1024
8000835a:	0008b597          	auipc	a1,0x8b
8000835e:	1ba58593          	addi	a1,a1,442 # 80093514 <d.125>
80008362:	854a                	mv	a0,s2
80008364:	84df80ef          	jal	80000bb0 <memmove>
      return 1;
80008368:	4505                	li	a0,1
8000836a:	dddfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000836e:	40000613          	li	a2,1024
80008372:	0008b597          	auipc	a1,0x8b
80008376:	5a258593          	addi	a1,a1,1442 # 80093914 <d.124>
8000837a:	854a                	mv	a0,s2
8000837c:	835f80ef          	jal	80000bb0 <memmove>
      return 1;
80008380:	4505                	li	a0,1
80008382:	dc5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008386:	40000613          	li	a2,1024
8000838a:	0008c597          	auipc	a1,0x8c
8000838e:	98a58593          	addi	a1,a1,-1654 # 80093d14 <d.123>
80008392:	854a                	mv	a0,s2
80008394:	81df80ef          	jal	80000bb0 <memmove>
      return 1;
80008398:	4505                	li	a0,1
8000839a:	dadfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000839e:	40000613          	li	a2,1024
800083a2:	0008c597          	auipc	a1,0x8c
800083a6:	d7258593          	addi	a1,a1,-654 # 80094114 <d.122>
800083aa:	854a                	mv	a0,s2
800083ac:	805f80ef          	jal	80000bb0 <memmove>
      return 1;
800083b0:	4505                	li	a0,1
800083b2:	d95fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800083b6:	40000613          	li	a2,1024
800083ba:	0008c597          	auipc	a1,0x8c
800083be:	15a58593          	addi	a1,a1,346 # 80094514 <d.121>
800083c2:	854a                	mv	a0,s2
800083c4:	fecf80ef          	jal	80000bb0 <memmove>
      return 1;
800083c8:	4505                	li	a0,1
800083ca:	d7dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800083ce:	40000613          	li	a2,1024
800083d2:	0008c597          	auipc	a1,0x8c
800083d6:	54258593          	addi	a1,a1,1346 # 80094914 <d.120>
800083da:	854a                	mv	a0,s2
800083dc:	fd4f80ef          	jal	80000bb0 <memmove>
      return 1;
800083e0:	4505                	li	a0,1
800083e2:	d65fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800083e6:	40000613          	li	a2,1024
800083ea:	0008d597          	auipc	a1,0x8d
800083ee:	92a58593          	addi	a1,a1,-1750 # 80094d14 <d.119>
800083f2:	854a                	mv	a0,s2
800083f4:	fbcf80ef          	jal	80000bb0 <memmove>
      return 1;
800083f8:	4505                	li	a0,1
800083fa:	d4dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800083fe:	40000613          	li	a2,1024
80008402:	0008d597          	auipc	a1,0x8d
80008406:	d1258593          	addi	a1,a1,-750 # 80095114 <d.118>
8000840a:	854a                	mv	a0,s2
8000840c:	fa4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008410:	4505                	li	a0,1
80008412:	d35fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008416:	40000613          	li	a2,1024
8000841a:	0008d597          	auipc	a1,0x8d
8000841e:	0fa58593          	addi	a1,a1,250 # 80095514 <d.117>
80008422:	854a                	mv	a0,s2
80008424:	f8cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008428:	4505                	li	a0,1
8000842a:	d1dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000842e:	40000613          	li	a2,1024
80008432:	0008d597          	auipc	a1,0x8d
80008436:	4e258593          	addi	a1,a1,1250 # 80095914 <d.116>
8000843a:	854a                	mv	a0,s2
8000843c:	f74f80ef          	jal	80000bb0 <memmove>
      return 1;
80008440:	4505                	li	a0,1
80008442:	d05fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008446:	40000613          	li	a2,1024
8000844a:	0008e597          	auipc	a1,0x8e
8000844e:	8ca58593          	addi	a1,a1,-1846 # 80095d14 <d.115>
80008452:	854a                	mv	a0,s2
80008454:	f5cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008458:	4505                	li	a0,1
8000845a:	cedfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000845e:	40000613          	li	a2,1024
80008462:	0008e597          	auipc	a1,0x8e
80008466:	cb258593          	addi	a1,a1,-846 # 80096114 <d.114>
8000846a:	854a                	mv	a0,s2
8000846c:	f44f80ef          	jal	80000bb0 <memmove>
      return 1;
80008470:	4505                	li	a0,1
80008472:	cd5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008476:	40000613          	li	a2,1024
8000847a:	0008e597          	auipc	a1,0x8e
8000847e:	09a58593          	addi	a1,a1,154 # 80096514 <d.113>
80008482:	854a                	mv	a0,s2
80008484:	f2cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008488:	4505                	li	a0,1
8000848a:	cbdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000848e:	40000613          	li	a2,1024
80008492:	0008e597          	auipc	a1,0x8e
80008496:	48258593          	addi	a1,a1,1154 # 80096914 <d.112>
8000849a:	854a                	mv	a0,s2
8000849c:	f14f80ef          	jal	80000bb0 <memmove>
      return 1;
800084a0:	4505                	li	a0,1
800084a2:	ca5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800084a6:	40000613          	li	a2,1024
800084aa:	0008f597          	auipc	a1,0x8f
800084ae:	86a58593          	addi	a1,a1,-1942 # 80096d14 <d.111>
800084b2:	854a                	mv	a0,s2
800084b4:	efcf80ef          	jal	80000bb0 <memmove>
      return 1;
800084b8:	4505                	li	a0,1
800084ba:	c8dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800084be:	40000613          	li	a2,1024
800084c2:	0008f597          	auipc	a1,0x8f
800084c6:	c5258593          	addi	a1,a1,-942 # 80097114 <d.110>
800084ca:	854a                	mv	a0,s2
800084cc:	ee4f80ef          	jal	80000bb0 <memmove>
      return 1;
800084d0:	4505                	li	a0,1
800084d2:	c75fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800084d6:	40000613          	li	a2,1024
800084da:	0008f597          	auipc	a1,0x8f
800084de:	03a58593          	addi	a1,a1,58 # 80097514 <d.109>
800084e2:	854a                	mv	a0,s2
800084e4:	eccf80ef          	jal	80000bb0 <memmove>
      return 1;
800084e8:	4505                	li	a0,1
800084ea:	c5dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800084ee:	40000613          	li	a2,1024
800084f2:	0008f597          	auipc	a1,0x8f
800084f6:	42258593          	addi	a1,a1,1058 # 80097914 <d.108>
800084fa:	854a                	mv	a0,s2
800084fc:	eb4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008500:	4505                	li	a0,1
80008502:	c45fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008506:	40000613          	li	a2,1024
8000850a:	00090597          	auipc	a1,0x90
8000850e:	80a58593          	addi	a1,a1,-2038 # 80097d14 <d.107>
80008512:	854a                	mv	a0,s2
80008514:	e9cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008518:	4505                	li	a0,1
8000851a:	c2dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000851e:	40000613          	li	a2,1024
80008522:	00090597          	auipc	a1,0x90
80008526:	bf258593          	addi	a1,a1,-1038 # 80098114 <d.106>
8000852a:	854a                	mv	a0,s2
8000852c:	e84f80ef          	jal	80000bb0 <memmove>
      return 1;
80008530:	4505                	li	a0,1
80008532:	c15fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008536:	40000613          	li	a2,1024
8000853a:	00090597          	auipc	a1,0x90
8000853e:	fda58593          	addi	a1,a1,-38 # 80098514 <d.105>
80008542:	854a                	mv	a0,s2
80008544:	e6cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008548:	4505                	li	a0,1
8000854a:	bfdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000854e:	40000613          	li	a2,1024
80008552:	00090597          	auipc	a1,0x90
80008556:	3c258593          	addi	a1,a1,962 # 80098914 <d.104>
8000855a:	854a                	mv	a0,s2
8000855c:	e54f80ef          	jal	80000bb0 <memmove>
      return 1;
80008560:	4505                	li	a0,1
80008562:	be5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008566:	40000613          	li	a2,1024
8000856a:	00090597          	auipc	a1,0x90
8000856e:	7aa58593          	addi	a1,a1,1962 # 80098d14 <d.103>
80008572:	854a                	mv	a0,s2
80008574:	e3cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008578:	4505                	li	a0,1
8000857a:	bcdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000857e:	40000613          	li	a2,1024
80008582:	00091597          	auipc	a1,0x91
80008586:	b9258593          	addi	a1,a1,-1134 # 80099114 <d.102>
8000858a:	854a                	mv	a0,s2
8000858c:	e24f80ef          	jal	80000bb0 <memmove>
      return 1;
80008590:	4505                	li	a0,1
80008592:	bb5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008596:	40000613          	li	a2,1024
8000859a:	00091597          	auipc	a1,0x91
8000859e:	f7a58593          	addi	a1,a1,-134 # 80099514 <d.101>
800085a2:	854a                	mv	a0,s2
800085a4:	e0cf80ef          	jal	80000bb0 <memmove>
      return 1;
800085a8:	4505                	li	a0,1
800085aa:	b9dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800085ae:	40000613          	li	a2,1024
800085b2:	00091597          	auipc	a1,0x91
800085b6:	36258593          	addi	a1,a1,866 # 80099914 <d.100>
800085ba:	854a                	mv	a0,s2
800085bc:	df4f80ef          	jal	80000bb0 <memmove>
      return 1;
800085c0:	4505                	li	a0,1
800085c2:	b85fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800085c6:	40000613          	li	a2,1024
800085ca:	00091597          	auipc	a1,0x91
800085ce:	74a58593          	addi	a1,a1,1866 # 80099d14 <d.99>
800085d2:	854a                	mv	a0,s2
800085d4:	ddcf80ef          	jal	80000bb0 <memmove>
      return 1;
800085d8:	4505                	li	a0,1
800085da:	b6dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800085de:	40000613          	li	a2,1024
800085e2:	00092597          	auipc	a1,0x92
800085e6:	b3258593          	addi	a1,a1,-1230 # 8009a114 <d.98>
800085ea:	854a                	mv	a0,s2
800085ec:	dc4f80ef          	jal	80000bb0 <memmove>
      return 1;
800085f0:	4505                	li	a0,1
800085f2:	b55fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800085f6:	40000613          	li	a2,1024
800085fa:	00092597          	auipc	a1,0x92
800085fe:	f1a58593          	addi	a1,a1,-230 # 8009a514 <d.97>
80008602:	854a                	mv	a0,s2
80008604:	dacf80ef          	jal	80000bb0 <memmove>
      return 1;
80008608:	4505                	li	a0,1
8000860a:	b3dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000860e:	40000613          	li	a2,1024
80008612:	00092597          	auipc	a1,0x92
80008616:	30258593          	addi	a1,a1,770 # 8009a914 <d.96>
8000861a:	854a                	mv	a0,s2
8000861c:	d94f80ef          	jal	80000bb0 <memmove>
      return 1;
80008620:	4505                	li	a0,1
80008622:	b25fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008626:	40000613          	li	a2,1024
8000862a:	00092597          	auipc	a1,0x92
8000862e:	6ea58593          	addi	a1,a1,1770 # 8009ad14 <d.95>
80008632:	854a                	mv	a0,s2
80008634:	d7cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008638:	4505                	li	a0,1
8000863a:	b0dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000863e:	40000613          	li	a2,1024
80008642:	00093597          	auipc	a1,0x93
80008646:	ad258593          	addi	a1,a1,-1326 # 8009b114 <d.94>
8000864a:	854a                	mv	a0,s2
8000864c:	d64f80ef          	jal	80000bb0 <memmove>
      return 1;
80008650:	4505                	li	a0,1
80008652:	af5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008656:	40000613          	li	a2,1024
8000865a:	00093597          	auipc	a1,0x93
8000865e:	eba58593          	addi	a1,a1,-326 # 8009b514 <d.93>
80008662:	854a                	mv	a0,s2
80008664:	d4cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008668:	4505                	li	a0,1
8000866a:	addfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000866e:	40000613          	li	a2,1024
80008672:	00093597          	auipc	a1,0x93
80008676:	2a258593          	addi	a1,a1,674 # 8009b914 <d.92>
8000867a:	854a                	mv	a0,s2
8000867c:	d34f80ef          	jal	80000bb0 <memmove>
      return 1;
80008680:	4505                	li	a0,1
80008682:	ac5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008686:	40000613          	li	a2,1024
8000868a:	00093597          	auipc	a1,0x93
8000868e:	68a58593          	addi	a1,a1,1674 # 8009bd14 <d.91>
80008692:	854a                	mv	a0,s2
80008694:	d1cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008698:	4505                	li	a0,1
8000869a:	aadfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000869e:	40000613          	li	a2,1024
800086a2:	00094597          	auipc	a1,0x94
800086a6:	a7258593          	addi	a1,a1,-1422 # 8009c114 <d.90>
800086aa:	854a                	mv	a0,s2
800086ac:	d04f80ef          	jal	80000bb0 <memmove>
      return 1;
800086b0:	4505                	li	a0,1
800086b2:	a95fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800086b6:	40000613          	li	a2,1024
800086ba:	00094597          	auipc	a1,0x94
800086be:	e5a58593          	addi	a1,a1,-422 # 8009c514 <d.89>
800086c2:	854a                	mv	a0,s2
800086c4:	cecf80ef          	jal	80000bb0 <memmove>
      return 1;
800086c8:	4505                	li	a0,1
800086ca:	a7dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800086ce:	40000613          	li	a2,1024
800086d2:	00094597          	auipc	a1,0x94
800086d6:	24258593          	addi	a1,a1,578 # 8009c914 <d.88>
800086da:	854a                	mv	a0,s2
800086dc:	cd4f80ef          	jal	80000bb0 <memmove>
      return 1;
800086e0:	4505                	li	a0,1
800086e2:	a65fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800086e6:	40000613          	li	a2,1024
800086ea:	00094597          	auipc	a1,0x94
800086ee:	62a58593          	addi	a1,a1,1578 # 8009cd14 <d.87>
800086f2:	854a                	mv	a0,s2
800086f4:	cbcf80ef          	jal	80000bb0 <memmove>
      return 1;
800086f8:	4505                	li	a0,1
800086fa:	a4dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800086fe:	40000613          	li	a2,1024
80008702:	00095597          	auipc	a1,0x95
80008706:	a1258593          	addi	a1,a1,-1518 # 8009d114 <d.86>
8000870a:	854a                	mv	a0,s2
8000870c:	ca4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008710:	4505                	li	a0,1
80008712:	a35fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008716:	40000613          	li	a2,1024
8000871a:	00095597          	auipc	a1,0x95
8000871e:	dfa58593          	addi	a1,a1,-518 # 8009d514 <d.85>
80008722:	854a                	mv	a0,s2
80008724:	c8cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008728:	4505                	li	a0,1
8000872a:	a1dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000872e:	40000613          	li	a2,1024
80008732:	00095597          	auipc	a1,0x95
80008736:	1e258593          	addi	a1,a1,482 # 8009d914 <d.84>
8000873a:	854a                	mv	a0,s2
8000873c:	c74f80ef          	jal	80000bb0 <memmove>
      return 1;
80008740:	4505                	li	a0,1
80008742:	a05fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008746:	40000613          	li	a2,1024
8000874a:	00095597          	auipc	a1,0x95
8000874e:	5ca58593          	addi	a1,a1,1482 # 8009dd14 <d.83>
80008752:	854a                	mv	a0,s2
80008754:	c5cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008758:	4505                	li	a0,1
8000875a:	9edfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000875e:	40000613          	li	a2,1024
80008762:	00096597          	auipc	a1,0x96
80008766:	9b258593          	addi	a1,a1,-1614 # 8009e114 <d.82>
8000876a:	854a                	mv	a0,s2
8000876c:	c44f80ef          	jal	80000bb0 <memmove>
      return 1;
80008770:	4505                	li	a0,1
80008772:	9d5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008776:	40000613          	li	a2,1024
8000877a:	00096597          	auipc	a1,0x96
8000877e:	d9a58593          	addi	a1,a1,-614 # 8009e514 <d.81>
80008782:	854a                	mv	a0,s2
80008784:	c2cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008788:	4505                	li	a0,1
8000878a:	9bdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000878e:	40000613          	li	a2,1024
80008792:	00096597          	auipc	a1,0x96
80008796:	18258593          	addi	a1,a1,386 # 8009e914 <d.80>
8000879a:	854a                	mv	a0,s2
8000879c:	c14f80ef          	jal	80000bb0 <memmove>
      return 1;
800087a0:	4505                	li	a0,1
800087a2:	9a5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800087a6:	40000613          	li	a2,1024
800087aa:	00096597          	auipc	a1,0x96
800087ae:	56a58593          	addi	a1,a1,1386 # 8009ed14 <d.79>
800087b2:	854a                	mv	a0,s2
800087b4:	bfcf80ef          	jal	80000bb0 <memmove>
      return 1;
800087b8:	4505                	li	a0,1
800087ba:	98dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800087be:	40000613          	li	a2,1024
800087c2:	00097597          	auipc	a1,0x97
800087c6:	95258593          	addi	a1,a1,-1710 # 8009f114 <d.78>
800087ca:	854a                	mv	a0,s2
800087cc:	be4f80ef          	jal	80000bb0 <memmove>
      return 1;
800087d0:	4505                	li	a0,1
800087d2:	975fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800087d6:	40000613          	li	a2,1024
800087da:	00097597          	auipc	a1,0x97
800087de:	d3a58593          	addi	a1,a1,-710 # 8009f514 <d.77>
800087e2:	854a                	mv	a0,s2
800087e4:	bccf80ef          	jal	80000bb0 <memmove>
      return 1;
800087e8:	4505                	li	a0,1
800087ea:	95dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800087ee:	40000613          	li	a2,1024
800087f2:	00097597          	auipc	a1,0x97
800087f6:	12258593          	addi	a1,a1,290 # 8009f914 <d.76>
800087fa:	854a                	mv	a0,s2
800087fc:	bb4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008800:	4505                	li	a0,1
80008802:	945fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008806:	40000613          	li	a2,1024
8000880a:	00097597          	auipc	a1,0x97
8000880e:	50a58593          	addi	a1,a1,1290 # 8009fd14 <d.75>
80008812:	854a                	mv	a0,s2
80008814:	b9cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008818:	4505                	li	a0,1
8000881a:	92dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000881e:	40000613          	li	a2,1024
80008822:	00098597          	auipc	a1,0x98
80008826:	8f258593          	addi	a1,a1,-1806 # 800a0114 <d.74>
8000882a:	854a                	mv	a0,s2
8000882c:	b84f80ef          	jal	80000bb0 <memmove>
      return 1;
80008830:	4505                	li	a0,1
80008832:	915fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008836:	40000613          	li	a2,1024
8000883a:	00098597          	auipc	a1,0x98
8000883e:	cda58593          	addi	a1,a1,-806 # 800a0514 <d.73>
80008842:	854a                	mv	a0,s2
80008844:	b6cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008848:	4505                	li	a0,1
8000884a:	8fdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000884e:	40000613          	li	a2,1024
80008852:	00098597          	auipc	a1,0x98
80008856:	0c258593          	addi	a1,a1,194 # 800a0914 <d.72>
8000885a:	854a                	mv	a0,s2
8000885c:	b54f80ef          	jal	80000bb0 <memmove>
      return 1;
80008860:	4505                	li	a0,1
80008862:	8e5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008866:	40000613          	li	a2,1024
8000886a:	00098597          	auipc	a1,0x98
8000886e:	4aa58593          	addi	a1,a1,1194 # 800a0d14 <d.71>
80008872:	854a                	mv	a0,s2
80008874:	b3cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008878:	4505                	li	a0,1
8000887a:	8cdfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000887e:	40000613          	li	a2,1024
80008882:	00099597          	auipc	a1,0x99
80008886:	89258593          	addi	a1,a1,-1902 # 800a1114 <d.70>
8000888a:	854a                	mv	a0,s2
8000888c:	b24f80ef          	jal	80000bb0 <memmove>
      return 1;
80008890:	4505                	li	a0,1
80008892:	8b5fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008896:	40000613          	li	a2,1024
8000889a:	00099597          	auipc	a1,0x99
8000889e:	c7a58593          	addi	a1,a1,-902 # 800a1514 <d.69>
800088a2:	854a                	mv	a0,s2
800088a4:	b0cf80ef          	jal	80000bb0 <memmove>
      return 1;
800088a8:	4505                	li	a0,1
800088aa:	89dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800088ae:	40000613          	li	a2,1024
800088b2:	00099597          	auipc	a1,0x99
800088b6:	06258593          	addi	a1,a1,98 # 800a1914 <d.68>
800088ba:	854a                	mv	a0,s2
800088bc:	af4f80ef          	jal	80000bb0 <memmove>
      return 1;
800088c0:	4505                	li	a0,1
800088c2:	885fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800088c6:	40000613          	li	a2,1024
800088ca:	00099597          	auipc	a1,0x99
800088ce:	44a58593          	addi	a1,a1,1098 # 800a1d14 <d.67>
800088d2:	854a                	mv	a0,s2
800088d4:	adcf80ef          	jal	80000bb0 <memmove>
      return 1;
800088d8:	4505                	li	a0,1
800088da:	86dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800088de:	40000613          	li	a2,1024
800088e2:	0009a597          	auipc	a1,0x9a
800088e6:	83258593          	addi	a1,a1,-1998 # 800a2114 <d.66>
800088ea:	854a                	mv	a0,s2
800088ec:	ac4f80ef          	jal	80000bb0 <memmove>
      return 1;
800088f0:	4505                	li	a0,1
800088f2:	855fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800088f6:	40000613          	li	a2,1024
800088fa:	0009a597          	auipc	a1,0x9a
800088fe:	c1a58593          	addi	a1,a1,-998 # 800a2514 <d.65>
80008902:	854a                	mv	a0,s2
80008904:	aacf80ef          	jal	80000bb0 <memmove>
      return 1;
80008908:	4505                	li	a0,1
8000890a:	83dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000890e:	40000613          	li	a2,1024
80008912:	0009a597          	auipc	a1,0x9a
80008916:	00258593          	addi	a1,a1,2 # 800a2914 <d.64>
8000891a:	854a                	mv	a0,s2
8000891c:	a94f80ef          	jal	80000bb0 <memmove>
      return 1;
80008920:	4505                	li	a0,1
80008922:	825fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008926:	40000613          	li	a2,1024
8000892a:	0009a597          	auipc	a1,0x9a
8000892e:	3ea58593          	addi	a1,a1,1002 # 800a2d14 <d.63>
80008932:	854a                	mv	a0,s2
80008934:	a7cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008938:	4505                	li	a0,1
8000893a:	80dfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000893e:	40000613          	li	a2,1024
80008942:	0009a597          	auipc	a1,0x9a
80008946:	7d258593          	addi	a1,a1,2002 # 800a3114 <d.62>
8000894a:	854a                	mv	a0,s2
8000894c:	a64f80ef          	jal	80000bb0 <memmove>
      return 1;
80008950:	4505                	li	a0,1
80008952:	ff4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008956:	40000613          	li	a2,1024
8000895a:	0009b597          	auipc	a1,0x9b
8000895e:	bba58593          	addi	a1,a1,-1094 # 800a3514 <d.61>
80008962:	854a                	mv	a0,s2
80008964:	a4cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008968:	4505                	li	a0,1
8000896a:	fdcfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000896e:	40000613          	li	a2,1024
80008972:	0009b597          	auipc	a1,0x9b
80008976:	fa258593          	addi	a1,a1,-94 # 800a3914 <d.60>
8000897a:	854a                	mv	a0,s2
8000897c:	a34f80ef          	jal	80000bb0 <memmove>
      return 1;
80008980:	4505                	li	a0,1
80008982:	fc4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008986:	40000613          	li	a2,1024
8000898a:	0009b597          	auipc	a1,0x9b
8000898e:	38a58593          	addi	a1,a1,906 # 800a3d14 <d.59>
80008992:	854a                	mv	a0,s2
80008994:	a1cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008998:	4505                	li	a0,1
8000899a:	facfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
8000899e:	40000613          	li	a2,1024
800089a2:	0009b597          	auipc	a1,0x9b
800089a6:	77258593          	addi	a1,a1,1906 # 800a4114 <d.58>
800089aa:	854a                	mv	a0,s2
800089ac:	a04f80ef          	jal	80000bb0 <memmove>
      return 1;
800089b0:	4505                	li	a0,1
800089b2:	f94fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800089b6:	40000613          	li	a2,1024
800089ba:	0009c597          	auipc	a1,0x9c
800089be:	b5a58593          	addi	a1,a1,-1190 # 800a4514 <d.57>
800089c2:	854a                	mv	a0,s2
800089c4:	9ecf80ef          	jal	80000bb0 <memmove>
      return 1;
800089c8:	4505                	li	a0,1
800089ca:	f7cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800089ce:	40000613          	li	a2,1024
800089d2:	0009c597          	auipc	a1,0x9c
800089d6:	f4258593          	addi	a1,a1,-190 # 800a4914 <d.56>
800089da:	854a                	mv	a0,s2
800089dc:	9d4f80ef          	jal	80000bb0 <memmove>
      return 1;
800089e0:	4505                	li	a0,1
800089e2:	f64fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800089e6:	40000613          	li	a2,1024
800089ea:	0009c597          	auipc	a1,0x9c
800089ee:	32a58593          	addi	a1,a1,810 # 800a4d14 <d.55>
800089f2:	854a                	mv	a0,s2
800089f4:	9bcf80ef          	jal	80000bb0 <memmove>
      return 1;
800089f8:	4505                	li	a0,1
800089fa:	f4cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
800089fe:	40000613          	li	a2,1024
80008a02:	0009c597          	auipc	a1,0x9c
80008a06:	71258593          	addi	a1,a1,1810 # 800a5114 <d.54>
80008a0a:	854a                	mv	a0,s2
80008a0c:	9a4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008a10:	4505                	li	a0,1
80008a12:	f34fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008a16:	40000613          	li	a2,1024
80008a1a:	0009d597          	auipc	a1,0x9d
80008a1e:	afa58593          	addi	a1,a1,-1286 # 800a5514 <d.53>
80008a22:	854a                	mv	a0,s2
80008a24:	98cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008a28:	4505                	li	a0,1
80008a2a:	f1cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008a2e:	40000613          	li	a2,1024
80008a32:	0009d597          	auipc	a1,0x9d
80008a36:	ee258593          	addi	a1,a1,-286 # 800a5914 <d.52>
80008a3a:	854a                	mv	a0,s2
80008a3c:	974f80ef          	jal	80000bb0 <memmove>
      return 1;
80008a40:	4505                	li	a0,1
80008a42:	f04fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008a46:	40000613          	li	a2,1024
80008a4a:	0009d597          	auipc	a1,0x9d
80008a4e:	2ca58593          	addi	a1,a1,714 # 800a5d14 <d.51>
80008a52:	854a                	mv	a0,s2
80008a54:	95cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008a58:	4505                	li	a0,1
80008a5a:	eecfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008a5e:	40000613          	li	a2,1024
80008a62:	0009d597          	auipc	a1,0x9d
80008a66:	6b258593          	addi	a1,a1,1714 # 800a6114 <d.50>
80008a6a:	854a                	mv	a0,s2
80008a6c:	944f80ef          	jal	80000bb0 <memmove>
      return 1;
80008a70:	4505                	li	a0,1
80008a72:	ed4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008a76:	40000613          	li	a2,1024
80008a7a:	0009e597          	auipc	a1,0x9e
80008a7e:	a9a58593          	addi	a1,a1,-1382 # 800a6514 <d.49>
80008a82:	854a                	mv	a0,s2
80008a84:	92cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008a88:	4505                	li	a0,1
80008a8a:	ebcfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008a8e:	40000613          	li	a2,1024
80008a92:	0009e597          	auipc	a1,0x9e
80008a96:	e8258593          	addi	a1,a1,-382 # 800a6914 <d.48>
80008a9a:	854a                	mv	a0,s2
80008a9c:	914f80ef          	jal	80000bb0 <memmove>
      return 1;
80008aa0:	4505                	li	a0,1
80008aa2:	ea4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008aa6:	40000613          	li	a2,1024
80008aaa:	0009e597          	auipc	a1,0x9e
80008aae:	26a58593          	addi	a1,a1,618 # 800a6d14 <d.47>
80008ab2:	854a                	mv	a0,s2
80008ab4:	8fcf80ef          	jal	80000bb0 <memmove>
      return 1;
80008ab8:	4505                	li	a0,1
80008aba:	e8cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008abe:	40000613          	li	a2,1024
80008ac2:	0009e597          	auipc	a1,0x9e
80008ac6:	65258593          	addi	a1,a1,1618 # 800a7114 <d.46>
80008aca:	854a                	mv	a0,s2
80008acc:	8e4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008ad0:	4505                	li	a0,1
80008ad2:	e74fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008ad6:	40000613          	li	a2,1024
80008ada:	0009f597          	auipc	a1,0x9f
80008ade:	a3a58593          	addi	a1,a1,-1478 # 800a7514 <d.45>
80008ae2:	854a                	mv	a0,s2
80008ae4:	8ccf80ef          	jal	80000bb0 <memmove>
      return 1;
80008ae8:	4505                	li	a0,1
80008aea:	e5cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008aee:	40000613          	li	a2,1024
80008af2:	0009f597          	auipc	a1,0x9f
80008af6:	e2258593          	addi	a1,a1,-478 # 800a7914 <d.44>
80008afa:	854a                	mv	a0,s2
80008afc:	8b4f80ef          	jal	80000bb0 <memmove>
      return 1;
80008b00:	4505                	li	a0,1
80008b02:	e44fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b06:	40000613          	li	a2,1024
80008b0a:	0009f597          	auipc	a1,0x9f
80008b0e:	20a58593          	addi	a1,a1,522 # 800a7d14 <d.43>
80008b12:	854a                	mv	a0,s2
80008b14:	89cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008b18:	4505                	li	a0,1
80008b1a:	e2cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b1e:	40000613          	li	a2,1024
80008b22:	0009f597          	auipc	a1,0x9f
80008b26:	5f258593          	addi	a1,a1,1522 # 800a8114 <d.42>
80008b2a:	854a                	mv	a0,s2
80008b2c:	884f80ef          	jal	80000bb0 <memmove>
      return 1;
80008b30:	4505                	li	a0,1
80008b32:	e14fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b36:	40000613          	li	a2,1024
80008b3a:	000a0597          	auipc	a1,0xa0
80008b3e:	9da58593          	addi	a1,a1,-1574 # 800a8514 <d.41>
80008b42:	854a                	mv	a0,s2
80008b44:	86cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008b48:	4505                	li	a0,1
80008b4a:	dfcfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b4e:	40000613          	li	a2,1024
80008b52:	000a0597          	auipc	a1,0xa0
80008b56:	dc258593          	addi	a1,a1,-574 # 800a8914 <d.40>
80008b5a:	854a                	mv	a0,s2
80008b5c:	854f80ef          	jal	80000bb0 <memmove>
      return 1;
80008b60:	4505                	li	a0,1
80008b62:	de4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b66:	40000613          	li	a2,1024
80008b6a:	000a0597          	auipc	a1,0xa0
80008b6e:	1aa58593          	addi	a1,a1,426 # 800a8d14 <d.39>
80008b72:	854a                	mv	a0,s2
80008b74:	83cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008b78:	4505                	li	a0,1
80008b7a:	dccfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b7e:	40000613          	li	a2,1024
80008b82:	000a0597          	auipc	a1,0xa0
80008b86:	59258593          	addi	a1,a1,1426 # 800a9114 <d.38>
80008b8a:	854a                	mv	a0,s2
80008b8c:	824f80ef          	jal	80000bb0 <memmove>
      return 1;
80008b90:	4505                	li	a0,1
80008b92:	db4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008b96:	40000613          	li	a2,1024
80008b9a:	000a1597          	auipc	a1,0xa1
80008b9e:	97a58593          	addi	a1,a1,-1670 # 800a9514 <d.37>
80008ba2:	854a                	mv	a0,s2
80008ba4:	80cf80ef          	jal	80000bb0 <memmove>
      return 1;
80008ba8:	4505                	li	a0,1
80008baa:	d9cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008bae:	40000613          	li	a2,1024
80008bb2:	000a1597          	auipc	a1,0xa1
80008bb6:	d6258593          	addi	a1,a1,-670 # 800a9914 <d.36>
80008bba:	854a                	mv	a0,s2
80008bbc:	ff5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008bc0:	4505                	li	a0,1
80008bc2:	d84fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008bc6:	40000613          	li	a2,1024
80008bca:	000a1597          	auipc	a1,0xa1
80008bce:	14a58593          	addi	a1,a1,330 # 800a9d14 <d.35>
80008bd2:	854a                	mv	a0,s2
80008bd4:	fddf70ef          	jal	80000bb0 <memmove>
      return 1;
80008bd8:	4505                	li	a0,1
80008bda:	d6cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008bde:	40000613          	li	a2,1024
80008be2:	000a1597          	auipc	a1,0xa1
80008be6:	53258593          	addi	a1,a1,1330 # 800aa114 <d.34>
80008bea:	854a                	mv	a0,s2
80008bec:	fc5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008bf0:	4505                	li	a0,1
80008bf2:	d54fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008bf6:	40000613          	li	a2,1024
80008bfa:	000a2597          	auipc	a1,0xa2
80008bfe:	91a58593          	addi	a1,a1,-1766 # 800aa514 <d.33>
80008c02:	854a                	mv	a0,s2
80008c04:	fadf70ef          	jal	80000bb0 <memmove>
      return 1;
80008c08:	4505                	li	a0,1
80008c0a:	d3cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c0e:	40000613          	li	a2,1024
80008c12:	000a2597          	auipc	a1,0xa2
80008c16:	d0258593          	addi	a1,a1,-766 # 800aa914 <d.32>
80008c1a:	854a                	mv	a0,s2
80008c1c:	f95f70ef          	jal	80000bb0 <memmove>
      return 1;
80008c20:	4505                	li	a0,1
80008c22:	d24fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c26:	40000613          	li	a2,1024
80008c2a:	000a2597          	auipc	a1,0xa2
80008c2e:	0ea58593          	addi	a1,a1,234 # 800aad14 <d.31>
80008c32:	854a                	mv	a0,s2
80008c34:	f7df70ef          	jal	80000bb0 <memmove>
      return 1;
80008c38:	4505                	li	a0,1
80008c3a:	d0cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c3e:	40000613          	li	a2,1024
80008c42:	000a2597          	auipc	a1,0xa2
80008c46:	4d258593          	addi	a1,a1,1234 # 800ab114 <d.30>
80008c4a:	854a                	mv	a0,s2
80008c4c:	f65f70ef          	jal	80000bb0 <memmove>
      return 1;
80008c50:	4505                	li	a0,1
80008c52:	cf4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c56:	40000613          	li	a2,1024
80008c5a:	000a3597          	auipc	a1,0xa3
80008c5e:	8ba58593          	addi	a1,a1,-1862 # 800ab514 <d.29>
80008c62:	854a                	mv	a0,s2
80008c64:	f4df70ef          	jal	80000bb0 <memmove>
      return 1;
80008c68:	4505                	li	a0,1
80008c6a:	cdcfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c6e:	40000613          	li	a2,1024
80008c72:	000a3597          	auipc	a1,0xa3
80008c76:	ca258593          	addi	a1,a1,-862 # 800ab914 <d.28>
80008c7a:	854a                	mv	a0,s2
80008c7c:	f35f70ef          	jal	80000bb0 <memmove>
      return 1;
80008c80:	4505                	li	a0,1
80008c82:	cc4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c86:	40000613          	li	a2,1024
80008c8a:	000a3597          	auipc	a1,0xa3
80008c8e:	08a58593          	addi	a1,a1,138 # 800abd14 <d.27>
80008c92:	854a                	mv	a0,s2
80008c94:	f1df70ef          	jal	80000bb0 <memmove>
      return 1;
80008c98:	4505                	li	a0,1
80008c9a:	cacfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008c9e:	40000613          	li	a2,1024
80008ca2:	000a3597          	auipc	a1,0xa3
80008ca6:	47258593          	addi	a1,a1,1138 # 800ac114 <d.26>
80008caa:	854a                	mv	a0,s2
80008cac:	f05f70ef          	jal	80000bb0 <memmove>
      return 1;
80008cb0:	4505                	li	a0,1
80008cb2:	c94fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008cb6:	40000613          	li	a2,1024
80008cba:	000a4597          	auipc	a1,0xa4
80008cbe:	85a58593          	addi	a1,a1,-1958 # 800ac514 <d.25>
80008cc2:	854a                	mv	a0,s2
80008cc4:	eedf70ef          	jal	80000bb0 <memmove>
      return 1;
80008cc8:	4505                	li	a0,1
80008cca:	c7cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008cce:	40000613          	li	a2,1024
80008cd2:	000a4597          	auipc	a1,0xa4
80008cd6:	c4258593          	addi	a1,a1,-958 # 800ac914 <d.24>
80008cda:	854a                	mv	a0,s2
80008cdc:	ed5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008ce0:	4505                	li	a0,1
80008ce2:	c64fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008ce6:	40000613          	li	a2,1024
80008cea:	000a4597          	auipc	a1,0xa4
80008cee:	02a58593          	addi	a1,a1,42 # 800acd14 <d.23>
80008cf2:	854a                	mv	a0,s2
80008cf4:	ebdf70ef          	jal	80000bb0 <memmove>
      return 1;
80008cf8:	4505                	li	a0,1
80008cfa:	c4cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008cfe:	40000613          	li	a2,1024
80008d02:	000a4597          	auipc	a1,0xa4
80008d06:	41258593          	addi	a1,a1,1042 # 800ad114 <d.22>
80008d0a:	854a                	mv	a0,s2
80008d0c:	ea5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008d10:	4505                	li	a0,1
80008d12:	c34fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008d16:	40000613          	li	a2,1024
80008d1a:	000a4597          	auipc	a1,0xa4
80008d1e:	7fa58593          	addi	a1,a1,2042 # 800ad514 <d.21>
80008d22:	854a                	mv	a0,s2
80008d24:	e8df70ef          	jal	80000bb0 <memmove>
      return 1;
80008d28:	4505                	li	a0,1
80008d2a:	c1cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008d2e:	40000613          	li	a2,1024
80008d32:	000a5597          	auipc	a1,0xa5
80008d36:	be258593          	addi	a1,a1,-1054 # 800ad914 <d.20>
80008d3a:	854a                	mv	a0,s2
80008d3c:	e75f70ef          	jal	80000bb0 <memmove>
      return 1;
80008d40:	4505                	li	a0,1
80008d42:	c04fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008d46:	40000613          	li	a2,1024
80008d4a:	000a5597          	auipc	a1,0xa5
80008d4e:	fca58593          	addi	a1,a1,-54 # 800add14 <d.19>
80008d52:	854a                	mv	a0,s2
80008d54:	e5df70ef          	jal	80000bb0 <memmove>
      return 1;
80008d58:	4505                	li	a0,1
80008d5a:	becfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008d5e:	40000613          	li	a2,1024
80008d62:	000a5597          	auipc	a1,0xa5
80008d66:	3b258593          	addi	a1,a1,946 # 800ae114 <d.18>
80008d6a:	854a                	mv	a0,s2
80008d6c:	e45f70ef          	jal	80000bb0 <memmove>
      return 1;
80008d70:	4505                	li	a0,1
80008d72:	bd4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008d76:	40000613          	li	a2,1024
80008d7a:	000a5597          	auipc	a1,0xa5
80008d7e:	79a58593          	addi	a1,a1,1946 # 800ae514 <d.17>
80008d82:	854a                	mv	a0,s2
80008d84:	e2df70ef          	jal	80000bb0 <memmove>
      return 1;
80008d88:	4505                	li	a0,1
80008d8a:	bbcfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008d8e:	40000613          	li	a2,1024
80008d92:	000a6597          	auipc	a1,0xa6
80008d96:	b8258593          	addi	a1,a1,-1150 # 800ae914 <d.16>
80008d9a:	854a                	mv	a0,s2
80008d9c:	e15f70ef          	jal	80000bb0 <memmove>
      return 1;
80008da0:	4505                	li	a0,1
80008da2:	ba4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008da6:	40000613          	li	a2,1024
80008daa:	000a6597          	auipc	a1,0xa6
80008dae:	f6a58593          	addi	a1,a1,-150 # 800aed14 <d.15>
80008db2:	854a                	mv	a0,s2
80008db4:	dfdf70ef          	jal	80000bb0 <memmove>
      return 1;
80008db8:	4505                	li	a0,1
80008dba:	b8cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008dbe:	40000613          	li	a2,1024
80008dc2:	000a6597          	auipc	a1,0xa6
80008dc6:	35258593          	addi	a1,a1,850 # 800af114 <d.14>
80008dca:	854a                	mv	a0,s2
80008dcc:	de5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008dd0:	4505                	li	a0,1
80008dd2:	b74fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008dd6:	40000613          	li	a2,1024
80008dda:	000a6597          	auipc	a1,0xa6
80008dde:	73a58593          	addi	a1,a1,1850 # 800af514 <d.13>
80008de2:	854a                	mv	a0,s2
80008de4:	dcdf70ef          	jal	80000bb0 <memmove>
      return 1;
80008de8:	4505                	li	a0,1
80008dea:	b5cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008dee:	40000613          	li	a2,1024
80008df2:	000a7597          	auipc	a1,0xa7
80008df6:	b2258593          	addi	a1,a1,-1246 # 800af914 <d.12>
80008dfa:	854a                	mv	a0,s2
80008dfc:	db5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008e00:	4505                	li	a0,1
80008e02:	b44fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e06:	40000613          	li	a2,1024
80008e0a:	000a7597          	auipc	a1,0xa7
80008e0e:	f0a58593          	addi	a1,a1,-246 # 800afd14 <d.11>
80008e12:	854a                	mv	a0,s2
80008e14:	d9df70ef          	jal	80000bb0 <memmove>
      return 1;
80008e18:	4505                	li	a0,1
80008e1a:	b2cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e1e:	40000613          	li	a2,1024
80008e22:	000a7597          	auipc	a1,0xa7
80008e26:	2f258593          	addi	a1,a1,754 # 800b0114 <d.10>
80008e2a:	854a                	mv	a0,s2
80008e2c:	d85f70ef          	jal	80000bb0 <memmove>
      return 1;
80008e30:	4505                	li	a0,1
80008e32:	b14fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e36:	40000613          	li	a2,1024
80008e3a:	000a7597          	auipc	a1,0xa7
80008e3e:	6da58593          	addi	a1,a1,1754 # 800b0514 <d.9>
80008e42:	854a                	mv	a0,s2
80008e44:	d6df70ef          	jal	80000bb0 <memmove>
      return 1;
80008e48:	4505                	li	a0,1
80008e4a:	afcfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e4e:	40000613          	li	a2,1024
80008e52:	000a8597          	auipc	a1,0xa8
80008e56:	ac258593          	addi	a1,a1,-1342 # 800b0914 <d.8>
80008e5a:	854a                	mv	a0,s2
80008e5c:	d55f70ef          	jal	80000bb0 <memmove>
      return 1;
80008e60:	4505                	li	a0,1
80008e62:	ae4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e66:	40000613          	li	a2,1024
80008e6a:	000a8597          	auipc	a1,0xa8
80008e6e:	eaa58593          	addi	a1,a1,-342 # 800b0d14 <d.7>
80008e72:	854a                	mv	a0,s2
80008e74:	d3df70ef          	jal	80000bb0 <memmove>
      return 1;
80008e78:	4505                	li	a0,1
80008e7a:	accfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e7e:	40000613          	li	a2,1024
80008e82:	000a8597          	auipc	a1,0xa8
80008e86:	29258593          	addi	a1,a1,658 # 800b1114 <d.6>
80008e8a:	854a                	mv	a0,s2
80008e8c:	d25f70ef          	jal	80000bb0 <memmove>
      return 1;
80008e90:	4505                	li	a0,1
80008e92:	ab4fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008e96:	40000613          	li	a2,1024
80008e9a:	000a8597          	auipc	a1,0xa8
80008e9e:	67a58593          	addi	a1,a1,1658 # 800b1514 <d.5>
80008ea2:	854a                	mv	a0,s2
80008ea4:	d0df70ef          	jal	80000bb0 <memmove>
      return 1;
80008ea8:	4505                	li	a0,1
80008eaa:	a9cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008eae:	40000613          	li	a2,1024
80008eb2:	000a9597          	auipc	a1,0xa9
80008eb6:	a6258593          	addi	a1,a1,-1438 # 800b1914 <d.4>
80008eba:	854a                	mv	a0,s2
80008ebc:	cf5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008ec0:	4505                	li	a0,1
80008ec2:	a84fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008ec6:	40000613          	li	a2,1024
80008eca:	000a9597          	auipc	a1,0xa9
80008ece:	e4a58593          	addi	a1,a1,-438 # 800b1d14 <d.3>
80008ed2:	854a                	mv	a0,s2
80008ed4:	cddf70ef          	jal	80000bb0 <memmove>
      return 1;
80008ed8:	4505                	li	a0,1
80008eda:	a6cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008ede:	40000613          	li	a2,1024
80008ee2:	000a9597          	auipc	a1,0xa9
80008ee6:	23258593          	addi	a1,a1,562 # 800b2114 <d.2>
80008eea:	854a                	mv	a0,s2
80008eec:	cc5f70ef          	jal	80000bb0 <memmove>
      return 1;
80008ef0:	4505                	li	a0,1
80008ef2:	a54fc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008ef6:	40000613          	li	a2,1024
80008efa:	000a9597          	auipc	a1,0xa9
80008efe:	61a58593          	addi	a1,a1,1562 # 800b2514 <d.1>
80008f02:	854a                	mv	a0,s2
80008f04:	cadf70ef          	jal	80000bb0 <memmove>
      return 1;
80008f08:	4505                	li	a0,1
80008f0a:	a3cfc06f          	j	80005146 <stubs_get_block+0x58>
      memmove(buf, d, BSIZE);
80008f0e:	40000613          	li	a2,1024
80008f12:	000aa597          	auipc	a1,0xaa
80008f16:	a0258593          	addi	a1,a1,-1534 # 800b2914 <d.0>
80008f1a:	854a                	mv	a0,s2
80008f1c:	c95f70ef          	jal	80000bb0 <memmove>
      return 1;
80008f20:	4505                	li	a0,1
80008f22:	a24fc06f          	j	80005146 <stubs_get_block+0x58>
  switch (blockno) {
80008f26:	4505                	li	a0,1
80008f28:	a1efc06f          	j	80005146 <stubs_get_block+0x58>

80008f2c <stubs_write_block>:
// Write-cache: stores written block data.
#define STUBS_WCACHE_SIZE 32
static struct { uint blockno; uchar data[BSIZE]; int valid; } stubs_wcache[STUBS_WCACHE_SIZE];
static int stubs_wcache_init = 0;

void stubs_write_block(uint blockno, uchar *data) {
80008f2c:	1101                	addi	sp,sp,-32
80008f2e:	ce06                	sw	ra,28(sp)
80008f30:	cc22                	sw	s0,24(sp)
80008f32:	ca26                	sw	s1,20(sp)
80008f34:	c84a                	sw	s2,16(sp)
80008f36:	c64e                	sw	s3,12(sp)
80008f38:	1000                	addi	s0,sp,32
  if (!stubs_wcache_init) {
80008f3a:	000aa797          	auipc	a5,0xaa
80008f3e:	f7e7a783          	lw	a5,-130(a5) # 800b2eb8 <stubs_wcache_init>
80008f42:	e785                	bnez	a5,80008f6a <stubs_write_block+0x3e>
80008f44:	000c0797          	auipc	a5,0xc0
80008f48:	93c78793          	addi	a5,a5,-1732 # 800c8880 <stubs_wcache+0x404>
80008f4c:	000c8717          	auipc	a4,0xc8
80008f50:	a3470713          	addi	a4,a4,-1484 # 800d0980 <end+0x404>
    for (int i = 0; i < STUBS_WCACHE_SIZE; i++) stubs_wcache[i].valid = 0;
80008f54:	0007a023          	sw	zero,0(a5)
80008f58:	40878793          	addi	a5,a5,1032
80008f5c:	fee79ce3          	bne	a5,a4,80008f54 <stubs_write_block+0x28>
    stubs_wcache_init = 1;
80008f60:	4785                	li	a5,1
80008f62:	000aa717          	auipc	a4,0xaa
80008f66:	f4f72b23          	sw	a5,-170(a4) # 800b2eb8 <stubs_wcache_init>
  }
  int slot = -1;
  for (int i = 0; i < STUBS_WCACHE_SIZE; i++) {
80008f6a:	000bf797          	auipc	a5,0xbf
80008f6e:	51278793          	addi	a5,a5,1298 # 800c847c <stubs_wcache>
80008f72:	4701                	li	a4,0
  int slot = -1;
80008f74:	587d                	li	a6,-1
  for (int i = 0; i < STUBS_WCACHE_SIZE; i++) {
80008f76:	02000613          	li	a2,32
80008f7a:	a801                	j	80008f8a <stubs_write_block+0x5e>
    if (stubs_wcache[i].valid && stubs_wcache[i].blockno == blockno) { slot = i; break; }
    if (!stubs_wcache[i].valid && slot < 0) slot = i;
80008f7c:	06084463          	bltz	a6,80008fe4 <stubs_write_block+0xb8>
  for (int i = 0; i < STUBS_WCACHE_SIZE; i++) {
80008f80:	0705                	addi	a4,a4,1
80008f82:	40878793          	addi	a5,a5,1032
80008f86:	00c70963          	beq	a4,a2,80008f98 <stubs_write_block+0x6c>
    if (stubs_wcache[i].valid && stubs_wcache[i].blockno == blockno) { slot = i; break; }
80008f8a:	4047a683          	lw	a3,1028(a5)
80008f8e:	d6fd                	beqz	a3,80008f7c <stubs_write_block+0x50>
80008f90:	4394                	lw	a3,0(a5)
80008f92:	fea697e3          	bne	a3,a0,80008f80 <stubs_write_block+0x54>
80008f96:	883a                	mv	a6,a4
  }
  if (slot < 0) slot = 0; // evict first
80008f98:	fff84793          	not	a5,a6
80008f9c:	87fd                	srai	a5,a5,0x1f
80008f9e:	00f874b3          	and	s1,a6,a5
  stubs_wcache[slot].blockno = blockno;
80008fa2:	000bf997          	auipc	s3,0xbf
80008fa6:	4da98993          	addi	s3,s3,1242 # 800c847c <stubs_wcache>
80008faa:	00749913          	slli	s2,s1,0x7
80008fae:	009907b3          	add	a5,s2,s1
80008fb2:	078e                	slli	a5,a5,0x3
80008fb4:	97ce                	add	a5,a5,s3
80008fb6:	c388                	sw	a0,0(a5)
  memmove(stubs_wcache[slot].data, data, BSIZE);
80008fb8:	00990533          	add	a0,s2,s1
80008fbc:	050e                	slli	a0,a0,0x3
80008fbe:	0511                	addi	a0,a0,4
80008fc0:	40000613          	li	a2,1024
80008fc4:	954e                	add	a0,a0,s3
80008fc6:	bebf70ef          	jal	80000bb0 <memmove>
  stubs_wcache[slot].valid = 1;
80008fca:	9926                	add	s2,s2,s1
80008fcc:	090e                	slli	s2,s2,0x3
80008fce:	99ca                	add	s3,s3,s2
80008fd0:	4785                	li	a5,1
80008fd2:	40f9a223          	sw	a5,1028(s3)
}
80008fd6:	40f2                	lw	ra,28(sp)
80008fd8:	4462                	lw	s0,24(sp)
80008fda:	44d2                	lw	s1,20(sp)
80008fdc:	4942                	lw	s2,16(sp)
80008fde:	49b2                	lw	s3,12(sp)
80008fe0:	6105                	addi	sp,sp,32
80008fe2:	8082                	ret
    if (!stubs_wcache[i].valid && slot < 0) slot = i;
80008fe4:	883a                	mv	a6,a4
80008fe6:	bf69                	j	80008f80 <stubs_write_block+0x54>

80008fe8 <stubs_read_block>:

int stubs_read_block(uint blockno, uchar *data) {
80008fe8:	882a                	mv	a6,a0
  if (!stubs_wcache_init) return 0;
80008fea:	000aa517          	auipc	a0,0xaa
80008fee:	ece52503          	lw	a0,-306(a0) # 800b2eb8 <stubs_wcache_init>
80008ff2:	cd31                	beqz	a0,8000904e <stubs_read_block+0x66>
80008ff4:	88ae                	mv	a7,a1
80008ff6:	000bf797          	auipc	a5,0xbf
80008ffa:	48678793          	addi	a5,a5,1158 # 800c847c <stubs_wcache>
  for (int i = 0; i < STUBS_WCACHE_SIZE; i++) {
80008ffe:	4701                	li	a4,0
80009000:	02000613          	li	a2,32
80009004:	a031                	j	80009010 <stubs_read_block+0x28>
80009006:	0705                	addi	a4,a4,1
80009008:	40878793          	addi	a5,a5,1032
8000900c:	02c70f63          	beq	a4,a2,8000904a <stubs_read_block+0x62>
    if (stubs_wcache[i].valid && stubs_wcache[i].blockno == blockno) {
80009010:	4047a683          	lw	a3,1028(a5)
80009014:	daed                	beqz	a3,80009006 <stubs_read_block+0x1e>
80009016:	4394                	lw	a3,0(a5)
80009018:	ff0697e3          	bne	a3,a6,80009006 <stubs_read_block+0x1e>
int stubs_read_block(uint blockno, uchar *data) {
8000901c:	1141                	addi	sp,sp,-16
8000901e:	c606                	sw	ra,12(sp)
80009020:	c422                	sw	s0,8(sp)
80009022:	0800                	addi	s0,sp,16
      memmove(data, stubs_wcache[i].data, BSIZE);
80009024:	00771793          	slli	a5,a4,0x7
80009028:	97ba                	add	a5,a5,a4
8000902a:	078e                	slli	a5,a5,0x3
8000902c:	40000613          	li	a2,1024
80009030:	000bf597          	auipc	a1,0xbf
80009034:	45058593          	addi	a1,a1,1104 # 800c8480 <stubs_wcache+0x4>
80009038:	95be                	add	a1,a1,a5
8000903a:	8546                	mv	a0,a7
8000903c:	b75f70ef          	jal	80000bb0 <memmove>
      return 1;
80009040:	4505                	li	a0,1
    }
  }
  return 0;
}
80009042:	40b2                	lw	ra,12(sp)
80009044:	4422                	lw	s0,8(sp)
80009046:	0141                	addi	sp,sp,16
80009048:	8082                	ret
  return 0;
8000904a:	4501                	li	a0,0
8000904c:	8082                	ret
}
8000904e:	8082                	ret

80009050 <plicinit>:
#include "buf.h"
#include "stubs_data.h"

void
plicinit(void)
{
80009050:	1141                	addi	sp,sp,-16
80009052:	c622                	sw	s0,12(sp)
80009054:	0800                	addi	s0,sp,16
}
80009056:	4432                	lw	s0,12(sp)
80009058:	0141                	addi	sp,sp,16
8000905a:	8082                	ret

8000905c <plicinithart>:

void
plicinithart(void)
{
8000905c:	1141                	addi	sp,sp,-16
8000905e:	c622                	sw	s0,12(sp)
80009060:	0800                	addi	s0,sp,16
}
80009062:	4432                	lw	s0,12(sp)
80009064:	0141                	addi	sp,sp,16
80009066:	8082                	ret

80009068 <plic_claim>:

int
plic_claim(void)
{
80009068:	1141                	addi	sp,sp,-16
8000906a:	c622                	sw	s0,12(sp)
8000906c:	0800                	addi	s0,sp,16
  return 0;
}
8000906e:	4501                	li	a0,0
80009070:	4432                	lw	s0,12(sp)
80009072:	0141                	addi	sp,sp,16
80009074:	8082                	ret

80009076 <plic_complete>:

void
plic_complete(int irq)
{
80009076:	1141                	addi	sp,sp,-16
80009078:	c622                	sw	s0,12(sp)
8000907a:	0800                	addi	s0,sp,16
}
8000907c:	4432                	lw	s0,12(sp)
8000907e:	0141                	addi	sp,sp,16
80009080:	8082                	ret

80009082 <virtio_disk_init>:

void
virtio_disk_init(void)
{
80009082:	1141                	addi	sp,sp,-16
80009084:	c622                	sw	s0,12(sp)
80009086:	0800                	addi	s0,sp,16
  // All initialization is in the pre-computed data.
  // The superblock (block 1) is already available in stubs_data.h,
  // so fsinit() can read it directly without extra setup.
}
80009088:	4432                	lw	s0,12(sp)
8000908a:	0141                	addi	sp,sp,16
8000908c:	8082                	ret

8000908e <virtio_disk_rw>:

void
virtio_disk_rw(struct buf *b, int write)
{
8000908e:	1141                	addi	sp,sp,-16
80009090:	c606                	sw	ra,12(sp)
80009092:	c422                	sw	s0,8(sp)
80009094:	c04a                	sw	s2,0(sp)
80009096:	0800                	addi	s0,sp,16
  uint blockno = b->blockno;
80009098:	00c52903          	lw	s2,12(a0)

  if (blockno >= FSSIZE) {
8000909c:	7cf00793          	li	a5,1999
800090a0:	0127ec63          	bltu	a5,s2,800090b8 <virtio_disk_rw+0x2a>
    memset(b->data, 0, BSIZE);
    return;
  }

  if (write) {
800090a4:	c195                	beqz	a1,800090c8 <virtio_disk_rw+0x3a>
    stubs_write_block(blockno, b->data);
800090a6:	03450593          	addi	a1,a0,52
800090aa:	854a                	mv	a0,s2
800090ac:	3541                	jal	80008f2c <stubs_write_block>
    if (!stubs_read_block(blockno, b->data)) {
      // Fall back to pre-computed data
      stubs_get_block(blockno, b->data);
    }
  }
}
800090ae:	40b2                	lw	ra,12(sp)
800090b0:	4422                	lw	s0,8(sp)
800090b2:	4902                	lw	s2,0(sp)
800090b4:	0141                	addi	sp,sp,16
800090b6:	8082                	ret
    memset(b->data, 0, BSIZE);
800090b8:	40000613          	li	a2,1024
800090bc:	4581                	li	a1,0
800090be:	03450513          	addi	a0,a0,52
800090c2:	aa3f70ef          	jal	80000b64 <memset>
    return;
800090c6:	b7e5                	j	800090ae <virtio_disk_rw+0x20>
800090c8:	c226                	sw	s1,4(sp)
    if (!stubs_read_block(blockno, b->data)) {
800090ca:	03450493          	addi	s1,a0,52
800090ce:	85a6                	mv	a1,s1
800090d0:	854a                	mv	a0,s2
800090d2:	3f19                	jal	80008fe8 <stubs_read_block>
800090d4:	c119                	beqz	a0,800090da <virtio_disk_rw+0x4c>
800090d6:	4492                	lw	s1,4(sp)
800090d8:	bfd9                	j	800090ae <virtio_disk_rw+0x20>
      stubs_get_block(blockno, b->data);
800090da:	85a6                	mv	a1,s1
800090dc:	854a                	mv	a0,s2
800090de:	810fc0ef          	jal	800050ee <stubs_get_block>
800090e2:	4492                	lw	s1,4(sp)
800090e4:	b7e9                	j	800090ae <virtio_disk_rw+0x20>

800090e6 <virtio_disk_intr>:

void
virtio_disk_intr(void)
{
800090e6:	1141                	addi	sp,sp,-16
800090e8:	c622                	sw	s0,12(sp)
800090ea:	0800                	addi	s0,sp,16
  // No virtio interrupts.
}
800090ec:	4432                	lw	s0,12(sp)
800090ee:	0141                	addi	sp,sp,16
800090f0:	8082                	ret

800090f2 <__udivdi3>:
800090f2:	88aa                	mv	a7,a0
800090f4:	832e                	mv	t1,a1
800090f6:	8732                	mv	a4,a2
800090f8:	882a                	mv	a6,a0
800090fa:	87ae                	mv	a5,a1
800090fc:	20069663          	bnez	a3,80009308 <__udivdi3+0x216>
80009100:	000aa597          	auipc	a1,0xaa
80009104:	c1458593          	addi	a1,a1,-1004 # 800b2d14 <__clz_tab>
80009108:	0cc37163          	bgeu	t1,a2,800091ca <__udivdi3+0xd8>
8000910c:	66c1                	lui	a3,0x10
8000910e:	0ad67763          	bgeu	a2,a3,800091bc <__udivdi3+0xca>
80009112:	10063693          	sltiu	a3,a2,256
80009116:	0016b693          	seqz	a3,a3
8000911a:	068e                	slli	a3,a3,0x3
8000911c:	00d65533          	srl	a0,a2,a3
80009120:	95aa                	add	a1,a1,a0
80009122:	0005c583          	lbu	a1,0(a1)
80009126:	02000513          	li	a0,32
8000912a:	96ae                	add	a3,a3,a1
8000912c:	40d505b3          	sub	a1,a0,a3
80009130:	00d50b63          	beq	a0,a3,80009146 <__udivdi3+0x54>
80009134:	00b317b3          	sll	a5,t1,a1
80009138:	00d8d6b3          	srl	a3,a7,a3
8000913c:	00b61733          	sll	a4,a2,a1
80009140:	8fd5                	or	a5,a5,a3
80009142:	00b89833          	sll	a6,a7,a1
80009146:	01075593          	srli	a1,a4,0x10
8000914a:	02b7d333          	divu	t1,a5,a1
8000914e:	01071613          	slli	a2,a4,0x10
80009152:	8241                	srli	a2,a2,0x10
80009154:	02b7f7b3          	remu	a5,a5,a1
80009158:	851a                	mv	a0,t1
8000915a:	026608b3          	mul	a7,a2,t1
8000915e:	01079693          	slli	a3,a5,0x10
80009162:	01085793          	srli	a5,a6,0x10
80009166:	8fd5                	or	a5,a5,a3
80009168:	0117fc63          	bgeu	a5,a7,80009180 <__udivdi3+0x8e>
8000916c:	97ba                	add	a5,a5,a4
8000916e:	fff30513          	addi	a0,t1,-1
80009172:	00e7e763          	bltu	a5,a4,80009180 <__udivdi3+0x8e>
80009176:	0117f563          	bgeu	a5,a7,80009180 <__udivdi3+0x8e>
8000917a:	ffe30513          	addi	a0,t1,-2
8000917e:	97ba                	add	a5,a5,a4
80009180:	411787b3          	sub	a5,a5,a7
80009184:	02b7d8b3          	divu	a7,a5,a1
80009188:	0842                	slli	a6,a6,0x10
8000918a:	01085813          	srli	a6,a6,0x10
8000918e:	02b7f7b3          	remu	a5,a5,a1
80009192:	031606b3          	mul	a3,a2,a7
80009196:	07c2                	slli	a5,a5,0x10
80009198:	00f86833          	or	a6,a6,a5
8000919c:	87c6                	mv	a5,a7
8000919e:	00d87b63          	bgeu	a6,a3,800091b4 <__udivdi3+0xc2>
800091a2:	983a                	add	a6,a6,a4
800091a4:	fff88793          	addi	a5,a7,-1
800091a8:	00e86663          	bltu	a6,a4,800091b4 <__udivdi3+0xc2>
800091ac:	00d87463          	bgeu	a6,a3,800091b4 <__udivdi3+0xc2>
800091b0:	ffe88793          	addi	a5,a7,-2
800091b4:	0542                	slli	a0,a0,0x10
800091b6:	8d5d                	or	a0,a0,a5
800091b8:	4581                	li	a1,0
800091ba:	8082                	ret
800091bc:	01000537          	lui	a0,0x1000
800091c0:	46e1                	li	a3,24
800091c2:	f4a67de3          	bgeu	a2,a0,8000911c <__udivdi3+0x2a>
800091c6:	46c1                	li	a3,16
800091c8:	bf91                	j	8000911c <__udivdi3+0x2a>
800091ca:	4681                	li	a3,0
800091cc:	ca09                	beqz	a2,800091de <__udivdi3+0xec>
800091ce:	67c1                	lui	a5,0x10
800091d0:	08f67f63          	bgeu	a2,a5,8000926e <__udivdi3+0x17c>
800091d4:	10063693          	sltiu	a3,a2,256
800091d8:	0016b693          	seqz	a3,a3
800091dc:	068e                	slli	a3,a3,0x3
800091de:	00d657b3          	srl	a5,a2,a3
800091e2:	95be                	add	a1,a1,a5
800091e4:	0005c783          	lbu	a5,0(a1)
800091e8:	97b6                	add	a5,a5,a3
800091ea:	02000693          	li	a3,32
800091ee:	40f685b3          	sub	a1,a3,a5
800091f2:	08f69563          	bne	a3,a5,8000927c <__udivdi3+0x18a>
800091f6:	40c307b3          	sub	a5,t1,a2
800091fa:	4585                	li	a1,1
800091fc:	01075893          	srli	a7,a4,0x10
80009200:	0317de33          	divu	t3,a5,a7
80009204:	01071613          	slli	a2,a4,0x10
80009208:	8241                	srli	a2,a2,0x10
8000920a:	01085693          	srli	a3,a6,0x10
8000920e:	0317f7b3          	remu	a5,a5,a7
80009212:	8572                	mv	a0,t3
80009214:	03c60333          	mul	t1,a2,t3
80009218:	07c2                	slli	a5,a5,0x10
8000921a:	8fd5                	or	a5,a5,a3
8000921c:	0067fc63          	bgeu	a5,t1,80009234 <__udivdi3+0x142>
80009220:	97ba                	add	a5,a5,a4
80009222:	fffe0513          	addi	a0,t3,-1
80009226:	00e7e763          	bltu	a5,a4,80009234 <__udivdi3+0x142>
8000922a:	0067f563          	bgeu	a5,t1,80009234 <__udivdi3+0x142>
8000922e:	ffee0513          	addi	a0,t3,-2
80009232:	97ba                	add	a5,a5,a4
80009234:	406787b3          	sub	a5,a5,t1
80009238:	0317d333          	divu	t1,a5,a7
8000923c:	0842                	slli	a6,a6,0x10
8000923e:	01085813          	srli	a6,a6,0x10
80009242:	0317f7b3          	remu	a5,a5,a7
80009246:	026606b3          	mul	a3,a2,t1
8000924a:	07c2                	slli	a5,a5,0x10
8000924c:	00f86833          	or	a6,a6,a5
80009250:	879a                	mv	a5,t1
80009252:	00d87b63          	bgeu	a6,a3,80009268 <__udivdi3+0x176>
80009256:	983a                	add	a6,a6,a4
80009258:	fff30793          	addi	a5,t1,-1
8000925c:	00e86663          	bltu	a6,a4,80009268 <__udivdi3+0x176>
80009260:	00d87463          	bgeu	a6,a3,80009268 <__udivdi3+0x176>
80009264:	ffe30793          	addi	a5,t1,-2
80009268:	0542                	slli	a0,a0,0x10
8000926a:	8d5d                	or	a0,a0,a5
8000926c:	8082                	ret
8000926e:	010007b7          	lui	a5,0x1000
80009272:	46e1                	li	a3,24
80009274:	f6f675e3          	bgeu	a2,a5,800091de <__udivdi3+0xec>
80009278:	46c1                	li	a3,16
8000927a:	b795                	j	800091de <__udivdi3+0xec>
8000927c:	00b61733          	sll	a4,a2,a1
80009280:	00f356b3          	srl	a3,t1,a5
80009284:	01075513          	srli	a0,a4,0x10
80009288:	00b31333          	sll	t1,t1,a1
8000928c:	00f8d7b3          	srl	a5,a7,a5
80009290:	0067e7b3          	or	a5,a5,t1
80009294:	02a6d333          	divu	t1,a3,a0
80009298:	01071613          	slli	a2,a4,0x10
8000929c:	8241                	srli	a2,a2,0x10
8000929e:	00b89833          	sll	a6,a7,a1
800092a2:	02a6f6b3          	remu	a3,a3,a0
800092a6:	026608b3          	mul	a7,a2,t1
800092aa:	01069593          	slli	a1,a3,0x10
800092ae:	0107d693          	srli	a3,a5,0x10
800092b2:	8ecd                	or	a3,a3,a1
800092b4:	859a                	mv	a1,t1
800092b6:	0116fc63          	bgeu	a3,a7,800092ce <__udivdi3+0x1dc>
800092ba:	96ba                	add	a3,a3,a4
800092bc:	fff30593          	addi	a1,t1,-1
800092c0:	00e6e763          	bltu	a3,a4,800092ce <__udivdi3+0x1dc>
800092c4:	0116f563          	bgeu	a3,a7,800092ce <__udivdi3+0x1dc>
800092c8:	ffe30593          	addi	a1,t1,-2
800092cc:	96ba                	add	a3,a3,a4
800092ce:	411686b3          	sub	a3,a3,a7
800092d2:	02a6d8b3          	divu	a7,a3,a0
800092d6:	07c2                	slli	a5,a5,0x10
800092d8:	83c1                	srli	a5,a5,0x10
800092da:	02a6f6b3          	remu	a3,a3,a0
800092de:	03160633          	mul	a2,a2,a7
800092e2:	06c2                	slli	a3,a3,0x10
800092e4:	8fd5                	or	a5,a5,a3
800092e6:	86c6                	mv	a3,a7
800092e8:	00c7fc63          	bgeu	a5,a2,80009300 <__udivdi3+0x20e>
800092ec:	97ba                	add	a5,a5,a4
800092ee:	fff88693          	addi	a3,a7,-1
800092f2:	00e7e763          	bltu	a5,a4,80009300 <__udivdi3+0x20e>
800092f6:	00c7f563          	bgeu	a5,a2,80009300 <__udivdi3+0x20e>
800092fa:	ffe88693          	addi	a3,a7,-2
800092fe:	97ba                	add	a5,a5,a4
80009300:	05c2                	slli	a1,a1,0x10
80009302:	8f91                	sub	a5,a5,a2
80009304:	8dd5                	or	a1,a1,a3
80009306:	bddd                	j	800091fc <__udivdi3+0x10a>
80009308:	14d5e163          	bltu	a1,a3,8000944a <__udivdi3+0x358>
8000930c:	67c1                	lui	a5,0x10
8000930e:	02f6ff63          	bgeu	a3,a5,8000934c <__udivdi3+0x25a>
80009312:	1006b713          	sltiu	a4,a3,256
80009316:	00173713          	seqz	a4,a4
8000931a:	070e                	slli	a4,a4,0x3
8000931c:	00e6d5b3          	srl	a1,a3,a4
80009320:	000aa797          	auipc	a5,0xaa
80009324:	9f478793          	addi	a5,a5,-1548 # 800b2d14 <__clz_tab>
80009328:	97ae                	add	a5,a5,a1
8000932a:	0007c783          	lbu	a5,0(a5)
8000932e:	97ba                	add	a5,a5,a4
80009330:	02000713          	li	a4,32
80009334:	40f705b3          	sub	a1,a4,a5
80009338:	02f71163          	bne	a4,a5,8000935a <__udivdi3+0x268>
8000933c:	4505                	li	a0,1
8000933e:	e666eee3          	bltu	a3,t1,800091ba <__udivdi3+0xc8>
80009342:	00c8b533          	sltu	a0,a7,a2
80009346:	00153513          	seqz	a0,a0
8000934a:	8082                	ret
8000934c:	010007b7          	lui	a5,0x1000
80009350:	4761                	li	a4,24
80009352:	fcf6f5e3          	bgeu	a3,a5,8000931c <__udivdi3+0x22a>
80009356:	4741                	li	a4,16
80009358:	b7d1                	j	8000931c <__udivdi3+0x22a>
8000935a:	00f65733          	srl	a4,a2,a5
8000935e:	00b696b3          	sll	a3,a3,a1
80009362:	8ed9                	or	a3,a3,a4
80009364:	00f35733          	srl	a4,t1,a5
80009368:	00b31333          	sll	t1,t1,a1
8000936c:	00f8d7b3          	srl	a5,a7,a5
80009370:	0067e7b3          	or	a5,a5,t1
80009374:	0106d313          	srli	t1,a3,0x10
80009378:	02675eb3          	divu	t4,a4,t1
8000937c:	01069813          	slli	a6,a3,0x10
80009380:	01085813          	srli	a6,a6,0x10
80009384:	00b61633          	sll	a2,a2,a1
80009388:	02677733          	remu	a4,a4,t1
8000938c:	03d80e33          	mul	t3,a6,t4
80009390:	01071513          	slli	a0,a4,0x10
80009394:	0107d713          	srli	a4,a5,0x10
80009398:	8f49                	or	a4,a4,a0
8000939a:	8576                	mv	a0,t4
8000939c:	01c77c63          	bgeu	a4,t3,800093b4 <__udivdi3+0x2c2>
800093a0:	9736                	add	a4,a4,a3
800093a2:	fffe8513          	addi	a0,t4,-1
800093a6:	00d76763          	bltu	a4,a3,800093b4 <__udivdi3+0x2c2>
800093aa:	01c77563          	bgeu	a4,t3,800093b4 <__udivdi3+0x2c2>
800093ae:	ffee8513          	addi	a0,t4,-2
800093b2:	9736                	add	a4,a4,a3
800093b4:	41c70733          	sub	a4,a4,t3
800093b8:	02675e33          	divu	t3,a4,t1
800093bc:	07c2                	slli	a5,a5,0x10
800093be:	83c1                	srli	a5,a5,0x10
800093c0:	02677733          	remu	a4,a4,t1
800093c4:	03c80833          	mul	a6,a6,t3
800093c8:	0742                	slli	a4,a4,0x10
800093ca:	8fd9                	or	a5,a5,a4
800093cc:	8772                	mv	a4,t3
800093ce:	0107fc63          	bgeu	a5,a6,800093e6 <__udivdi3+0x2f4>
800093d2:	97b6                	add	a5,a5,a3
800093d4:	fffe0713          	addi	a4,t3,-1
800093d8:	00d7e763          	bltu	a5,a3,800093e6 <__udivdi3+0x2f4>
800093dc:	0107f563          	bgeu	a5,a6,800093e6 <__udivdi3+0x2f4>
800093e0:	ffee0713          	addi	a4,t3,-2
800093e4:	97b6                	add	a5,a5,a3
800093e6:	0542                	slli	a0,a0,0x10
800093e8:	6e41                	lui	t3,0x10
800093ea:	8d59                	or	a0,a0,a4
800093ec:	fffe0693          	addi	a3,t3,-1 # ffff <_entry-0x7fff0001>
800093f0:	00d57733          	and	a4,a0,a3
800093f4:	410787b3          	sub	a5,a5,a6
800093f8:	8ef1                	and	a3,a3,a2
800093fa:	01055813          	srli	a6,a0,0x10
800093fe:	8241                	srli	a2,a2,0x10
80009400:	02d70333          	mul	t1,a4,a3
80009404:	02d806b3          	mul	a3,a6,a3
80009408:	02c70733          	mul	a4,a4,a2
8000940c:	02c80833          	mul	a6,a6,a2
80009410:	00d70633          	add	a2,a4,a3
80009414:	01035713          	srli	a4,t1,0x10
80009418:	9732                	add	a4,a4,a2
8000941a:	00d77363          	bgeu	a4,a3,80009420 <__udivdi3+0x32e>
8000941e:	9872                	add	a6,a6,t3
80009420:	01075693          	srli	a3,a4,0x10
80009424:	96c2                	add	a3,a3,a6
80009426:	02d7e063          	bltu	a5,a3,80009446 <__udivdi3+0x354>
8000942a:	d8d797e3          	bne	a5,a3,800091b8 <__udivdi3+0xc6>
8000942e:	67c1                	lui	a5,0x10
80009430:	17fd                	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
80009432:	8f7d                	and	a4,a4,a5
80009434:	0742                	slli	a4,a4,0x10
80009436:	00f37333          	and	t1,t1,a5
8000943a:	00b898b3          	sll	a7,a7,a1
8000943e:	971a                	add	a4,a4,t1
80009440:	4581                	li	a1,0
80009442:	d6e8fce3          	bgeu	a7,a4,800091ba <__udivdi3+0xc8>
80009446:	157d                	addi	a0,a0,-1 # ffffff <_entry-0x7f000001>
80009448:	bb85                	j	800091b8 <__udivdi3+0xc6>
8000944a:	4581                	li	a1,0
8000944c:	4501                	li	a0,0
8000944e:	8082                	ret

80009450 <__umoddi3>:
80009450:	8832                	mv	a6,a2
80009452:	87aa                	mv	a5,a0
80009454:	872e                	mv	a4,a1
80009456:	1a069363          	bnez	a3,800095fc <__umoddi3+0x1ac>
8000945a:	000aa897          	auipc	a7,0xaa
8000945e:	8ba88893          	addi	a7,a7,-1862 # 800b2d14 <__clz_tab>
80009462:	0ac5f663          	bgeu	a1,a2,8000950e <__umoddi3+0xbe>
80009466:	66c1                	lui	a3,0x10
80009468:	08d67c63          	bgeu	a2,a3,80009500 <__umoddi3+0xb0>
8000946c:	10063693          	sltiu	a3,a2,256
80009470:	0016b693          	seqz	a3,a3
80009474:	068e                	slli	a3,a3,0x3
80009476:	00d65333          	srl	t1,a2,a3
8000947a:	989a                	add	a7,a7,t1
8000947c:	0008c883          	lbu	a7,0(a7)
80009480:	02000313          	li	t1,32
80009484:	96c6                	add	a3,a3,a7
80009486:	40d308b3          	sub	a7,t1,a3
8000948a:	00d30b63          	beq	t1,a3,800094a0 <__umoddi3+0x50>
8000948e:	01159733          	sll	a4,a1,a7
80009492:	00d556b3          	srl	a3,a0,a3
80009496:	01161833          	sll	a6,a2,a7
8000949a:	8f55                	or	a4,a4,a3
8000949c:	011517b3          	sll	a5,a0,a7
800094a0:	01085613          	srli	a2,a6,0x10
800094a4:	02c756b3          	divu	a3,a4,a2
800094a8:	01081513          	slli	a0,a6,0x10
800094ac:	8141                	srli	a0,a0,0x10
800094ae:	02c77733          	remu	a4,a4,a2
800094b2:	02a686b3          	mul	a3,a3,a0
800094b6:	01071593          	slli	a1,a4,0x10
800094ba:	0107d713          	srli	a4,a5,0x10
800094be:	8f4d                	or	a4,a4,a1
800094c0:	00d77863          	bgeu	a4,a3,800094d0 <__umoddi3+0x80>
800094c4:	9742                	add	a4,a4,a6
800094c6:	01076563          	bltu	a4,a6,800094d0 <__umoddi3+0x80>
800094ca:	00d77363          	bgeu	a4,a3,800094d0 <__umoddi3+0x80>
800094ce:	9742                	add	a4,a4,a6
800094d0:	8f15                	sub	a4,a4,a3
800094d2:	02c756b3          	divu	a3,a4,a2
800094d6:	02c77733          	remu	a4,a4,a2
800094da:	02a686b3          	mul	a3,a3,a0
800094de:	07c2                	slli	a5,a5,0x10
800094e0:	0742                	slli	a4,a4,0x10
800094e2:	83c1                	srli	a5,a5,0x10
800094e4:	8fd9                	or	a5,a5,a4
800094e6:	00d7f863          	bgeu	a5,a3,800094f6 <__umoddi3+0xa6>
800094ea:	97c2                	add	a5,a5,a6
800094ec:	0107e563          	bltu	a5,a6,800094f6 <__umoddi3+0xa6>
800094f0:	00d7f363          	bgeu	a5,a3,800094f6 <__umoddi3+0xa6>
800094f4:	97c2                	add	a5,a5,a6
800094f6:	8f95                	sub	a5,a5,a3
800094f8:	0117d533          	srl	a0,a5,a7
800094fc:	4581                	li	a1,0
800094fe:	8082                	ret
80009500:	01000337          	lui	t1,0x1000
80009504:	46e1                	li	a3,24
80009506:	f66678e3          	bgeu	a2,t1,80009476 <__umoddi3+0x26>
8000950a:	46c1                	li	a3,16
8000950c:	b7ad                	j	80009476 <__umoddi3+0x26>
8000950e:	4681                	li	a3,0
80009510:	ca09                	beqz	a2,80009522 <__umoddi3+0xd2>
80009512:	6741                	lui	a4,0x10
80009514:	06e67463          	bgeu	a2,a4,8000957c <__umoddi3+0x12c>
80009518:	10063693          	sltiu	a3,a2,256
8000951c:	0016b693          	seqz	a3,a3
80009520:	068e                	slli	a3,a3,0x3
80009522:	00d65733          	srl	a4,a2,a3
80009526:	98ba                	add	a7,a7,a4
80009528:	0008c703          	lbu	a4,0(a7)
8000952c:	9736                	add	a4,a4,a3
8000952e:	02000693          	li	a3,32
80009532:	40e688b3          	sub	a7,a3,a4
80009536:	04e69a63          	bne	a3,a4,8000958a <__umoddi3+0x13a>
8000953a:	40c58733          	sub	a4,a1,a2
8000953e:	01085593          	srli	a1,a6,0x10
80009542:	02b75633          	divu	a2,a4,a1
80009546:	01081513          	slli	a0,a6,0x10
8000954a:	8141                	srli	a0,a0,0x10
8000954c:	0107d693          	srli	a3,a5,0x10
80009550:	02b77733          	remu	a4,a4,a1
80009554:	02a60633          	mul	a2,a2,a0
80009558:	0742                	slli	a4,a4,0x10
8000955a:	8f55                	or	a4,a4,a3
8000955c:	00c77863          	bgeu	a4,a2,8000956c <__umoddi3+0x11c>
80009560:	9742                	add	a4,a4,a6
80009562:	01076563          	bltu	a4,a6,8000956c <__umoddi3+0x11c>
80009566:	00c77363          	bgeu	a4,a2,8000956c <__umoddi3+0x11c>
8000956a:	9742                	add	a4,a4,a6
8000956c:	8f11                	sub	a4,a4,a2
8000956e:	02b756b3          	divu	a3,a4,a1
80009572:	02b77733          	remu	a4,a4,a1
80009576:	02a686b3          	mul	a3,a3,a0
8000957a:	b795                	j	800094de <__umoddi3+0x8e>
8000957c:	01000737          	lui	a4,0x1000
80009580:	46e1                	li	a3,24
80009582:	fae670e3          	bgeu	a2,a4,80009522 <__umoddi3+0xd2>
80009586:	46c1                	li	a3,16
80009588:	bf69                	j	80009522 <__umoddi3+0xd2>
8000958a:	01161833          	sll	a6,a2,a7
8000958e:	00e5d6b3          	srl	a3,a1,a4
80009592:	011517b3          	sll	a5,a0,a7
80009596:	011595b3          	sll	a1,a1,a7
8000959a:	00e55733          	srl	a4,a0,a4
8000959e:	01085513          	srli	a0,a6,0x10
800095a2:	8f4d                	or	a4,a4,a1
800095a4:	02a6d5b3          	divu	a1,a3,a0
800095a8:	01081313          	slli	t1,a6,0x10
800095ac:	01035313          	srli	t1,t1,0x10
800095b0:	02a6f6b3          	remu	a3,a3,a0
800095b4:	026585b3          	mul	a1,a1,t1
800095b8:	01069613          	slli	a2,a3,0x10
800095bc:	01075693          	srli	a3,a4,0x10
800095c0:	8ed1                	or	a3,a3,a2
800095c2:	00b6f863          	bgeu	a3,a1,800095d2 <__umoddi3+0x182>
800095c6:	96c2                	add	a3,a3,a6
800095c8:	0106e563          	bltu	a3,a6,800095d2 <__umoddi3+0x182>
800095cc:	00b6f363          	bgeu	a3,a1,800095d2 <__umoddi3+0x182>
800095d0:	96c2                	add	a3,a3,a6
800095d2:	8e8d                	sub	a3,a3,a1
800095d4:	02a6d633          	divu	a2,a3,a0
800095d8:	0742                	slli	a4,a4,0x10
800095da:	8341                	srli	a4,a4,0x10
800095dc:	02a6f6b3          	remu	a3,a3,a0
800095e0:	02660633          	mul	a2,a2,t1
800095e4:	06c2                	slli	a3,a3,0x10
800095e6:	8f55                	or	a4,a4,a3
800095e8:	00c77863          	bgeu	a4,a2,800095f8 <__umoddi3+0x1a8>
800095ec:	9742                	add	a4,a4,a6
800095ee:	01076563          	bltu	a4,a6,800095f8 <__umoddi3+0x1a8>
800095f2:	00c77363          	bgeu	a4,a2,800095f8 <__umoddi3+0x1a8>
800095f6:	9742                	add	a4,a4,a6
800095f8:	8f11                	sub	a4,a4,a2
800095fa:	b791                	j	8000953e <__umoddi3+0xee>
800095fc:	16d5ed63          	bltu	a1,a3,80009776 <__umoddi3+0x326>
80009600:	6841                	lui	a6,0x10
80009602:	0506f763          	bgeu	a3,a6,80009650 <__umoddi3+0x200>
80009606:	1006b813          	sltiu	a6,a3,256
8000960a:	00183813          	seqz	a6,a6
8000960e:	080e                	slli	a6,a6,0x3
80009610:	0106d333          	srl	t1,a3,a6
80009614:	000a9897          	auipc	a7,0xa9
80009618:	70088893          	addi	a7,a7,1792 # 800b2d14 <__clz_tab>
8000961c:	989a                	add	a7,a7,t1
8000961e:	0008c883          	lbu	a7,0(a7)
80009622:	02000313          	li	t1,32
80009626:	98c2                	add	a7,a7,a6
80009628:	41130833          	sub	a6,t1,a7
8000962c:	03131963          	bne	t1,a7,8000965e <__umoddi3+0x20e>
80009630:	00b6e463          	bltu	a3,a1,80009638 <__umoddi3+0x1e8>
80009634:	00c56b63          	bltu	a0,a2,8000964a <__umoddi3+0x1fa>
80009638:	40c50633          	sub	a2,a0,a2
8000963c:	40d586b3          	sub	a3,a1,a3
80009640:	00c53733          	sltu	a4,a0,a2
80009644:	87b2                	mv	a5,a2
80009646:	40e68733          	sub	a4,a3,a4
8000964a:	853e                	mv	a0,a5
8000964c:	85ba                	mv	a1,a4
8000964e:	8082                	ret
80009650:	010008b7          	lui	a7,0x1000
80009654:	4861                	li	a6,24
80009656:	fb16fde3          	bgeu	a3,a7,80009610 <__umoddi3+0x1c0>
8000965a:	4841                	li	a6,16
8000965c:	bf55                	j	80009610 <__umoddi3+0x1c0>
8000965e:	011657b3          	srl	a5,a2,a7
80009662:	010696b3          	sll	a3,a3,a6
80009666:	8edd                	or	a3,a3,a5
80009668:	0115d733          	srl	a4,a1,a7
8000966c:	0106de13          	srli	t3,a3,0x10
80009670:	03c75f33          	divu	t5,a4,t3
80009674:	01069313          	slli	t1,a3,0x10
80009678:	01035313          	srli	t1,t1,0x10
8000967c:	010597b3          	sll	a5,a1,a6
80009680:	011555b3          	srl	a1,a0,a7
80009684:	8ddd                	or	a1,a1,a5
80009686:	0105d793          	srli	a5,a1,0x10
8000968a:	01061633          	sll	a2,a2,a6
8000968e:	01051533          	sll	a0,a0,a6
80009692:	03c77733          	remu	a4,a4,t3
80009696:	03e30eb3          	mul	t4,t1,t5
8000969a:	0742                	slli	a4,a4,0x10
8000969c:	8fd9                	or	a5,a5,a4
8000969e:	877a                	mv	a4,t5
800096a0:	01d7fc63          	bgeu	a5,t4,800096b8 <__umoddi3+0x268>
800096a4:	97b6                	add	a5,a5,a3
800096a6:	ffff0713          	addi	a4,t5,-1
800096aa:	00d7e763          	bltu	a5,a3,800096b8 <__umoddi3+0x268>
800096ae:	01d7f563          	bgeu	a5,t4,800096b8 <__umoddi3+0x268>
800096b2:	ffef0713          	addi	a4,t5,-2
800096b6:	97b6                	add	a5,a5,a3
800096b8:	41d787b3          	sub	a5,a5,t4
800096bc:	03c7deb3          	divu	t4,a5,t3
800096c0:	05c2                	slli	a1,a1,0x10
800096c2:	81c1                	srli	a1,a1,0x10
800096c4:	03c7f7b3          	remu	a5,a5,t3
800096c8:	8e76                	mv	t3,t4
800096ca:	03d30333          	mul	t1,t1,t4
800096ce:	07c2                	slli	a5,a5,0x10
800096d0:	8ddd                	or	a1,a1,a5
800096d2:	0065fc63          	bgeu	a1,t1,800096ea <__umoddi3+0x29a>
800096d6:	95b6                	add	a1,a1,a3
800096d8:	fffe8e13          	addi	t3,t4,-1
800096dc:	00d5e763          	bltu	a1,a3,800096ea <__umoddi3+0x29a>
800096e0:	0065f563          	bgeu	a1,t1,800096ea <__umoddi3+0x29a>
800096e4:	ffee8e13          	addi	t3,t4,-2
800096e8:	95b6                	add	a1,a1,a3
800096ea:	01071793          	slli	a5,a4,0x10
800096ee:	6f41                	lui	t5,0x10
800096f0:	01c7e7b3          	or	a5,a5,t3
800096f4:	406585b3          	sub	a1,a1,t1
800096f8:	ffff0313          	addi	t1,t5,-1 # ffff <_entry-0x7fff0001>
800096fc:	0067f733          	and	a4,a5,t1
80009700:	01065e13          	srli	t3,a2,0x10
80009704:	83c1                	srli	a5,a5,0x10
80009706:	00667333          	and	t1,a2,t1
8000970a:	02670eb3          	mul	t4,a4,t1
8000970e:	02678333          	mul	t1,a5,t1
80009712:	03c70733          	mul	a4,a4,t3
80009716:	03c787b3          	mul	a5,a5,t3
8000971a:	00670e33          	add	t3,a4,t1
8000971e:	010ed713          	srli	a4,t4,0x10
80009722:	9772                	add	a4,a4,t3
80009724:	00677363          	bgeu	a4,t1,8000972a <__umoddi3+0x2da>
80009728:	97fa                	add	a5,a5,t5
8000972a:	01075313          	srli	t1,a4,0x10
8000972e:	979a                	add	a5,a5,t1
80009730:	6341                	lui	t1,0x10
80009732:	137d                	addi	t1,t1,-1 # ffff <_entry-0x7fff0001>
80009734:	00677733          	and	a4,a4,t1
80009738:	0742                	slli	a4,a4,0x10
8000973a:	006efeb3          	and	t4,t4,t1
8000973e:	9776                	add	a4,a4,t4
80009740:	00f5e663          	bltu	a1,a5,8000974c <__umoddi3+0x2fc>
80009744:	00f59b63          	bne	a1,a5,8000975a <__umoddi3+0x30a>
80009748:	00e57963          	bgeu	a0,a4,8000975a <__umoddi3+0x30a>
8000974c:	40c70633          	sub	a2,a4,a2
80009750:	00c73333          	sltu	t1,a4,a2
80009754:	969a                	add	a3,a3,t1
80009756:	8732                	mv	a4,a2
80009758:	8f95                	sub	a5,a5,a3
8000975a:	40e50733          	sub	a4,a0,a4
8000975e:	00e53533          	sltu	a0,a0,a4
80009762:	8d9d                	sub	a1,a1,a5
80009764:	8d89                	sub	a1,a1,a0
80009766:	011598b3          	sll	a7,a1,a7
8000976a:	01075733          	srl	a4,a4,a6
8000976e:	00e8e533          	or	a0,a7,a4
80009772:	0105d5b3          	srl	a1,a1,a6
80009776:	8082                	ret
	...

8000a000 <_trampoline>:
8000a000:	14051073          	.insn	4, 0x14051073
8000a004:	7579                	lui	a0,0xffffe
8000a006:	00152a23          	sw	ra,20(a0) # ffffe014 <end+0x7ff2da98>
8000a00a:	00252c23          	sw	sp,24(a0)
8000a00e:	00352e23          	sw	gp,28(a0)
8000a012:	02452023          	sw	tp,32(a0)
8000a016:	02552223          	sw	t0,36(a0)
8000a01a:	02652423          	sw	t1,40(a0)
8000a01e:	02752623          	sw	t2,44(a0)
8000a022:	d900                	sw	s0,48(a0)
8000a024:	d944                	sw	s1,52(a0)
8000a026:	dd4c                	sw	a1,60(a0)
8000a028:	c130                	sw	a2,64(a0)
8000a02a:	c174                	sw	a3,68(a0)
8000a02c:	c538                	sw	a4,72(a0)
8000a02e:	c57c                	sw	a5,76(a0)
8000a030:	05052823          	sw	a6,80(a0)
8000a034:	05152a23          	sw	a7,84(a0)
8000a038:	05252c23          	sw	s2,88(a0)
8000a03c:	05352e23          	sw	s3,92(a0)
8000a040:	07452023          	sw	s4,96(a0)
8000a044:	07552223          	sw	s5,100(a0)
8000a048:	07652423          	sw	s6,104(a0)
8000a04c:	07752623          	sw	s7,108(a0)
8000a050:	07852823          	sw	s8,112(a0)
8000a054:	07952a23          	sw	s9,116(a0)
8000a058:	07a52c23          	sw	s10,120(a0)
8000a05c:	07b52e23          	sw	s11,124(a0)
8000a060:	09c52023          	sw	t3,128(a0)
8000a064:	09d52223          	sw	t4,132(a0)
8000a068:	09e52423          	sw	t5,136(a0)
8000a06c:	09f52623          	sw	t6,140(a0)
8000a070:	140022f3          	.insn	4, 0x140022f3
8000a074:	02552c23          	sw	t0,56(a0)
8000a078:	00452103          	lw	sp,4(a0)
8000a07c:	01052203          	lw	tp,16(a0)
8000a080:	00852283          	lw	t0,8(a0)
8000a084:	00052303          	lw	t1,0(a0)
8000a088:	12000073          	sfence.vma
8000a08c:	18031073          	.insn	4, 0x18031073
8000a090:	12000073          	sfence.vma
8000a094:	9282                	jalr	t0

8000a096 <userret>:
8000a096:	12000073          	sfence.vma
8000a09a:	18051073          	.insn	4, 0x18051073
8000a09e:	12000073          	sfence.vma
8000a0a2:	7579                	lui	a0,0xffffe
8000a0a4:	01452083          	lw	ra,20(a0) # ffffe014 <end+0x7ff2da98>
8000a0a8:	01852103          	lw	sp,24(a0)
8000a0ac:	01c52183          	lw	gp,28(a0)
8000a0b0:	02052203          	lw	tp,32(a0)
8000a0b4:	02452283          	lw	t0,36(a0)
8000a0b8:	02852303          	lw	t1,40(a0)
8000a0bc:	02c52383          	lw	t2,44(a0)
8000a0c0:	5900                	lw	s0,48(a0)
8000a0c2:	5944                	lw	s1,52(a0)
8000a0c4:	5d4c                	lw	a1,60(a0)
8000a0c6:	4130                	lw	a2,64(a0)
8000a0c8:	4174                	lw	a3,68(a0)
8000a0ca:	4538                	lw	a4,72(a0)
8000a0cc:	457c                	lw	a5,76(a0)
8000a0ce:	05052803          	lw	a6,80(a0)
8000a0d2:	05452883          	lw	a7,84(a0)
8000a0d6:	05852903          	lw	s2,88(a0)
8000a0da:	05c52983          	lw	s3,92(a0)
8000a0de:	06052a03          	lw	s4,96(a0)
8000a0e2:	06452a83          	lw	s5,100(a0)
8000a0e6:	06852b03          	lw	s6,104(a0)
8000a0ea:	06c52b83          	lw	s7,108(a0)
8000a0ee:	07052c03          	lw	s8,112(a0)
8000a0f2:	07452c83          	lw	s9,116(a0)
8000a0f6:	07852d03          	lw	s10,120(a0)
8000a0fa:	07c52d83          	lw	s11,124(a0)
8000a0fe:	08052e03          	lw	t3,128(a0)
8000a102:	08452e83          	lw	t4,132(a0)
8000a106:	08852f03          	lw	t5,136(a0)
8000a10a:	08c52f83          	lw	t6,140(a0)
8000a10e:	5d08                	lw	a0,56(a0)
8000a110:	10200073          	sret
	...
