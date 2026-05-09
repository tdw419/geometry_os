; DESCRIPTION: Renders a yellow box of size 112x84 starting at (334, 129).
; PLAN: r0=334(x), r1=129(y), r2=112(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 129
LDI r2, 112
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
