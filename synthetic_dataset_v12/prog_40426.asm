; DESCRIPTION: Draws a red rectangle at (67, 142) with width 25 and height 73.
; PLAN: r0=67(x), r1=142(y), r2=25(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 142
LDI r2, 25
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
