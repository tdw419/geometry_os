; DESCRIPTION: Renders a white box of size 115x85 starting at (169, 58).
; PLAN: r0=169(x), r1=58(y), r2=115(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 58
LDI r2, 115
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
