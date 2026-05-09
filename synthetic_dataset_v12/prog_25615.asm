; DESCRIPTION: Draws a purple rectangle at (185, 103) with width 82 and height 77.
; PLAN: r0=185(x), r1=103(y), r2=82(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 103
LDI r2, 82
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
