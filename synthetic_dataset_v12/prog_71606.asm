; DESCRIPTION: Draws a black rectangle at (234, 198) with width 99 and height 47.
; PLAN: r0=234(x), r1=198(y), r2=99(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 198
LDI r2, 99
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
