; DESCRIPTION: Draws a black rectangle at (51, 189) with width 120 and height 46.
; PLAN: r0=51(x), r1=189(y), r2=120(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 189
LDI r2, 120
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
