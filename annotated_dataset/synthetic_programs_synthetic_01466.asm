; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine (`func_0`) that performs division and exclusive OR operations on those registers before returning. The program halts afterward.

; subroutine calls
; initialization
  LDI r1, 32
  LDI r15, 0x6FC850
  LDI r5, 0xC4746F
  LDI r3, 64
  LDI r11, 3803
  LDI r8, 2857
  LDI r4, 0x4D0146
  CALL func_0
func_0:
  DIV r6, r15, r5
  XOR r5, r8, r11
  RET
  HALT
