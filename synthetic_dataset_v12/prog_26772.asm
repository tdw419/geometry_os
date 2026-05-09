; DESCRIPTION: Draws a red rectangle at (390, 44) with width 99 and height 101.
; PLAN: r0=390(x), r1=44(y), r2=99(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 44
LDI r2, 99
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
