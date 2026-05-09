; DESCRIPTION: Draws a yellow rectangle at (0, 77) with width 85 and height 115.
; PLAN: r0=0(x), r1=77(y), r2=85(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 77
LDI r2, 85
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
