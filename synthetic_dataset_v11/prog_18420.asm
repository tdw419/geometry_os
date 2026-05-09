; DESCRIPTION: Draws a yellow rectangle at (75, 77) with width 13 and height 116.
; PLAN: r0=75(x), r1=77(y), r2=13(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 77
LDI r2, 13
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
