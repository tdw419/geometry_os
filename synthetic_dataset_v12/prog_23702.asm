; DESCRIPTION: Places a yellow circle of radius 46 at center (86, 46).
; PLAN: r0=86(x), r1=46(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 46
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
