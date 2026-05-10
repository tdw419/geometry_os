; DESCRIPTION: Draws a green rectangle at (83, 56) with width 105 and height 17.
; PLAN: r0=83(x), r1=56(y), r2=105(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 56
LDI r2, 105
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
