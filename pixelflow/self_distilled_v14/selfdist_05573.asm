; DESCRIPTION: Draws a purple rectangle at (217, 108) with width 64 and height 36.
; PLAN: r0=217(x), r1=108(y), r2=64(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 108
LDI r2, 64
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
