; DESCRIPTION: Places a yellow circle of radius 20 at center (31, 46).
; PLAN: r0=31(x), r1=46(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 46
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
