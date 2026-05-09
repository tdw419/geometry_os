; DESCRIPTION: Draws a blue rectangle at (89, 95) with width 73 and height 63.
; PLAN: r0=89(x), r1=95(y), r2=73(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 95
LDI r2, 73
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
