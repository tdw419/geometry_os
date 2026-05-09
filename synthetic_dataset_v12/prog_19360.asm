; DESCRIPTION: Renders a yellow disk with center (77, 166) and radius 24.
; PLAN: r0=77(x), r1=166(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 166
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
