; DESCRIPTION: Draws a cyan rectangle at (136, 207) with width 88 and height 25.
; PLAN: r0=136(x), r1=207(y), r2=88(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 207
LDI r2, 88
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
