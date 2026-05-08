; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then calls a function `func_0` which performs arithmetic operations including multiplication, XOR, shift, and modulo. After returning from the function, it displays text "HELLO" and "WORLD" on the screen using specific coordinates and colors. The code also includes a loop that decrements a register value until it matches a specified constant, and repeatedly fills the screen with different colors while drawing the text "WORLD". Finally, it enters an infinite loop where it updates the frame continuously.

; mixed program
; initialization
  LDI r9, 0xF5056C
  LDI r7, 739
  LDI r3, 0xB91EA6
  LDI r14, 4
  LDI r12, 1
  LDI r6, 0x0ECA5E
  LDI r8, 0
  LDI r11, 1885
; palette
  LDI r15, 0x80A8
  LDI r3, 1
  LDI r1, 0x888800
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0x8800FF
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0x0044FF
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0xFF8800
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0xFFAA00
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0xFF8800
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0x00FFAA
  STORE r15, r1
  ADD r15, r15, r3
  LDI r1, 0xDD0044
  STORE r15, r1
  ADD r15, r15, r3
  XOR r6, r9, r10
  AND r7, r4, r8
  OR r7, r11, r14
  XOR r30, r4, r6
  OR r12, r10, r9
  AND r9, r0, r13
  CALL func_0
func_0:
  MUL r4, r5, r13
  XOR r6, r3, r15
  SHL r15, r7, r14
  MOD r7, r0, r2
  RET
  SHL r1, r8, r6
  SAR r9, r6, r14
  SHLI r10, r5, 4
  SHR r6, r12, r4
  LDI r11, 0x2EED4B
  LDI r14, 256
  LDI r10, 3114
  TEXT r11, r14, r10, "HELLO"
  LDI r0, 4
  LDI r8, 0xF5543F
  LDI r14, 32
  DRAWTEXT r0, r8, r14, "WORLD"
  XOR r9, r1, r3
  XOR r6, r11, r8
  OR r6, r11, r14
  AND r9, r1, r10
  LDI r5, 0x1CDA49
loop_1:
  CMPI r4, r13, 0xDB5791
  OR r8, r13, r12
  SUBI r5, r1, 2
  LDI r14, 1
  SUB r5, r5, r14
  JNZ r5, loop_1
main_2:
  LDI r9, 2774
  FILL r9
  XOR r10, r2, r5
  OR r4, r11, r7
  AND r4, r1, r13
  LDI r10, 0x16BFDA
  FILL r10
  LDI r6, 4
  LDI r6, 0x78407C
  LDI r15, 256
  DRAWTEXT r6, r6, r15, "WORLD"
  CMP r5, r1
  OR r6, r8, r20
  AND r3, r13, r7
  FRAME
  JMP main_2
