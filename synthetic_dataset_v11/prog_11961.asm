; DESCRIPTION: Draws a blue rectangle at (5, 74) with width 34 and height 100.
; PLAN: r0=5(x), r1=74(y), r2=34(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 74
LDI r2, 34
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
