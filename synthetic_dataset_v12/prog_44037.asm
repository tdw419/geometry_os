; DESCRIPTION: Draws a green rectangle at (195, 49) with width 109 and height 30.
; PLAN: r0=195(x), r1=49(y), r2=109(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 49
LDI r2, 109
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
