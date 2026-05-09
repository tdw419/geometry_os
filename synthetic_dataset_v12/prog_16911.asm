; DESCRIPTION: Draws a blue rectangle at (65, 1) with width 30 and height 64.
; PLAN: r0=65(x), r1=1(y), r2=30(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 1
LDI r2, 30
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
