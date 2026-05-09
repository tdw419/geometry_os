; DESCRIPTION: Renders a magenta disk with center (334, 129) and radius 26.
; PLAN: r0=334(x), r1=129(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 129
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
