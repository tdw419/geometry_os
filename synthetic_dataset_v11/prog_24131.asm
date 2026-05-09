; DESCRIPTION: Draws a black rectangle at (39, 52) with width 25 and height 112.
; PLAN: r0=39(x), r1=52(y), r2=25(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 52
LDI r2, 25
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
