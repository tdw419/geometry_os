; DESCRIPTION: Draws a purple rectangle at (98, 159) with width 109 and height 21.
; PLAN: r0=98(x), r1=159(y), r2=109(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 159
LDI r2, 109
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
