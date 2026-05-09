; DESCRIPTION: Draws a blue rectangle at (89, 75) with width 71 and height 46.
; PLAN: r0=89(x), r1=75(y), r2=71(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 75
LDI r2, 71
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
