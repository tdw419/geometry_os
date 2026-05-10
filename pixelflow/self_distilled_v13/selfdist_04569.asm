; DESCRIPTION: Draws a cyan rectangle at (110, 153) with width 118 and height 101.
; PLAN: r0=110(x), r1=153(y), r2=118(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 153
LDI r2, 118
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
