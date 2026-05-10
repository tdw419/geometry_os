; DESCRIPTION: Draws a green rectangle at (179, 190) with width 84 and height 43.
; PLAN: r0=179(x), r1=190(y), r2=84(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 190
LDI r2, 84
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
