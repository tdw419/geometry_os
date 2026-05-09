; DESCRIPTION: Draws a yellow rectangle at (36, 140) with width 84 and height 92.
; PLAN: r0=36(x), r1=140(y), r2=84(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 140
LDI r2, 84
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
