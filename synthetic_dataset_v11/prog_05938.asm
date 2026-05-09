; DESCRIPTION: Draws a blue rectangle at (20, 96) with width 85 and height 100.
; PLAN: r0=20(x), r1=96(y), r2=85(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 96
LDI r2, 85
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
