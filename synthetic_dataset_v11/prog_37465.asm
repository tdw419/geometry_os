; DESCRIPTION: Draws a cyan rectangle at (5, 8) with width 88 and height 118.
; PLAN: r0=5(x), r1=8(y), r2=88(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 8
LDI r2, 88
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
