; DESCRIPTION: Draws a purple rectangle at (314, 149) with width 16 and height 90.
; PLAN: r0=314(x), r1=149(y), r2=16(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 149
LDI r2, 16
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
