; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls two subroutines: `func_0` which performs a bitwise OR operation between `r0` and `r5`, shifts `r5` left by the value in `r11`, and returns; `func_1` which multiplies `r8` by `r14` into `r9`, shifts `r2` left by the value in `r14`, and returns. The program then halts execution.

; subroutine calls
; initialization
  LDI r5, 0xDAC78E
  LDI r14, 3613
  LDI r9, 0x35CA4F
  LDI r15, 0xE786FB
  LDI r1, 0xCAE3A4
  LDI r2, 255
  LDI r11, 2121
  LDI r6, 2588
  CALL func_0
func_0:
  OR r3, r0, r5
  SHL r5, r11, r12
  RET
  CALL func_1
func_1:
  MUL r9, r8, r14
  SHL r2, r14, r13
  RET
  HALT
