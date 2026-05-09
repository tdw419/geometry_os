; DESCRIPTION: Renders a yellow disk with center (198, 160) and radius 44.
; PLAN: r0=198(x), r1=160(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 160
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
