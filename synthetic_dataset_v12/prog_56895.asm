; DESCRIPTION: Renders a yellow disk with center (218, 217) and radius 36.
; PLAN: r0=218(x), r1=217(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 217
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
