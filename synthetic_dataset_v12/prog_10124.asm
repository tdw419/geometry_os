; DESCRIPTION: Renders a black box of size 70x29 starting at (311, 105).
; PLAN: r0=311(x), r1=105(y), r2=70(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 105
LDI r2, 70
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
