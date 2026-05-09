; DESCRIPTION: Renders a yellow box of size 96x85 starting at (28, 112).
; PLAN: r0=28(x), r1=112(y), r2=96(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 112
LDI r2, 96
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
