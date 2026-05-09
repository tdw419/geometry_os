; DESCRIPTION: Draws a purple rectangle at (276, 199) with width 13 and height 21.
; PLAN: r0=276(x), r1=199(y), r2=13(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 199
LDI r2, 13
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
