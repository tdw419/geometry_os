; DESCRIPTION: Draws a purple rectangle at (263, 132) with width 60 and height 52.
; PLAN: r0=263(x), r1=132(y), r2=60(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 132
LDI r2, 60
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
