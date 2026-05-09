; DESCRIPTION: Draws a blue rectangle at (48, 192) with width 83 and height 63.
; PLAN: r0=48(x), r1=192(y), r2=83(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 192
LDI r2, 83
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
