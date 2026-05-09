; DESCRIPTION: Renders a yellow box of size 77x25 starting at (159, 138).
; PLAN: r0=159(x), r1=138(y), r2=77(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 77
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
