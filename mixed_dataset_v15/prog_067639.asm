; DESCRIPTION: Draws a blue rectangle at (217, 63) with width 108 and height 101.
; PLAN: r0=217(x), r1=63(y), r2=108(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 63
LDI r2, 108
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
