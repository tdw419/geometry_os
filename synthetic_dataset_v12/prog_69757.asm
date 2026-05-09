; DESCRIPTION: Draws a purple rectangle at (206, 202) with width 13 and height 29.
; PLAN: r0=206(x), r1=202(y), r2=13(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 202
LDI r2, 13
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
