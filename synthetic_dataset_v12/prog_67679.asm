; DESCRIPTION: Draws a black rectangle at (321, 82) with width 47 and height 43.
; PLAN: r0=321(x), r1=82(y), r2=47(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 82
LDI r2, 47
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
