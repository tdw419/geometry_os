; DESCRIPTION: Draws a orange rectangle at (402, 155) with width 64 and height 76.
; PLAN: r0=402(x), r1=155(y), r2=64(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 155
LDI r2, 64
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
