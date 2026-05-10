; DESCRIPTION: Draws a blue rectangle at (12, 78) with width 92 and height 75.
; PLAN: r0=12(x), r1=78(y), r2=92(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 78
LDI r2, 92
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
