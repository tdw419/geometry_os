; DESCRIPTION: Renders a yellow disk with center (60, 79) and radius 48.
; PLAN: r0=60(x), r1=79(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 79
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
