; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls a subroutine `func_0`. Within the subroutine, it performs modular division of `r12` by `r2` into `r11`, right shifts `r14` by `r5` bits, subtracts `r0` from `r12` into `r25`, and then returns. The program halts after the subroutine call.

; subroutine calls
; initialization
  LDI r8, 0x244F1D
  LDI r1, 3310
  LDI r10, 2
  LDI r14, 0x0BDCF1
  LDI r6, 0x8EECF3
  LDI r12, 3751
  CALL func_0
func_0:
  MOD r12, r2, r11
  SHR r10, r14, r5
  SUB r12, r0, r25
  RET
  HALT
