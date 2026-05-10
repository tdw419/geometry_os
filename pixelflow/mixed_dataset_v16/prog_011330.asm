; DESCRIPTION: Draws a blue rectangle at (222, 1) with width 59 and height 59.
; PLAN: r0=222(x), r1=1(y), r2=59(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 1
LDI r2, 59
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
