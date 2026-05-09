; DESCRIPTION: Draws a yellow rectangle at (430, 25) with width 51 and height 40.
; PLAN: r0=430(x), r1=25(y), r2=51(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 25
LDI r2, 51
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
