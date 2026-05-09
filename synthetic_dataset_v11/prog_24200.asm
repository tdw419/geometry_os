; DESCRIPTION: Renders a orange disk with center (71, 92) and radius 53.
; PLAN: r0=71(x), r1=92(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 92
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
