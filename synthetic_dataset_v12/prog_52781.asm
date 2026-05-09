; DESCRIPTION: Draws a cyan rectangle at (139, 14) with width 34 and height 88.
; PLAN: r0=139(x), r1=14(y), r2=34(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 14
LDI r2, 34
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
