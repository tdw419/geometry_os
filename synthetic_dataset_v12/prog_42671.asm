; DESCRIPTION: Draws a blue rectangle at (396, 109) with width 100 and height 61.
; PLAN: r0=396(x), r1=109(y), r2=100(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 109
LDI r2, 100
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
