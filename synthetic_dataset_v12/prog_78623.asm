; DESCRIPTION: Draws a yellow rectangle at (25, 105) with width 77 and height 85.
; PLAN: r0=25(x), r1=105(y), r2=77(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 105
LDI r2, 77
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
