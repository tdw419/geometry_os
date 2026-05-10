; DESCRIPTION: Draws a blue rectangle at (378, 56) with width 102 and height 120.
; PLAN: r0=378(x), r1=56(y), r2=102(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 56
LDI r2, 102
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
