; DESCRIPTION: Draws a blue rectangle at (128, 5) with width 100 and height 79.
; PLAN: r0=128(x), r1=5(y), r2=100(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 5
LDI r2, 100
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
