; DESCRIPTION: Draws a blue rectangle at (48, 78) with width 30 and height 45.
; PLAN: r0=48(x), r1=78(y), r2=30(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 78
LDI r2, 30
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
