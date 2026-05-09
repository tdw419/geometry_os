; DESCRIPTION: Renders a green disk with center (185, 152) and radius 18.
; PLAN: r0=185(x), r1=152(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 152
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
