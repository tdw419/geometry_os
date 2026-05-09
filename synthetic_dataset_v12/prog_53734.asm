; DESCRIPTION: Draws a black rectangle at (402, 62) with width 84 and height 108.
; PLAN: r0=402(x), r1=62(y), r2=84(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 62
LDI r2, 84
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
