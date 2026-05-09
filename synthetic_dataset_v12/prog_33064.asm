; DESCRIPTION: Draws a green rectangle at (4, 39) with width 105 and height 63.
; PLAN: r0=4(x), r1=39(y), r2=105(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 39
LDI r2, 105
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
