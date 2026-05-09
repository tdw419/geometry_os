; DESCRIPTION: Draws a green rectangle at (343, 150) with width 53 and height 63.
; PLAN: r0=343(x), r1=150(y), r2=53(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 150
LDI r2, 53
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
