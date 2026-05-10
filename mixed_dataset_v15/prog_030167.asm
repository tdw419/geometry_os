; DESCRIPTION: Draws a blue rectangle at (15, 75) with width 59 and height 62.
; PLAN: r0=15(x), r1=75(y), r2=59(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 75
LDI r2, 59
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
