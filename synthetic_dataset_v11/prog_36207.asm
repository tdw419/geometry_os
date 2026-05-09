; DESCRIPTION: Renders a yellow disk with center (116, 169) and radius 48.
; PLAN: r0=116(x), r1=169(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 169
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
