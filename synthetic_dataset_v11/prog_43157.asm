; DESCRIPTION: Draws a yellow rectangle at (112, 105) with width 104 and height 92.
; PLAN: r0=112(x), r1=105(y), r2=104(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 105
LDI r2, 104
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
