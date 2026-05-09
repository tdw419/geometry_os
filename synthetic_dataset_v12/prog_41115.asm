; DESCRIPTION: Draws a black rectangle at (377, 45) with width 114 and height 19.
; PLAN: r0=377(x), r1=45(y), r2=114(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 45
LDI r2, 114
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
