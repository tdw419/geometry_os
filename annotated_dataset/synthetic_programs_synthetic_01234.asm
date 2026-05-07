; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls two functions: `func_0` and `func_1`. In `func_0`, it performs an XOR operation between `r1` and `r7`, shifts `r14` left by the value in `r10`, and then returns. In `func_1`, it adds `r1` and `r12`, shifts `r1` right by the value in `r11`, multiplies `r30` by `r14`, subtracts `r5` from `r9`, adds `r6` and `r12`, performs a bitwise OR between `r6` and `r1`, and finally returns. The code halts after the last operation in `func_1`.

; mixed program
; initialization
  LDI r12, 2731
  LDI r1, 3921
  LDI r2, 773
  CALL func_0
func_0:
  XOR r11, r1, r7
  SHL r8, r14, r10
  RET
  CALL func_1
func_1:
  ADD r13, r1, r12
  SHR r1, r11, r14
  MUL r8, r30, r14
  SUB r3, r5, r9
  ADD r11, r6, r12
  OR r10, r6, r1
  RET
  SUB r9, r11, r5
  HALT
