; DESCRIPTION: Draws a purple rectangle at (189, 74) with width 13 and height 28.
; PLAN: r0=189(x), r1=74(y), r2=13(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 74
LDI r2, 13
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
