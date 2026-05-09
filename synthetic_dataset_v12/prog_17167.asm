; DESCRIPTION: Draws a green rectangle at (264, 155) with width 28 and height 30.
; PLAN: r0=264(x), r1=155(y), r2=28(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 155
LDI r2, 28
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
