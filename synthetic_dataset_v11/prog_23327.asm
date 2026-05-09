; DESCRIPTION: Draws a yellow rectangle at (89, 4) with width 57 and height 106.
; PLAN: r0=89(x), r1=4(y), r2=57(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 4
LDI r2, 57
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
