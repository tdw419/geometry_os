; DESCRIPTION: Renders a white box of size 117x46 starting at (343, 58).
; PLAN: r0=343(x), r1=58(y), r2=117(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 58
LDI r2, 117
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
