; DESCRIPTION: Draws a green rectangle at (45, 43) with width 44 and height 101.
; PLAN: r0=45(x), r1=43(y), r2=44(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 43
LDI r2, 44
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
