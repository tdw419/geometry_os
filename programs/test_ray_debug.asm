; Raytracer debug - first pixel only
LDI r7, 1

; Sphere 0 at (0, 0, 32), r_sq=256, color=0xFF0000
LDI r14, 0x2000
LDI r15, 0
STORE r14, r15
ADD r14, r7
STORE r14, r15
ADD r14, r7
LDI r15, 32
STORE r14, r15
ADD r14, r7
LDI r15, 256
STORE r14, r15
ADD r14, r7
LDI r15, 0xFF0000
STORE r14, r15

; Ray for center pixel x=32, y=32
MOV r12, r11
LDI r13, 32
SUB r12, r13
LDI r13, 3
MUL r12, r13

LDI r13, 32
SUB r13, r10
LDI r15, 3
MUL r13, r15

LDI r14, 0x3000
LDI r15, 0
STORE r14, r15
ADD r14, r7
STORE r14, r15
ADD r14, r7
LDI r15, 48
NEG r15
STORE r14, r15
ADD r14, r7
STORE r14, r12
ADD r14, r7
STORE r14, r13
ADD r14, r7
LDI r15, 96
STORE r14, r15

; Call intersect_sphere for sphere 0
LDI r14, 0x2000
CALL intersect_sphere

; Store result at 0x4000
LDI r15, 0x3100
LOAD r15, r15
LDI r1, 0x4000
STORE r1, r15

HALT

intersect_sphere:
  LOAD r15, r14
  MOV r1, r14
  ADD r1, r7
  LOAD r16, r1
  ADD r1, r7
  LOAD r17, r1
  ADD r1, r7
  LOAD r18, r1
  LDI r1, 0x3000
  LOAD r2, r1
  SUB r2, r15
  LDI r1, 0x3001
  LOAD r3, r1
  SUB r3, r16
  LDI r1, 0x3002
  LOAD r4, r1
  SUB r4, r17
  LDI r1, 0x3003
  LOAD r5, r1
  LDI r1, 0x3004
  LOAD r6, r1
  LDI r1, 0x3005
  LOAD r19, r1
  MOV r20, r5
  MUL r20, r5
  MOV r21, r6
  MUL r21, r6
  ADD r20, r21
  MOV r21, r19
  MUL r21, r19
  ADD r20, r21
  MOV r21, r5
  MUL r21, r2
  MOV r22, r6
  MUL r22, r3
  ADD r21, r22
  MOV r22, r19
  MUL r22, r4
  ADD r21, r22
  MOV r22, r2
  MUL r22, r2
  MOV r23, r3
  MUL r23, r3
  ADD r22, r23
  MOV r23, r4
  MUL r23, r4
  ADD r22, r23
  SUB r22, r18
  MOV r23, r21
  MUL r23, r21
  MOV r24, r20
  MUL r24, r22
  CMP r23, r24
  BLT r0, isect_no_hit
  SUB r23, r24
  MOV r25, r23
  LDI r1, 8
  SHR r25, r1
  JNZ r25, sqrt_init_ok
  LDI r25, 1
  sqrt_init_ok:
  MOV r26, r23
  LDI r27, 10
  sqrt_loop:
    MOV r1, r26
    DIV r1, r25
    ADD r1, r25
    LDI r2, 1
    SHR r1, r2
    MOV r25, r1
    LDI r2, 1
    SUB r27, r2
    JNZ r27, sqrt_loop
  MOV r1, r21
  NEG r1
  SUB r1, r25
  MOV r2, r1
  LDI r3, 31
  SAR r2, r3
  JNZ r2, isect_no_hit
  LDI r2, 8
  SHL r1, r2
  DIV r1, r20
  LDI r2, 0x3100
  STORE r2, r1
  RET
isect_no_hit:
  LDI r1, 0x3100
  LDI r2, 0
  STORE r1, r2
  RET
