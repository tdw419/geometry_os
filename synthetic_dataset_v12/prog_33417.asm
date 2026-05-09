; DESCRIPTION: Renders a black box of size 91x94 starting at (343, 158).
; PLAN: r0=343(x), r1=158(y), r2=91(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 158
LDI r2, 91
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
