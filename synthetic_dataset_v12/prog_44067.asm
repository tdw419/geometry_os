; DESCRIPTION: Renders a yellow disk with center (277, 99) and radius 58.
; PLAN: r0=277(x), r1=99(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 99
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
