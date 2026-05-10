; DESCRIPTION: Draws a purple rectangle at (345, 82) with width 40 and height 98.
; PLAN: r0=345(x), r1=82(y), r2=40(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 82
LDI r2, 40
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
