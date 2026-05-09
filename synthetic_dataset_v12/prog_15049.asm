; DESCRIPTION: Draws a green rectangle at (194, 144) with width 117 and height 109.
; PLAN: r0=194(x), r1=144(y), r2=117(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 144
LDI r2, 117
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
