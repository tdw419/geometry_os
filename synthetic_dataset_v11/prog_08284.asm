; DESCRIPTION: Draws a yellow rectangle at (132, 71) with width 36 and height 26.
; PLAN: r0=132(x), r1=71(y), r2=36(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 71
LDI r2, 36
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
