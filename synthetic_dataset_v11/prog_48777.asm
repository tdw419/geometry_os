; DESCRIPTION: Draws a black rectangle at (98, 191) with width 29 and height 53.
; PLAN: r0=98(x), r1=191(y), r2=29(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 191
LDI r2, 29
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
