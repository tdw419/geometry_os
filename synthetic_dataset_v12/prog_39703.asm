; DESCRIPTION: Renders a yellow box of size 119x111 starting at (189, 110).
; PLAN: r0=189(x), r1=110(y), r2=119(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 110
LDI r2, 119
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
