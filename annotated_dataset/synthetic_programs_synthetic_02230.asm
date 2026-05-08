; DESCRIPTION: This GeOS assembly code performs conditional logic to check if the values in registers `r4` and `r2` are equal. If they are not equal, it writes a pixel at coordinates `(0xF1101D, 0x569597)` with color `0x0BFC0B`, draws a circle centered at `(256, 1545)` with radius `8`, and sets another pixel at coordinates `(2839, 16)`. If they are equal, it performs an XOR operation between the values in registers `r4` and `r8`, storing the result in register `r6`. The program then halts.

; conditional logic
; initialization
  LDI r20, 2115
  LDI r10, 8
  LDI r13, 2902
  CMP r4, r2
  JNZ r4, else_0
  XOR r4, r8, r6
  JMP endif_1
else_0:
  LDI r13, 0x569597
  LDI r1, 0
  LDI r12, 0xF1101D
  WPIXEL
  LDI r14, 256
  LDI r11, 0xB3D744
  LDI r3, 8
  LDI r11, 1545
  CIRCLE r14, r11, r3, r11
  LDI r13, 2839
  LDI r12, 16
  LDI r27, 0x0BFC0B
  PSET r13, r12, r27
endif_1:
  HALT
