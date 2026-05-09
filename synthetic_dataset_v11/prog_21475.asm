; DESCRIPTION: Renders a yellow disk with center (79, 90) and radius 59.
; PLAN: r0=79(x), r1=90(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 90
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
