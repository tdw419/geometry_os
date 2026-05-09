; DESCRIPTION: Draws a blue rectangle at (122, 55) with width 64 and height 80.
; PLAN: r0=122(x), r1=55(y), r2=64(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 55
LDI r2, 64
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
