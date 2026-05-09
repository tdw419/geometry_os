; DESCRIPTION: Draws a black rectangle at (158, 10) with width 75 and height 56.
; PLAN: r0=158(x), r1=10(y), r2=75(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 10
LDI r2, 75
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
