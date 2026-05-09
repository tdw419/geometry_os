; DESCRIPTION: Draws a purple rectangle at (208, 13) with width 38 and height 68.
; PLAN: r0=208(x), r1=13(y), r2=38(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 13
LDI r2, 38
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
