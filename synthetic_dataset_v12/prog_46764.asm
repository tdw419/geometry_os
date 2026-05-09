; DESCRIPTION: Draws a yellow rectangle at (378, 8) with width 96 and height 55.
; PLAN: r0=378(x), r1=8(y), r2=96(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 8
LDI r2, 96
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
