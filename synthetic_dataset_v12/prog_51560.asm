; DESCRIPTION: Draws a cyan rectangle at (472, 100) with width 36 and height 118.
; PLAN: r0=472(x), r1=100(y), r2=36(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 100
LDI r2, 36
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
