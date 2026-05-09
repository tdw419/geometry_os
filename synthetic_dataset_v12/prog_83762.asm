; DESCRIPTION: Draws a red rectangle at (67, 90) with width 89 and height 58.
; PLAN: r0=67(x), r1=90(y), r2=89(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 90
LDI r2, 89
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
