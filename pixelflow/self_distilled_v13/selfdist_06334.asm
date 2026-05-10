; DESCRIPTION: Draws a purple rectangle at (25, 59) with width 104 and height 74.
; PLAN: r0=25(x), r1=59(y), r2=104(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 59
LDI r2, 104
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
