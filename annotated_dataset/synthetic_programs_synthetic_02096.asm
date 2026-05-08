; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then uses the `PSET` function to set a pixel at coordinates (r11, r11) with color 4. It follows by setting up another rectangle using the `RECTF` function with parameters defined in the registers, and finally halts execution.

; simple draw program
; initialization
  LDI r8, 2045
  LDI r15, 2
  LDI r10, 0x2AE9FC
  LDI r14, 16
  LDI r9, 1
  LDI r0, 2
  LDI r4, 1227
  LDI r11, 3772
  LDI r11, 4039
  LDI r1, 4
  PSET r11, r11, r1
  LDI r11, 16
  LDI r4, 0x8FAAB0
  LDI r15, 0xDD8EEF
  LDI r14, 255
  LDI r2, 9
  RECTF r11, r4, r15, r14, r2
  HALT
