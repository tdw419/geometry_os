; DESCRIPTION: Renders a yellow disk with center (74, 218) and radius 38.
; PLAN: r0=74(x), r1=218(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 218
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
