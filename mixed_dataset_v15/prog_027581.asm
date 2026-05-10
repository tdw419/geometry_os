; DESCRIPTION: Draws a blue rectangle at (247, 86) with width 70 and height 109.
; PLAN: r0=247(x), r1=86(y), r2=70(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 86
LDI r2, 70
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
