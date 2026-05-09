; DESCRIPTION: Draws a black rectangle at (2, 141) with width 111 and height 51.
; PLAN: r0=2(x), r1=141(y), r2=111(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 141
LDI r2, 111
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
