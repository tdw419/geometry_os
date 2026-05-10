; DESCRIPTION: Draws a black rectangle at (313, 222) with width 51 and height 23.
; PLAN: r0=313(x), r1=222(y), r2=51(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 222
LDI r2, 51
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
