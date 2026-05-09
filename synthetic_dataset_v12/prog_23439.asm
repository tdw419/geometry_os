; DESCRIPTION: Renders a white box of size 52x118 starting at (302, 78).
; PLAN: r0=302(x), r1=78(y), r2=52(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 78
LDI r2, 52
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
