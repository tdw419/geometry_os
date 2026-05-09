; DESCRIPTION: Renders a yellow disk with center (77, 38) and radius 14.
; PLAN: r0=77(x), r1=38(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 38
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
