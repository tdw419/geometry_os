; DESCRIPTION: Draws a blue rectangle at (65, 128) with width 112 and height 43.
; PLAN: r0=65(x), r1=128(y), r2=112(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 128
LDI r2, 112
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
