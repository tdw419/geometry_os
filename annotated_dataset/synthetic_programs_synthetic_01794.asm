; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then proceeds to call a series of functions (`func_0`, `func_1`, `func_2`) in sequence. Each function performs arithmetic operations such as subtraction, multiplication, division, bitwise shifts, and logical OR, manipulating the register values accordingly. The execution halts after the final function call.

; subroutine calls
; initialization
  LDI r6, 0x39A15E
  LDI r13, 0x0C1C06
  LDI r9, 0x1B3E11
  LDI r18, 16
  LDI r0, 128
  LDI r1, 0x2AE704
  LDI r24, 8
  CALL func_0
func_0:
  SUB r0, r5, r11
  MUL r2, r1, r0
  SUB r18, r4, r7
  SUB r7, r3, r0
  OR r1, r7, r11
  RET
  CALL func_1
func_1:
  DIV r9, r18, r8
  SHL r4, r7, r11
  RET
  CALL func_2
func_2:
  SHL r1, r8, r0
  SUB r10, r1, r9
  SHL r11, r15, r9
  RET
  HALT
