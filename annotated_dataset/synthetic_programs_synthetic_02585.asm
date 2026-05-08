; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. Inside the subroutine, it performs left shifts on two registers using values from other registers as shift amounts, returns control to the caller, and halts execution.

; subroutine calls
; initialization
  LDI r7, 3799
  LDI r10, 681
  LDI r3, 0xFF282B
  LDI r6, 0xD2FA61
  LDI r2, 0x6F1F1C
  LDI r9, 3735
  CALL func_0
func_0:
  SHL r1, r5, r3
  SHL r12, r6, r15
  RET
  HALT
