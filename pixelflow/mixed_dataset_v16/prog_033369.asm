; DESCRIPTION: Renders a blue box of size 116x89 starting at (223, 141).
; PLAN: r0=223(x), r1=141(y), r2=116(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 141
LDI r2, 116
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
