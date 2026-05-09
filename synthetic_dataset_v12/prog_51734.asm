; DESCRIPTION: Renders a purple disk with center (37, 129) and radius 11.
; PLAN: r0=37(x), r1=129(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 129
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
