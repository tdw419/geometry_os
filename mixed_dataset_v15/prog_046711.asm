; DESCRIPTION: Places a yellow disk with center (77, 24) and radius 27.
; PLAN: r0=77(x), r1=24(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 24
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
