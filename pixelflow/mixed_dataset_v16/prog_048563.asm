; DESCRIPTION: Draws a purple rectangle at (425, 99) with width 76 and height 37.
; PLAN: r0=425(x), r1=99(y), r2=76(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 99
LDI r2, 76
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
