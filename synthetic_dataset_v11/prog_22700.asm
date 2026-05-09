; DESCRIPTION: Draws a black rectangle at (21, 139) with width 118 and height 99.
; PLAN: r0=21(x), r1=139(y), r2=118(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 139
LDI r2, 118
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
