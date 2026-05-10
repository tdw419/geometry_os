; DESCRIPTION: Draws a black rectangle at (300, 156) with width 108 and height 15.
; PLAN: r0=300(x), r1=156(y), r2=108(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 156
LDI r2, 108
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
