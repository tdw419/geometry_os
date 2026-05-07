; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls two subroutines, `func_0` and `func_1`. In `func_0`, it performs a division of `r13` by `r5` and stores the result in `r8`, followed by a shift operation on `r5` using `r3` as the shift count. In `func_1`, it divides `r6` by `r8`, shifts `r0` right by `r2` bits, divides `r9` by `r30`, and divides `r8` by `r14`, all while using `r2` as the divisor in these divisions. The program then halts execution.

; subroutine calls
; initialization
  LDI r6, 10
  LDI r9, 64
  LDI r10, 687
  LDI r5, 2981
  LDI r13, 0x071C90
  LDI r15, 3341
  LDI r4, 0xDB264D
  LDI r11, 0x208951
  CALL func_0
func_0:
  DIV r8, r13, r5
  SHR r1, r5, r3
  RET
  CALL func_1
func_1:
  DIV r6, r8, r10
  SHR r13, r0, r2
  DIV r9, r30, r2
  DIV r8, r14, r2
  RET
  HALT
