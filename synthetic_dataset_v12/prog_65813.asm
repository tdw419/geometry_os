; DESCRIPTION: Renders a yellow box of size 112x98 starting at (399, 109).
; PLAN: r0=399(x), r1=109(y), r2=112(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 109
LDI r2, 112
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
