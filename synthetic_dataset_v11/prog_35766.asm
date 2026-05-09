; DESCRIPTION: Draws a black rectangle at (151, 15) with width 18 and height 18.
; PLAN: r0=151(x), r1=15(y), r2=18(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 15
LDI r2, 18
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
