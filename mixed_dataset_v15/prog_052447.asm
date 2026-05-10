; DESCRIPTION: Draws a cyan rectangle at (179, 106) with width 115 and height 26.
; PLAN: r0=179(x), r1=106(y), r2=115(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 106
LDI r2, 115
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
