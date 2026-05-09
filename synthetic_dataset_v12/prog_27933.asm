; DESCRIPTION: Renders a purple box of size 109x116 starting at (169, 79).
; PLAN: r0=169(x), r1=79(y), r2=109(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 79
LDI r2, 109
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
