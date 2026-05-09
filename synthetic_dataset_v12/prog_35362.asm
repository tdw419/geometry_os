; DESCRIPTION: Renders a yellow disk with center (134, 152) and radius 79.
; PLAN: r0=134(x), r1=152(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 152
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
