; DESCRIPTION: Draws a blue rectangle at (49, 68) with width 103 and height 92.
; PLAN: r0=49(x), r1=68(y), r2=103(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 68
LDI r2, 103
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
