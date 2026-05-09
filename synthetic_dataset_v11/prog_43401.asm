; DESCRIPTION: Draws a blue rectangle at (32, 8) with width 55 and height 116.
; PLAN: r0=32(x), r1=8(y), r2=55(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 8
LDI r2, 55
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
