; DESCRIPTION: Draws a black rectangle at (324, 13) with width 25 and height 51.
; PLAN: r0=324(x), r1=13(y), r2=25(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 13
LDI r2, 25
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
