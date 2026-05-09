; DESCRIPTION: Renders a yellow box of size 116x56 starting at (112, 11).
; PLAN: r0=112(x), r1=11(y), r2=116(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 11
LDI r2, 116
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
