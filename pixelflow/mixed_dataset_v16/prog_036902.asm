; DESCRIPTION: Draws a black rectangle at (24, 206) with width 108 and height 19.
; PLAN: r0=24(x), r1=206(y), r2=108(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 206
LDI r2, 108
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
