; DESCRIPTION: Draws a blue rectangle at (469, 130) with width 31 and height 37.
; PLAN: r0=469(x), r1=130(y), r2=31(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 130
LDI r2, 31
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
