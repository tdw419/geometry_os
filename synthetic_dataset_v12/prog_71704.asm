; DESCRIPTION: Draws a orange rectangle at (257, 121) with width 119 and height 50.
; PLAN: r0=257(x), r1=121(y), r2=119(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 121
LDI r2, 119
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
