; DESCRIPTION: Draws a black rectangle at (203, 49) with width 102 and height 61.
; PLAN: r0=203(x), r1=49(y), r2=102(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 49
LDI r2, 102
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
