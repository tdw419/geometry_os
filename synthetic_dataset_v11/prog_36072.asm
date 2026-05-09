; DESCRIPTION: Draws a yellow rectangle at (19, 145) with width 112 and height 92.
; PLAN: r0=19(x), r1=145(y), r2=112(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 145
LDI r2, 112
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
