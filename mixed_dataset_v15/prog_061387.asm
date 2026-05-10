; DESCRIPTION: Draws a cyan rectangle at (253, 118) with width 96 and height 114.
; PLAN: r0=253(x), r1=118(y), r2=96(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 118
LDI r2, 96
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
