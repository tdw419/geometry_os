; DESCRIPTION: Renders a yellow disk with center (468, 66) and radius 14.
; PLAN: r0=468(x), r1=66(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 66
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
