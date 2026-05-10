; DESCRIPTION: Draws a black rectangle at (149, 81) with width 76 and height 92.
; PLAN: r0=149(x), r1=81(y), r2=76(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 81
LDI r2, 76
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
