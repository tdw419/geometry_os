; DESCRIPTION: Draws a blue rectangle at (72, 30) with width 14 and height 23.
; PLAN: r0=72(x), r1=30(y), r2=14(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 30
LDI r2, 14
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
