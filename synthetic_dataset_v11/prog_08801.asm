; DESCRIPTION: Draws a blue rectangle at (13, 132) with width 92 and height 59.
; PLAN: r0=13(x), r1=132(y), r2=92(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 132
LDI r2, 92
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
