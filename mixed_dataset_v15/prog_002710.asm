; DESCRIPTION: Draws a yellow rectangle at (257, 59) with width 57 and height 61.
; PLAN: r0=257(x), r1=59(y), r2=57(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 59
LDI r2, 57
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
