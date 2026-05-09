; DESCRIPTION: Draws a blue rectangle at (5, 92) with width 26 and height 77.
; PLAN: r0=5(x), r1=92(y), r2=26(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 92
LDI r2, 26
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
