; DESCRIPTION: Places a yellow disk with center (112, 79) and radius 14.
; PLAN: r0=112(x), r1=79(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 79
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
