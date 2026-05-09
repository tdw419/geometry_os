; DESCRIPTION: Draws a black rectangle at (116, 95) with width 34 and height 72.
; PLAN: r0=116(x), r1=95(y), r2=34(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 95
LDI r2, 34
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
