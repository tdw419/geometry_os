; DESCRIPTION: Renders a orange disk with center (191, 129) and radius 18.
; PLAN: r0=191(x), r1=129(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 129
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
