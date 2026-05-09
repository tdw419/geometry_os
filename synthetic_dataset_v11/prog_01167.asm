; DESCRIPTION: Draws a black rectangle at (34, 0) with width 14 and height 117.
; PLAN: r0=34(x), r1=0(y), r2=14(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 0
LDI r2, 14
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
