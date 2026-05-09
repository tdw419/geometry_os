; DESCRIPTION: Draws a blue rectangle at (138, 8) with width 30 and height 62.
; PLAN: r0=138(x), r1=8(y), r2=30(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 8
LDI r2, 30
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
