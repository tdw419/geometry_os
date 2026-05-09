; DESCRIPTION: Draws a red rectangle at (2, 123) with width 101 and height 90.
; PLAN: r0=2(x), r1=123(y), r2=101(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 123
LDI r2, 101
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
