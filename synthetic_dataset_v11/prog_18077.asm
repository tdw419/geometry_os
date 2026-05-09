; DESCRIPTION: Renders a yellow box of size 91x112 starting at (138, 49).
; PLAN: r0=138(x), r1=49(y), r2=91(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 49
LDI r2, 91
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
