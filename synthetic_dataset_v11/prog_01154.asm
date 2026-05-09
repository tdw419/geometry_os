; DESCRIPTION: Places a yellow circle of radius 68 at center (149, 160).
; PLAN: r0=149(x), r1=160(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 160
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
