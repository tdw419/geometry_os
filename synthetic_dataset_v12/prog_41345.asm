; DESCRIPTION: Draws a blue rectangle at (241, 192) with width 11 and height 37.
; PLAN: r0=241(x), r1=192(y), r2=11(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 192
LDI r2, 11
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
