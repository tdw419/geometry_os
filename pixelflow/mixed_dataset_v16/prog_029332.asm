; DESCRIPTION: Draws a orange rectangle at (402, 24) with width 81 and height 99.
; PLAN: r0=402(x), r1=24(y), r2=81(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 24
LDI r2, 81
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
