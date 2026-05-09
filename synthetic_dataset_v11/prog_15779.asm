; DESCRIPTION: Renders a white disk with center (71, 127) and radius 56.
; PLAN: r0=71(x), r1=127(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 127
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
