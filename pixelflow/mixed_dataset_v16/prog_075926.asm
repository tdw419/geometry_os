; DESCRIPTION: Renders a yellow box of size 31x101 starting at (244, 3).
; PLAN: r0=244(x), r1=3(y), r2=31(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 3
LDI r2, 31
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
