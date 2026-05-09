; DESCRIPTION: Draws a green rectangle at (274, 4) with width 103 and height 118.
; PLAN: r0=274(x), r1=4(y), r2=103(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 4
LDI r2, 103
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
