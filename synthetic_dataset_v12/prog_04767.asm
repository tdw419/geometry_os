; DESCRIPTION: Draws a purple rectangle at (356, 143) with width 120 and height 76.
; PLAN: r0=356(x), r1=143(y), r2=120(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 143
LDI r2, 120
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
