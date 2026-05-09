; DESCRIPTION: Draws a blue rectangle at (142, 86) with width 71 and height 75.
; PLAN: r0=142(x), r1=86(y), r2=71(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 86
LDI r2, 71
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
