; DESCRIPTION: Draws a yellow rectangle at (13, 100) with width 85 and height 77.
; PLAN: r0=13(x), r1=100(y), r2=85(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 100
LDI r2, 85
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
