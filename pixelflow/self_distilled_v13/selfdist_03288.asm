; DESCRIPTION: Draws a cyan rectangle at (124, 137) with width 118 and height 116.
; PLAN: r0=124(x), r1=137(y), r2=118(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 137
LDI r2, 118
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
