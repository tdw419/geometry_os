; DESCRIPTION: Renders a white disk with center (279, 110) and radius 10.
; PLAN: r0=279(x), r1=110(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 110
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
