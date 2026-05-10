; DESCRIPTION: Draws a black rectangle at (80, 14) with width 11 and height 112.
; PLAN: r0=80(x), r1=14(y), r2=11(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 14
LDI r2, 11
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
