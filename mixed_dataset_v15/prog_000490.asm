; DESCRIPTION: Draws a purple rectangle at (403, 66) with width 74 and height 58.
; PLAN: r0=403(x), r1=66(y), r2=74(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 66
LDI r2, 74
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
