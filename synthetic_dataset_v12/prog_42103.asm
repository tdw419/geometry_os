; DESCRIPTION: Draws a cyan rectangle at (34, 137) with width 88 and height 118.
; PLAN: r0=34(x), r1=137(y), r2=88(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 137
LDI r2, 88
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
