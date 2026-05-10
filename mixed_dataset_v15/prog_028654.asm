; DESCRIPTION: Renders a yellow disk with center (43, 90) and radius 12.
; PLAN: r0=43(x), r1=90(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 90
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
