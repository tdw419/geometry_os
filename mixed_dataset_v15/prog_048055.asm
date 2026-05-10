; DESCRIPTION: Renders a yellow box of size 35x49 starting at (234, 100).
; PLAN: r0=234(x), r1=100(y), r2=35(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 100
LDI r2, 35
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
