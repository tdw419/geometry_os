; DESCRIPTION: Renders a purple box of size 89x116 starting at (145, 34).
; PLAN: r0=145(x), r1=34(y), r2=89(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 34
LDI r2, 89
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
