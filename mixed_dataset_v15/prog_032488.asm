; DESCRIPTION: Renders a white box of size 17x114 starting at (461, 130).
; PLAN: r0=461(x), r1=130(y), r2=17(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 130
LDI r2, 17
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
