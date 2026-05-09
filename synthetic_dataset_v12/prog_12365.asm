; DESCRIPTION: Draws a black rectangle at (257, 126) with width 40 and height 106.
; PLAN: r0=257(x), r1=126(y), r2=40(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 126
LDI r2, 40
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
