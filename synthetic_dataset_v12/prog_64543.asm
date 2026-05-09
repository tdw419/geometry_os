; DESCRIPTION: Draws a blue rectangle at (318, 172) with width 60 and height 13.
; PLAN: r0=318(x), r1=172(y), r2=60(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 172
LDI r2, 60
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
