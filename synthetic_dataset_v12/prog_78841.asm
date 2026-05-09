; DESCRIPTION: Draws a black rectangle at (30, 216) with width 115 and height 14.
; PLAN: r0=30(x), r1=216(y), r2=115(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 216
LDI r2, 115
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
