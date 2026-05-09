; DESCRIPTION: Draws a yellow rectangle at (99, 208) with width 36 and height 25.
; PLAN: r0=99(x), r1=208(y), r2=36(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 208
LDI r2, 36
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
