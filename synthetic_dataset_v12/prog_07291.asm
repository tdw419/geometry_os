; DESCRIPTION: Draws a yellow rectangle at (441, 51) with width 17 and height 74.
; PLAN: r0=441(x), r1=51(y), r2=17(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 51
LDI r2, 17
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
