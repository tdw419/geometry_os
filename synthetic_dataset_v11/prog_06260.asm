; DESCRIPTION: Renders a yellow box of size 101x31 starting at (139, 223).
; PLAN: r0=139(x), r1=223(y), r2=101(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 223
LDI r2, 101
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
