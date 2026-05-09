; DESCRIPTION: Renders a black disk with center (111, 129) and radius 45.
; PLAN: r0=111(x), r1=129(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 129
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
