; DESCRIPTION: Draws a yellow rectangle at (339, 31) with width 90 and height 84.
; PLAN: r0=339(x), r1=31(y), r2=90(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 31
LDI r2, 90
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
