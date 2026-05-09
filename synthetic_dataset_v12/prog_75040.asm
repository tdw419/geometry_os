; DESCRIPTION: Renders a yellow box of size 119x91 starting at (314, 139).
; PLAN: r0=314(x), r1=139(y), r2=119(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 139
LDI r2, 119
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
