; DESCRIPTION: Renders a yellow box of size 91x46 starting at (119, 129).
; PLAN: r0=119(x), r1=129(y), r2=91(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 129
LDI r2, 91
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
