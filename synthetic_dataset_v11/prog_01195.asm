; DESCRIPTION: Draws a yellow rectangle at (5, 6) with width 99 and height 77.
; PLAN: r0=5(x), r1=6(y), r2=99(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 6
LDI r2, 99
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
