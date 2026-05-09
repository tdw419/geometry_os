; DESCRIPTION: Draws a red rectangle at (157, 83) with width 29 and height 114.
; PLAN: r0=157(x), r1=83(y), r2=29(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 83
LDI r2, 29
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
