; DESCRIPTION: Draws a blue rectangle at (85, 48) with width 120 and height 69.
; PLAN: r0=85(x), r1=48(y), r2=120(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 48
LDI r2, 120
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
