; DESCRIPTION: Draws a purple rectangle at (123, 103) with width 69 and height 57.
; PLAN: r0=123(x), r1=103(y), r2=69(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 103
LDI r2, 69
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
