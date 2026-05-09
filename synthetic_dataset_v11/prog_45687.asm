; DESCRIPTION: Draws a blue rectangle at (12, 117) with width 62 and height 92.
; PLAN: r0=12(x), r1=117(y), r2=62(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 117
LDI r2, 62
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
