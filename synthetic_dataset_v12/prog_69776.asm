; DESCRIPTION: Draws a blue rectangle at (40, 35) with width 62 and height 32.
; PLAN: r0=40(x), r1=35(y), r2=62(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 35
LDI r2, 62
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
