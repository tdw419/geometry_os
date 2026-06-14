; seed_grow.asm - Seed Growth Demo
; 4 seeds, each grows into a 128x128 quadrant
; FRAME between tiles to keep event loop alive
; Seed format: bits 31:24 = pattern type, bits 23:0 = RGB color

; === CONSTANTS ===
LDI r26, 0
LDI r27, 1
LDI r28, 8
LDI r29, 16
LDI r30, 24
LDI r31, 128

; === SEED DATA at 0x5000-0x5003 ===
LDI r14, 0x5000
LDI r8, 0x01FF0000
STORE r14, r8
ADD r14, r27
LDI r8, 0x0200FF00
STORE r14, r8
ADD r14, r27
LDI r8, 0x030000FF
STORE r14, r8
ADD r14, r27
LDI r8, 0x04FFFF00
STORE r14, r8

; === TILE 0: (0,0) seed=0x01FF0000 -> solid red ===
LDI r14, 0x5000
LOAD r0, r14
BFE r6, r0, r30, r26
LDI r15, 0
LDI r16, 0
RECTF r15, r16, r31, r31, r6
FRAME

; === TILE 1: (128,0) seed=0x0200FF00 -> green h-stripes ===
LDI r14, 0x5001
LOAD r0, r14
BFE r6, r0, r30, r26
LDI r15, 128
LDI r16, 0
LDI r10, 0

t1_loop:
  BFE r8, r10, r27, r26
  CMPI r8, 0
  JZ r0, t1_colored
  MOV r9, r26
  JMP t1_draw
t1_colored:
  MOV r9, r6
t1_draw:
  RECTF r15, r16, r31, r29, r9
  ADD r16, r29
  ADD r10, r27
  CMPI r10, 8
  JNZ r0, t1_loop
FRAME

; === TILE 2: (0,128) seed=0x030000FF -> blue v-stripes ===
LDI r14, 0x5002
LOAD r0, r14
BFE r6, r0, r30, r26
LDI r15, 0
LDI r16, 128
LDI r10, 0

t2_loop:
  BFE r8, r10, r27, r26
  CMPI r8, 0
  JZ r0, t2_colored
  MOV r9, r26
  JMP t2_draw
t2_colored:
  MOV r9, r6
t2_draw:
  RECTF r15, r16, r29, r31, r9
  ADD r15, r29
  ADD r10, r27
  CMPI r10, 8
  JNZ r0, t2_loop
FRAME

; === TILE 3: (128,128) seed=0x04FFFF00 -> yellow border ===
LDI r14, 0x5003
LOAD r0, r14
BFE r6, r0, r30, r26
LDI r15, 128
LDI r16, 128
RECTF r15, r16, r31, r31, r6
LDI r15, 144
LDI r16, 144
LDI r17, 96
RECTF r15, r16, r17, r17, r26
FRAME

HALT
