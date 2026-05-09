; DESCRIPTION: Draws a purple rectangle at (178, 35) with width 60 and height 39.
; PLAN: r0=178(x), r1=35(y), r2=60(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 35
LDI r2, 60
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
