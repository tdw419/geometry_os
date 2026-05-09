; DESCRIPTION: Draws a purple rectangle at (418, 57) with width 11 and height 18.
; PLAN: r0=418(x), r1=57(y), r2=11(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 57
LDI r2, 11
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
