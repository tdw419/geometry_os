; DESCRIPTION: Draws a green rectangle at (195, 81) with width 34 and height 68.
; PLAN: r0=195(x), r1=81(y), r2=34(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 81
LDI r2, 34
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
