; DESCRIPTION: Draws a black rectangle at (158, 70) with width 71 and height 104.
; PLAN: r0=158(x), r1=70(y), r2=71(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 70
LDI r2, 71
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
