; DESCRIPTION: Draws a purple rectangle at (98, 60) with width 67 and height 120.
; PLAN: r0=98(x), r1=60(y), r2=67(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 60
LDI r2, 67
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
