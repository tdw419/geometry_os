; DESCRIPTION: Draws a black rectangle at (5, 112) with width 110 and height 67.
; PLAN: r0=5(x), r1=112(y), r2=110(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 112
LDI r2, 110
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
