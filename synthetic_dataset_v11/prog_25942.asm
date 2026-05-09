; DESCRIPTION: Draws a black rectangle at (102, 52) with width 67 and height 119.
; PLAN: r0=102(x), r1=52(y), r2=67(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 52
LDI r2, 67
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
