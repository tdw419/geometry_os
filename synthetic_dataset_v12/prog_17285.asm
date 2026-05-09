; DESCRIPTION: Draws a green rectangle at (361, 17) with width 64 and height 43.
; PLAN: r0=361(x), r1=17(y), r2=64(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 17
LDI r2, 64
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
