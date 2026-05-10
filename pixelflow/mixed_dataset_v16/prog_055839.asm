; DESCRIPTION: Draws a red rectangle at (390, 181) with width 67 and height 53.
; PLAN: r0=390(x), r1=181(y), r2=67(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 181
LDI r2, 67
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
