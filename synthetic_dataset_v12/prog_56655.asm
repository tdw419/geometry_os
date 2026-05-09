; DESCRIPTION: Draws a blue rectangle at (388, 26) with width 17 and height 112.
; PLAN: r0=388(x), r1=26(y), r2=17(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 26
LDI r2, 17
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
