; DESCRIPTION: Draws a blue rectangle at (222, 174) with width 33 and height 29.
; PLAN: r0=222(x), r1=174(y), r2=33(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 174
LDI r2, 33
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
