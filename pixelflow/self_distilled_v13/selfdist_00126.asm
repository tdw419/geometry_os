; DESCRIPTION: Draws a green rectangle at (176, 24) with width 69 and height 114.
; PLAN: r0=176(x), r1=24(y), r2=69(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 24
LDI r2, 69
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
