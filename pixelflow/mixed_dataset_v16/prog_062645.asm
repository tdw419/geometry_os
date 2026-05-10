; DESCRIPTION: Draws a black rectangle at (252, 102) with width 82 and height 119.
; PLAN: r0=252(x), r1=102(y), r2=82(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 102
LDI r2, 82
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
