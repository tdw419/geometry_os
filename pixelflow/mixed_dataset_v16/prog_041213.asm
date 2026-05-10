; DESCRIPTION: Draws a blue rectangle at (396, 119) with width 116 and height 13.
; PLAN: r0=396(x), r1=119(y), r2=116(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 119
LDI r2, 116
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
