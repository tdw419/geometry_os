; DESCRIPTION: Draws a yellow rectangle at (51, 9) with width 72 and height 75.
; PLAN: r0=51(x), r1=9(y), r2=72(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 9
LDI r2, 72
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
