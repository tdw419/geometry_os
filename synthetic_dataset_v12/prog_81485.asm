; DESCRIPTION: Draws a cyan rectangle at (95, 96) with width 118 and height 105.
; PLAN: r0=95(x), r1=96(y), r2=118(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 96
LDI r2, 118
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
