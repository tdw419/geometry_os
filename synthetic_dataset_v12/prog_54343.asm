; DESCRIPTION: Draws a purple rectangle at (287, 159) with width 21 and height 65.
; PLAN: r0=287(x), r1=159(y), r2=21(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 159
LDI r2, 21
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
