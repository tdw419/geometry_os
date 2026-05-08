; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. Inside `func_0`, it multiplies the values in registers `r9` and `r11`, stores the result in `r6`, performs an XOR operation between `r14` and `r1`, and returns from the subroutine. The program then halts execution.

; subroutine calls
; initialization
  LDI r7, 1
  LDI r13, 0xC0C045
  LDI r0, 0x8DDA6B
  LDI r15, 64
  LDI r10, 64
  LDI r4, 2804
  CALL func_0
func_0:
  MUL r6, r9, r11
  XOR r3, r14, r1
  RET
  HALT
