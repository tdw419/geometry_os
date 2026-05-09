; DESCRIPTION: Draws a black rectangle at (106, 93) with width 105 and height 53.
; PLAN: r0=106(x), r1=93(y), r2=105(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 93
LDI r2, 105
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
