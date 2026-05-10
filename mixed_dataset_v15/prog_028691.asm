; DESCRIPTION: Places a yellow circle of radius 76 at center (191, 83).
; PLAN: r0=191(x), r1=83(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 83
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
