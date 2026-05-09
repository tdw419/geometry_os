; DESCRIPTION: Draws a purple rectangle at (65, 43) with width 45 and height 28.
; PLAN: r0=65(x), r1=43(y), r2=45(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 43
LDI r2, 45
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
