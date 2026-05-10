; DESCRIPTION: Draws a blue rectangle at (221, 35) with width 67 and height 55.
; PLAN: r0=221(x), r1=35(y), r2=67(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 35
LDI r2, 67
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
