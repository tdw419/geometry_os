; DESCRIPTION: Renders a yellow disk with center (369, 126) and radius 39.
; PLAN: r0=369(x), r1=126(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 126
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
