; DESCRIPTION: This GeOS assembly code initializes registers `r3` and `r14` with specific values, then calls a subroutine `func_0`. Inside `func_0`, it multiplies the values of registers `r10` and `r5`, stores the result in `r13`, multiplies `r13` by `r5` again and stores the result in `r8`, performs an XOR operation between `r7` and `r8` storing the result in `r6`, returns from the subroutine, and halts the program.

; subroutine calls
; initialization
  LDI r3, 0xF601DD
  LDI r14, 0xD42B3F
  CALL func_0
func_0:
  MUL r13, r10, r5
  MUL r8, r13, r5
  XOR r6, r7, r8
  RET
  HALT
