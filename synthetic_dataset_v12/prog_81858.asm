; DESCRIPTION: Draws a black rectangle at (353, 108) with width 101 and height 16.
; PLAN: r0=353(x), r1=108(y), r2=101(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 108
LDI r2, 101
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
