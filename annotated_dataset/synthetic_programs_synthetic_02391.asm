; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and draws the text "WORLD" at a designated position using coordinates and color specified by the registers. It then calls a function `func_0` that performs arithmetic operations on the register values, including multiplication and modulus, before returning to the main program where it halts execution after adding two register values.

; mixed program
; initialization
  LDI r0, 0x1259A8
  LDI r9, 16
  LDI r12, 1
  LDI r4, 128
  LDI r15, 3137
  LDI r8, 667
  LDI r7, 0x4B00BD
  DRAWTEXT r15, r8, r7, "WORLD"
  CALL func_0
func_0:
  MUL r0, r12, r11
  MUL r8, r5, r12
  MOD r4, r22, r2
  RET
  ADD r12, r11, r15
  HALT
