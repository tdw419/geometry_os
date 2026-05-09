; DESCRIPTION: Draws a purple rectangle at (197, 83) with width 46 and height 63.
; PLAN: r0=197(x), r1=83(y), r2=46(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 83
LDI r2, 46
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
