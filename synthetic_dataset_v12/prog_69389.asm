; DESCRIPTION: Draws a black rectangle at (20, 111) with width 45 and height 51.
; PLAN: r0=20(x), r1=111(y), r2=45(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 111
LDI r2, 45
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
