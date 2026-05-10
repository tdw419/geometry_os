; DESCRIPTION: Draws a red rectangle at (310, 179) with width 17 and height 51.
; PLAN: r0=310(x), r1=179(y), r2=17(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 179
LDI r2, 17
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
