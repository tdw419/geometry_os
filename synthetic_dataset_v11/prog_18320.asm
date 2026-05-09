; DESCRIPTION: Draws a purple rectangle at (49, 85) with width 67 and height 120.
; PLAN: r0=49(x), r1=85(y), r2=67(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 85
LDI r2, 67
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
