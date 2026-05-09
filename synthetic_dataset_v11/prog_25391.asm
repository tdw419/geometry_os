; DESCRIPTION: Draws a yellow rectangle at (90, 157) with width 115 and height 51.
; PLAN: r0=90(x), r1=157(y), r2=115(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 157
LDI r2, 115
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
