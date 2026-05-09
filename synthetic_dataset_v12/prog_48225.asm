; DESCRIPTION: Renders a yellow disk with center (328, 219) and radius 15.
; PLAN: r0=328(x), r1=219(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 219
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
