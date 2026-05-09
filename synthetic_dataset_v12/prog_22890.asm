; DESCRIPTION: Draws a green rectangle at (119, 109) with width 12 and height 107.
; PLAN: r0=119(x), r1=109(y), r2=12(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 109
LDI r2, 12
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
