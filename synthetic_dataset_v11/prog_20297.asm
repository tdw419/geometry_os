; DESCRIPTION: Draws a black rectangle at (94, 41) with width 116 and height 92.
; PLAN: r0=94(x), r1=41(y), r2=116(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 41
LDI r2, 116
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
