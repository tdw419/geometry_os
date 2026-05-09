; DESCRIPTION: Renders a purple box of size 116x76 starting at (89, 138).
; PLAN: r0=89(x), r1=138(y), r2=116(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 138
LDI r2, 116
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
