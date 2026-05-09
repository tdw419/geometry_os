; DESCRIPTION: Draws a black rectangle at (64, 230) with width 108 and height 23.
; PLAN: r0=64(x), r1=230(y), r2=108(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 230
LDI r2, 108
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
