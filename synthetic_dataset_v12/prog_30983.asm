; DESCRIPTION: Draws a orange rectangle at (257, 51) with width 117 and height 103.
; PLAN: r0=257(x), r1=51(y), r2=117(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 51
LDI r2, 117
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
