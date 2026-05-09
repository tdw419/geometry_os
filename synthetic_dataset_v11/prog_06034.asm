; DESCRIPTION: Renders a white box of size 115x118 starting at (61, 2).
; PLAN: r0=61(x), r1=2(y), r2=115(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 2
LDI r2, 115
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
