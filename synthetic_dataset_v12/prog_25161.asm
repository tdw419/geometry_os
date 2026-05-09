; DESCRIPTION: Renders a magenta disk with center (114, 129) and radius 33.
; PLAN: r0=114(x), r1=129(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 129
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
