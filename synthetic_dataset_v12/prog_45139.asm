; DESCRIPTION: Draws a black rectangle at (222, 4) with width 76 and height 82.
; PLAN: r0=222(x), r1=4(y), r2=76(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 4
LDI r2, 76
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
