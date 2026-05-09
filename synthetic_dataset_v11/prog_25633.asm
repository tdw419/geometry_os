; DESCRIPTION: Renders a blue disk with center (83, 146) and radius 11.
; PLAN: r0=83(x), r1=146(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 146
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
