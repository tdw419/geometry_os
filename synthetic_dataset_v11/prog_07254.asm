; DESCRIPTION: Draws a blue rectangle at (20, 19) with width 109 and height 59.
; PLAN: r0=20(x), r1=19(y), r2=109(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 19
LDI r2, 109
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
