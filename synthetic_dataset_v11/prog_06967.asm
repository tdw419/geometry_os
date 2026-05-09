; DESCRIPTION: Draws a yellow rectangle at (63, 19) with width 33 and height 92.
; PLAN: r0=63(x), r1=19(y), r2=33(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 19
LDI r2, 33
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
