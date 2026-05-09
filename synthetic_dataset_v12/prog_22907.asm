; DESCRIPTION: Draws a blue rectangle at (71, 29) with width 91 and height 44.
; PLAN: r0=71(x), r1=29(y), r2=91(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 29
LDI r2, 91
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
