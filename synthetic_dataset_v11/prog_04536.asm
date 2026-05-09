; DESCRIPTION: Renders a purple box of size 31x47 starting at (169, 15).
; PLAN: r0=169(x), r1=15(y), r2=31(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 15
LDI r2, 31
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
