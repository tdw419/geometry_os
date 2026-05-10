; DESCRIPTION: Renders a yellow disk with center (315, 208) and radius 34.
; PLAN: r0=315(x), r1=208(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 208
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
