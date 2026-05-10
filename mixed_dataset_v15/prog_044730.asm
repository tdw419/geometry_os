; DESCRIPTION: Draws a purple rectangle at (64, 108) with width 47 and height 80.
; PLAN: r0=64(x), r1=108(y), r2=47(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 108
LDI r2, 47
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
