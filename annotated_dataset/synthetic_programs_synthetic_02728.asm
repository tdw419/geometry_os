; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls two subroutines, `func_0` and `func_1`. In `func_0`, it performs left shifts on registers `r10` and `r7` using other registers as shift counts. In `func_1`, it adds values from registers `r6` and `r13` to `r1`, right shifts `r14` into `r0`, and adds `r9` and `r11` to `r2`. Finally, the program halts execution.

; subroutine calls
; initialization
  LDI r16, 0x7ABB83
  LDI r14, 600
  LDI r5, 0
  LDI r11, 4
  LDI r1, 8
  LDI r2, 1
  LDI r13, 0xC7AB22
  LDI r8, 0
  CALL func_0
func_0:
  SHL r10, r9, r30
  SHL r7, r1, r3
  RET
  CALL func_1
func_1:
  ADD r1, r6, r13
  SHR r0, r14, r4
  ADD r2, r9, r11
  RET
  HALT
