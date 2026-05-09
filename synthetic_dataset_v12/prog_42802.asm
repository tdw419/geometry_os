; DESCRIPTION: Draws a purple rectangle at (304, 26) with width 113 and height 85.
; PLAN: r0=304(x), r1=26(y), r2=113(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 26
LDI r2, 113
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
