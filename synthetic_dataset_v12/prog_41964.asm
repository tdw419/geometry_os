; DESCRIPTION: Draws a purple rectangle at (54, 74) with width 103 and height 93.
; PLAN: r0=54(x), r1=74(y), r2=103(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 74
LDI r2, 103
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
