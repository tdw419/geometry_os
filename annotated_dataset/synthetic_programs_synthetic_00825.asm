; DESCRIPTION: This GeOS assembly code initializes a palette with various colors and sets up registers for graphics operations. It then enters a loop where it waits for key inputs to trigger different graphical functions, including drawing rectangles and manipulating pixel data through bitwise operations.

; mixed program
; initialization
  LDI r8, 128
  LDI r6, 1114
; palette
  LDI r10, 0x23CD
  LDI r14, 1
  LDI r13, 0xFFFFFF
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0xAAAAAA
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0x0000FF
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0x8800FF
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0x00FF00
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0xFF00FF
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0xAAFF00
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0x550077
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0xFF00FF
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0x8800FF
  STORE r10, r13
  ADD r10, r10, r14
  LDI r13, 0xFFEE00
  STORE r10, r13
  ADD r10, r10, r14
  IKEY r15
  CMPI r15, 10
  JNZ r15, key_0
  LDI r5, 32
  STORE r5, r10
  LOAD r15, r5
  LDI r9, 1903
  STORE r9, r10
  LOAD r14, r9
  LDI r14, 32
  STORE r14, r6
  LOAD r13, r14
  LDI r2, 0x606B
  STORE r2, r7
  LOAD r11, r2
  LDI r12, 2
  STORE r12, r15
  LOAD r18, r12
  LDI r5, 2586
  STORE r5, r10
  LOAD r0, r5
  LDI r4, 2917
  STORE r4, r7
  LOAD r14, r4
  LDI r12, 64
  STORE r12, r9
  LOAD r14, r12
  OR r10, r9, r20
  AND r0, r4, r15
  CALL func_1
func_1:
  SHL r15, r23, r4
  XOR r15, r9, r1
  DIV r6, r15, r4
  XOR r8, r11, r3
  OR r12, r1, r4
  SHL r7, r12, r11
  RET
main_2:
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_3
  LDI r15, 0xA47E6D
  LDI r6, 1018
  LDI r1, 4
  LDI r31, 3987
  LDI r0, 0x1765F9
  RECTF r15, r6, r1, r31, r0
  SHL r2, r1, r0
  SHR r11, r30, r12
  FRAME
  JMP main_2
