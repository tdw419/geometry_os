; DESCRIPTION: Draws a purple rectangle at (349, 38) with width 64 and height 77.
; PLAN: r0=349(x), r1=38(y), r2=64(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 38
LDI r2, 64
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
