; DESCRIPTION: Draws a black rectangle at (119, 121) with width 82 and height 76.
; PLAN: r0=119(x), r1=121(y), r2=82(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 121
LDI r2, 82
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
