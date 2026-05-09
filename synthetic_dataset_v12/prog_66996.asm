; DESCRIPTION: Draws a purple rectangle at (454, 93) with width 36 and height 113.
; PLAN: r0=454(x), r1=93(y), r2=36(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 93
LDI r2, 36
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
