; DESCRIPTION: Draws a blue rectangle at (378, 183) with width 12 and height 47.
; PLAN: r0=378(x), r1=183(y), r2=12(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 183
LDI r2, 12
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
