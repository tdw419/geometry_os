; DESCRIPTION: Draws a purple rectangle at (420, 197) with width 60 and height 37.
; PLAN: r0=420(x), r1=197(y), r2=60(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 197
LDI r2, 60
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
