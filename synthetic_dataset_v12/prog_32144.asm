; DESCRIPTION: Draws a purple rectangle at (38, 74) with width 82 and height 26.
; PLAN: r0=38(x), r1=74(y), r2=82(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 74
LDI r2, 82
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
