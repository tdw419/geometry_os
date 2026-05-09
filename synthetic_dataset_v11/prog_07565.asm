; DESCRIPTION: Draws a black rectangle at (34, 96) with width 73 and height 80.
; PLAN: r0=34(x), r1=96(y), r2=73(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 96
LDI r2, 73
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
