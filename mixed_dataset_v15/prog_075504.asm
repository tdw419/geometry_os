; DESCRIPTION: Draws a blue rectangle at (136, 46) with width 44 and height 98.
; PLAN: r0=136(x), r1=46(y), r2=44(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 46
LDI r2, 44
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
