; DESCRIPTION: Renders a white box of size 58x89 starting at (155, 40).
; PLAN: r0=155(x), r1=40(y), r2=58(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 40
LDI r2, 58
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
