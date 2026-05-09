; DESCRIPTION: Renders a yellow disk with center (86, 160) and radius 52.
; PLAN: r0=86(x), r1=160(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 160
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
