; DESCRIPTION: Draws a black rectangle at (300, 94) with width 71 and height 116.
; PLAN: r0=300(x), r1=94(y), r2=71(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 94
LDI r2, 71
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
