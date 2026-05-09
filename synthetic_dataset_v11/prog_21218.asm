; DESCRIPTION: Draws a yellow rectangle at (155, 10) with width 52 and height 56.
; PLAN: r0=155(x), r1=10(y), r2=52(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 10
LDI r2, 52
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
