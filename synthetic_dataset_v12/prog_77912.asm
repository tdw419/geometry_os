; DESCRIPTION: Draws a magenta rectangle at (257, 11) with width 52 and height 86.
; PLAN: r0=257(x), r1=11(y), r2=52(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 11
LDI r2, 52
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
