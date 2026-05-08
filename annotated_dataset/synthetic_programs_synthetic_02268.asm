; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations including XOR, MUL, DIV, SHL, SUB, ADD, STORE, and LOAD. It calls functions `func_0`, `func_1`, and `func_2` which execute further calculations and conditional jumps based on comparisons. The program ends in an infinite loop waiting for a key press.

; mixed program
; initialization
  LDI r8, 0xF497D7
  LDI r9, 914
  LDI r11, 0x8A40A5
  LDI r3, 2
  LDI r2, 256
  LDI r14, 3331
  LDI r11, 0x387128
  LDI r14, 2505
  PSET r14, r11, r14
  LDI r10, 0x0E03DB
  FILL r10
  CALL func_0
func_0:
  XOR r7, r24, r14
  MUL r7, r17, r13
  RET
  XOR r2, r7, r8
  XOR r8, r14, r5
  XOR r7, r13, r8
  XOR r3, r11, r14
  CALL func_1
func_1:
  DIV r15, r3, r5
  SHL r14, r2, r11
  SHL r4, r8, r6
  SUB r10, r11, r1
  RET
  CALL func_2
func_2:
  ADD r8, r12, r15
  DIV r6, r13, r11
  DIV r8, r13, r22
  RET
  LDI r4, 3235
  STORE r4, r11
  LOAD r9, r4
  LDI r13, 0x21B7
  STORE r13, r4
  LOAD r3, r13
  LDI r14, 128
  STORE r14, r8
  LOAD r28, r14
  LDI r0, 0
  STORE r0, r14
  LOAD r11, r0
main_3:
  CMPI r0, 8
  ANDI r24, r0, 214
  IKEY r7
  CMPI r7, 1
  JNZ r7, key_4
  FRAME
  JMP main_3
