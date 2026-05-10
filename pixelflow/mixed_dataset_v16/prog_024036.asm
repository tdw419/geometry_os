; DESCRIPTION: Draws a purple rectangle at (244, 150) with width 102 and height 77.
; PLAN: r0=244(x), r1=150(y), r2=102(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 150
LDI r2, 102
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
