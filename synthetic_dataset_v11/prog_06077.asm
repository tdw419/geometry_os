; DESCRIPTION: Draws a purple rectangle at (33, 131) with width 39 and height 47.
; PLAN: r0=33(x), r1=131(y), r2=39(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 131
LDI r2, 39
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
