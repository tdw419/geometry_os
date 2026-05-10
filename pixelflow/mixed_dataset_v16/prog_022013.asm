; DESCRIPTION: Draws a black rectangle at (33, 115) with width 82 and height 106.
; PLAN: r0=33(x), r1=115(y), r2=82(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 115
LDI r2, 82
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
