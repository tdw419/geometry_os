; DESCRIPTION: Draws a blue rectangle at (83, 11) with width 54 and height 59.
; PLAN: r0=83(x), r1=11(y), r2=54(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 11
LDI r2, 54
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
