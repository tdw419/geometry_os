; DESCRIPTION: Draws a green rectangle at (35, 19) with width 101 and height 82.
; PLAN: r0=35(x), r1=19(y), r2=101(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 19
LDI r2, 101
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
