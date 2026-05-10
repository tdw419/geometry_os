; DESCRIPTION: Draws a purple rectangle at (278, 209) with width 34 and height 30.
; PLAN: r0=278(x), r1=209(y), r2=34(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 209
LDI r2, 34
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
