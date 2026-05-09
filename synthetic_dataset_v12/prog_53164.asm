; DESCRIPTION: Draws a black rectangle at (252, 191) with width 17 and height 19.
; PLAN: r0=252(x), r1=191(y), r2=17(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 191
LDI r2, 17
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
