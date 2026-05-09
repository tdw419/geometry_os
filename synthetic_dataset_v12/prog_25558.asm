; DESCRIPTION: Renders a yellow disk with center (213, 87) and radius 56.
; PLAN: r0=213(x), r1=87(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 87
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
