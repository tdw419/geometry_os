; DESCRIPTION: Renders a yellow disk with center (260, 236) and radius 18.
; PLAN: r0=260(x), r1=236(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 236
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
