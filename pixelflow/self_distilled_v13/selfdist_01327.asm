; DESCRIPTION: Draws a blue rectangle at (257, 19) with width 15 and height 103.
; PLAN: r0=257(x), r1=19(y), r2=15(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 19
LDI r2, 15
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
