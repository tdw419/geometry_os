; DESCRIPTION: Draws a white rectangle at (49, 191) with width 21 and height 15.
; PLAN: r0=49(x), r1=191(y), r2=21(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 191
LDI r2, 21
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
