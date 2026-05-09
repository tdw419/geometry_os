; DESCRIPTION: Draws a cyan rectangle at (157, 4) with width 118 and height 97.
; PLAN: r0=157(x), r1=4(y), r2=118(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 4
LDI r2, 118
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
