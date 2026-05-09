; DESCRIPTION: Draws a purple rectangle at (304, 86) with width 22 and height 103.
; PLAN: r0=304(x), r1=86(y), r2=22(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 86
LDI r2, 22
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
