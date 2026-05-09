; DESCRIPTION: Draws a yellow rectangle at (273, 167) with width 90 and height 43.
; PLAN: r0=273(x), r1=167(y), r2=90(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 167
LDI r2, 90
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
