; DESCRIPTION: Renders a green disk with center (183, 129) and radius 53.
; PLAN: r0=183(x), r1=129(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 129
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
