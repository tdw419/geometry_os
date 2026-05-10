; DESCRIPTION: Draws a blue rectangle at (225, 131) with width 65 and height 84.
; PLAN: r0=225(x), r1=131(y), r2=65(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 131
LDI r2, 65
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
