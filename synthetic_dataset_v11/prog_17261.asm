; DESCRIPTION: Draws a purple rectangle at (53, 67) with width 47 and height 98.
; PLAN: r0=53(x), r1=67(y), r2=47(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 67
LDI r2, 47
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
