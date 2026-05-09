; DESCRIPTION: Draws a blue rectangle at (225, 23) with width 26 and height 17.
; PLAN: r0=225(x), r1=23(y), r2=26(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 23
LDI r2, 26
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
