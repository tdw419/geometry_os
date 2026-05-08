; DESCRIPTION: This GeOS assembly code initializes registers with specific values, performs arithmetic and logical operations including addition, multiplication, division, XOR, and shift operations, checks user input against key values, and conditionally executes drawing functions such as `LINE` and `TEXT`. It repeatedly calls a label (`main_2`) to continuously check for user input and display text if the correct conditions are met.

; mixed program
; initialization
  LDI r4, 1717
  LDI r1, 2
  LDI r13, 2
  PUSH r6
  PUSH r8
  PUSH r6
  ADD r3, r12, r10
  XOR r7, r10, r9
  XOR r13, r6, r11
  DIV r15, r2, r12
  POP r6
  POP r8
  POP r6
  SAR r10, r8, r5
  SHLI r7, r6, 0x0C4F6E
  SHL r9, r4, r20
  SHLI r11, r0, 0x41E399
  SHLI r5, r13, 5
  SHR r8, r23, r0
  SAR r13, r12, r11
  SAR r2, r1, r4
  LDI r12, 255
  FILL r12
  IKEY r1
  CMPI r1, 10
  JNZ r1, key_0
  MUL r8, r24, r5
  IKEY r12
  CMPI r12, 0x013C8A
  JNZ r12, key_1
  LDI r6, 710
  LDI r12, 0xF3BC41
  LDI r9, 0xD4C980
  LDI r22, 3705
  LDI r9, 128
  LINE r6, r12, r9, r22, r9
main_2:
  AND r1, r11, r13
  IKEY r15
  CMPI r15, 125
  JNZ r15, key_3
  LDI r14, 71
  LDI r0, 0xC92D84
  LDI r11, 4
  TEXT r14, r0, r11, "HELLO"
  FRAME
  JMP main_2
