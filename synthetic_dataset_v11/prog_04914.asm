; DESCRIPTION: Draws a blue rectangle at (29, 158) with width 45 and height 59.
; PLAN: r0=29(x), r1=158(y), r2=45(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 158
LDI r2, 45
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
