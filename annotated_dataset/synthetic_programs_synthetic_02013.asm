; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls a subroutine `func_0`. Within `func_0`, the code performs bitwise operations (SHR, AND), arithmetic operations (DIV, SUB), and returns control to the caller after halting execution.

; subroutine calls
; initialization
  LDI r6, 0x4140DA
  LDI r23, 0xA81849
  LDI r14, 792
  LDI r0, 1192
  LDI r10, 64
  LDI r11, 0x5D1FD2
  CALL func_0
func_0:
  SHR r5, r7, r10
  AND r3, r9, r13
  SHR r15, r10, r2
  DIV r3, r14, r1
  SUB r9, r7, r11
  DIV r2, r22, r25
  RET
  HALT
