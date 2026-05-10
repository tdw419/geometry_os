; DESCRIPTION: Draws a green rectangle at (55, 27) with width 101 and height 39.
; PLAN: r0=55(x), r1=27(y), r2=101(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 27
LDI r2, 101
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
