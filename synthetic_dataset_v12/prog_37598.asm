; DESCRIPTION: Draws a blue rectangle at (222, 80) with width 92 and height 67.
; PLAN: r0=222(x), r1=80(y), r2=92(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 80
LDI r2, 92
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
