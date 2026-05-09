; DESCRIPTION: Draws a yellow rectangle at (145, 1) with width 60 and height 23.
; PLAN: r0=145(x), r1=1(y), r2=60(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 1
LDI r2, 60
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
