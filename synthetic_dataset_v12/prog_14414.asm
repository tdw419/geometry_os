; DESCRIPTION: Draws a black rectangle at (151, 21) with width 18 and height 96.
; PLAN: r0=151(x), r1=21(y), r2=18(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 21
LDI r2, 18
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
