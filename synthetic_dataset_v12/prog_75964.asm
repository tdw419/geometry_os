; DESCRIPTION: Draws a blue rectangle at (153, 7) with width 62 and height 75.
; PLAN: r0=153(x), r1=7(y), r2=62(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 7
LDI r2, 62
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
