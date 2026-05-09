; DESCRIPTION: Draws a blue rectangle at (77, 176) with width 55 and height 73.
; PLAN: r0=77(x), r1=176(y), r2=55(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 176
LDI r2, 55
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
