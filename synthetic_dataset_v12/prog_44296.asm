; DESCRIPTION: Draws a red rectangle at (257, 39) with width 77 and height 112.
; PLAN: r0=257(x), r1=39(y), r2=77(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 39
LDI r2, 77
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
