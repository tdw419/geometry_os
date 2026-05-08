; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs a series of arithmetic and logical operations including shifts, multiplications, subtractions, comparisons, and conditional jumps. It also includes a call to a subroutine (`func_3`) that further manipulates register values through additional arithmetic and bitwise operations before returning control. The program ends in an infinite loop where it writes pixels to the screen using the `WPIXEL` instruction and updates the display frame with `FRAME`.

; mixed program
; initialization
  LDI r0, 0x3C10A9
  LDI r1, 0x77E318
  LDI r2, 128
  LDI r4, 3207
  LDI r8, 128
  SAR r6, r1, r0
  SHR r5, r12, r7
  SAR r12, r0, r9
  SAR r14, r2, r12
  SUB r10, r2, r5
  CMP r0, r13
  JZ r0, else_0
  MUL r9, r14, r6
  OR r27, r13, r0
  JMP endif_1
else_0:
  LDI r15, 0xA642BA
  LDI r2, 3021
  LDI r5, 0x9A8A4C
  LDI r2, 16
  LDI r13, 1934
  RECTF r15, r2, r5, r2, r13
endif_1:
  IKEY r23
  CMPI r23, 38
  JNZ r23, key_2
  OR r6, r13, r10
  SAR r6, r11, r15
  SHR r14, r9, r8
  SHLI r11, r15, 1
  SHL r0, r11, r2
  SAR r10, r6, r30
  SHR r12, r4, r0
  CALL func_3
func_3:
  SUB r2, r7, r5
  DIV r12, r0, r8
  ADD r14, r6, r12
  AND r3, r6, r2
  XOR r12, r2, r14
  ADD r2, r11, r12
  RET
main_4:
  OR r11, r12, r15
  LDI r2, 0
  LDI r6, 3075
  LDI r1, 731
  WPIXEL
  CMP r13, r0
  OR r6, r15, r9
  OR r15, r8, r5
  OR r21, r10, r12
  OR r2, r6, r12
  FRAME
  JMP main_4
