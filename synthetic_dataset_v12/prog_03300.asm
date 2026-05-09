; DESCRIPTION: Draws a black rectangle at (307, 198) with width 108 and height 25.
; PLAN: r0=307(x), r1=198(y), r2=108(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 198
LDI r2, 108
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
