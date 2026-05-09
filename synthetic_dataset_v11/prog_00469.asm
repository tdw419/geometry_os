; DESCRIPTION: Draws a green rectangle at (64, 45) with width 106 and height 17.
; PLAN: r0=64(x), r1=45(y), r2=106(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 45
LDI r2, 106
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
