; DESCRIPTION: Draws a yellow rectangle at (31, 15) with width 99 and height 61.
; PLAN: r0=31(x), r1=15(y), r2=99(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 15
LDI r2, 99
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
