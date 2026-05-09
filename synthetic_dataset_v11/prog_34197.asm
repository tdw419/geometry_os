; DESCRIPTION: Draws a blue rectangle at (133, 55) with width 116 and height 76.
; PLAN: r0=133(x), r1=55(y), r2=116(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 55
LDI r2, 116
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
