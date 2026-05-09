; DESCRIPTION: Renders a yellow disk with center (16, 145) and radius 13.
; PLAN: r0=16(x), r1=145(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 145
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
