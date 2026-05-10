; DESCRIPTION: Draws a black rectangle at (157, 149) with width 100 and height 99.
; PLAN: r0=157(x), r1=149(y), r2=100(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 149
LDI r2, 100
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
