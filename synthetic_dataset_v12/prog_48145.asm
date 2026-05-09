; DESCRIPTION: Draws a purple rectangle at (180, 191) with width 35 and height 58.
; PLAN: r0=180(x), r1=191(y), r2=35(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 191
LDI r2, 35
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
