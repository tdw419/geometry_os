; DESCRIPTION: Draws a blue rectangle at (233, 43) with width 91 and height 86.
; PLAN: r0=233(x), r1=43(y), r2=91(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 43
LDI r2, 91
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
