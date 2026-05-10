; DESCRIPTION: Draws a black rectangle at (34, 26) with width 86 and height 20.
; PLAN: r0=34(x), r1=26(y), r2=86(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 26
LDI r2, 86
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
