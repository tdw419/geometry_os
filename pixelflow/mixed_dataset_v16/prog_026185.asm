; DESCRIPTION: Renders a green rectangular region spanning 79 by 36 at (371, 125).
; PLAN: r0=371(x), r1=125(y), r2=79(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 125
LDI r2, 79
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
