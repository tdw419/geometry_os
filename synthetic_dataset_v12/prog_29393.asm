; DESCRIPTION: Renders a yellow box of size 28x73 starting at (343, 112).
; PLAN: r0=343(x), r1=112(y), r2=28(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 112
LDI r2, 28
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
