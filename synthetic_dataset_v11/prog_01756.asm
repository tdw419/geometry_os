; DESCRIPTION: Renders a yellow box of size 45x58 starting at (62, 31).
; PLAN: r0=62(x), r1=31(y), r2=45(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 31
LDI r2, 45
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
