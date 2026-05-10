; DESCRIPTION: Draws a blue rectangle at (18, 193) with width 72 and height 62.
; PLAN: r0=18(x), r1=193(y), r2=72(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 193
LDI r2, 72
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
