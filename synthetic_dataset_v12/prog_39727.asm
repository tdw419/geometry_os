; DESCRIPTION: Renders a yellow box of size 76x17 starting at (222, 201).
; PLAN: r0=222(x), r1=201(y), r2=76(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 201
LDI r2, 76
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
