; DESCRIPTION: Renders a white disk with center (487, 242) and radius 10.
; PLAN: r0=487(x), r1=242(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 487
LDI r1, 242
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
