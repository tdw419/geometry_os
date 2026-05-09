; DESCRIPTION: Draws a blue rectangle at (223, 143) with width 108 and height 95.
; PLAN: r0=223(x), r1=143(y), r2=108(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 143
LDI r2, 108
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
