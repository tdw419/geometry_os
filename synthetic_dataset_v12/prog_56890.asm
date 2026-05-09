; DESCRIPTION: Draws a orange rectangle at (257, 83) with width 34 and height 19.
; PLAN: r0=257(x), r1=83(y), r2=34(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 83
LDI r2, 34
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
