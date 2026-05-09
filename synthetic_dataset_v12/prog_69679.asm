; DESCRIPTION: Draws a purple rectangle at (212, 98) with width 40 and height 13.
; PLAN: r0=212(x), r1=98(y), r2=40(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 98
LDI r2, 40
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
