; DESCRIPTION: Draws a black rectangle at (129, 82) with width 24 and height 69.
; PLAN: r0=129(x), r1=82(y), r2=24(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 82
LDI r2, 24
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
