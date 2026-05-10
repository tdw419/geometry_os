; DESCRIPTION: Draws a black rectangle at (26, 82) with width 29 and height 28.
; PLAN: r0=26(x), r1=82(y), r2=29(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 82
LDI r2, 29
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
