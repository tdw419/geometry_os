; DESCRIPTION: Draws a blue rectangle at (318, 111) with width 101 and height 87.
; PLAN: r0=318(x), r1=111(y), r2=101(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 111
LDI r2, 101
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
