; DESCRIPTION: Renders a green disk with center (92, 79) and radius 20.
; PLAN: r0=92(x), r1=79(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 79
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
