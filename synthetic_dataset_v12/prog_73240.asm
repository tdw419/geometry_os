; DESCRIPTION: Draws a black rectangle at (302, 204) with width 83 and height 51.
; PLAN: r0=302(x), r1=204(y), r2=83(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 204
LDI r2, 83
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
