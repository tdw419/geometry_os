; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls two subroutines (`func_0` and `func_1`). In `func_0`, it performs division, XOR, multiplication, subtraction, and another multiplication on various registers. In `func_1`, it executes an XOR, OR operation, and a multiplication before returning control to the main program, which then halts execution.

; subroutine calls
; initialization
  LDI r11, 0x80B7E0
  LDI r6, 586
  LDI r13, 3651
  LDI r1, 0xC7F762
  LDI r10, 0xE8F9A2
  LDI r12, 747
  CALL func_0
func_0:
  DIV r8, r2, r12
  XOR r11, r27, r1
  MUL r5, r2, r12
  SUB r12, r11, r4
  MUL r7, r0, r14
  RET
  CALL func_1
func_1:
  XOR r4, r2, r9
  OR r23, r15, r10
  MUL r6, r12, r3
  RET
  HALT
