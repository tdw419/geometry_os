; DESCRIPTION: Renders a yellow disk with center (91, 160) and radius 64.
; PLAN: r0=91(x), r1=160(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 160
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
