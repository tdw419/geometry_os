; DESCRIPTION: Renders a white box of size 118x85 starting at (88, 47).
; PLAN: r0=88(x), r1=47(y), r2=118(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 47
LDI r2, 118
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
