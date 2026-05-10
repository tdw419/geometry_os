; DESCRIPTION: Renders a yellow box of size 110x116 starting at (36, 100).
; PLAN: r0=36(x), r1=100(y), r2=110(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 100
LDI r2, 110
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
