; DESCRIPTION: Renders a green disk with center (421, 129) and radius 46.
; PLAN: r0=421(x), r1=129(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 129
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
