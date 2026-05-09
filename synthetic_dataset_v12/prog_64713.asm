; DESCRIPTION: Draws a green rectangle at (191, 81) with width 13 and height 45.
; PLAN: r0=191(x), r1=81(y), r2=13(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 81
LDI r2, 13
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
