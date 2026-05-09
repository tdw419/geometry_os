; DESCRIPTION: Draws a black rectangle at (30, 105) with width 82 and height 23.
; PLAN: r0=30(x), r1=105(y), r2=82(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 105
LDI r2, 82
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
