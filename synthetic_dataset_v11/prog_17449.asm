; DESCRIPTION: Draws a green rectangle at (91, 191) with width 76 and height 19.
; PLAN: r0=91(x), r1=191(y), r2=76(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 191
LDI r2, 76
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
