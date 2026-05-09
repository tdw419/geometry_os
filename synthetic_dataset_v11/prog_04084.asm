; DESCRIPTION: Draws a black rectangle at (61, 14) with width 38 and height 88.
; PLAN: r0=61(x), r1=14(y), r2=38(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 14
LDI r2, 38
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
