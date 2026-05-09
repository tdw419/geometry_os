; DESCRIPTION: Renders a white box of size 85x118 starting at (112, 25).
; PLAN: r0=112(x), r1=25(y), r2=85(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 25
LDI r2, 85
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
