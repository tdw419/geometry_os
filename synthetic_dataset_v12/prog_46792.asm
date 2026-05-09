; DESCRIPTION: Draws a purple rectangle at (382, 208) with width 65 and height 40.
; PLAN: r0=382(x), r1=208(y), r2=65(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 208
LDI r2, 65
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
