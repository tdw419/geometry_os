; DESCRIPTION: Draws a purple rectangle at (400, 90) with width 16 and height 97.
; PLAN: r0=400(x), r1=90(y), r2=16(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 90
LDI r2, 16
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
