; DESCRIPTION: Places a yellow disk with center (18, 46) and radius 55.
; PLAN: r0=18(x), r1=46(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 46
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
