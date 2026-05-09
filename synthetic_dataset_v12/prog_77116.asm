; DESCRIPTION: Draws a green rectangle at (257, 207) with width 88 and height 29.
; PLAN: r0=257(x), r1=207(y), r2=88(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 207
LDI r2, 88
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
