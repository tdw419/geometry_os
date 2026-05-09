; DESCRIPTION: Draws a black rectangle at (96, 119) with width 82 and height 34.
; PLAN: r0=96(x), r1=119(y), r2=82(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 119
LDI r2, 82
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
