; DESCRIPTION: Renders a yellow box of size 99x112 starting at (191, 47).
; PLAN: r0=191(x), r1=47(y), r2=99(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 47
LDI r2, 99
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
