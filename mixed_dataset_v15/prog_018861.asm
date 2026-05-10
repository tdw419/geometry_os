; DESCRIPTION: Draws a purple rectangle at (293, 211) with width 47 and height 11.
; PLAN: r0=293(x), r1=211(y), r2=47(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 211
LDI r2, 47
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
