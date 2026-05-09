; DESCRIPTION: Renders a yellow disk with center (290, 97) and radius 56.
; PLAN: r0=290(x), r1=97(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 97
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
