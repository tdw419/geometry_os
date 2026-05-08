; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then draws a circle using the `CIRCLE` instruction. After drawing the circle, it fills the circle's area with a specified color using the `FILL` instruction. The program then halts execution.

; simple draw program
; initialization
  LDI r14, 3546
  LDI r12, 16
  LDI r1, 3740
  LDI r0, 2297
  LDI r10, 783
  LDI r6, 276
  LDI r5, 716
  LDI r2, 2339
  LDI r15, 0x32AAA5
  LDI r0, 0x0C5655
  LDI r1, 415
  LDI r6, 3879
  CIRCLE r15, r0, r1, r6
  LDI r1, 0xC5512B
  FILL r1
  LDI r6, 128
  LDI r11, 638
  LDI r5, 0x520E4A
  LDI r15, 3612
  CIRCLE r6, r11, r5, r15
  HALT
