; DESCRIPTION: Draws a purple rectangle at (329, 195) with width 14 and height 61.
; PLAN: r0=329(x), r1=195(y), r2=14(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 195
LDI r2, 14
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
