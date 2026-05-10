; DESCRIPTION: Draws a cyan rectangle at (278, 22) with width 75 and height 118.
; PLAN: r0=278(x), r1=22(y), r2=75(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 22
LDI r2, 75
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
