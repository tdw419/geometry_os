; DESCRIPTION: Draws a blue rectangle at (229, 43) with width 106 and height 73.
; PLAN: r0=229(x), r1=43(y), r2=106(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 43
LDI r2, 106
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
