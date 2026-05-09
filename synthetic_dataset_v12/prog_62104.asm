; DESCRIPTION: Renders a white box of size 52x118 starting at (303, 71).
; PLAN: r0=303(x), r1=71(y), r2=52(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 71
LDI r2, 52
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
