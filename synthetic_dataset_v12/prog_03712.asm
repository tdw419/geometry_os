; DESCRIPTION: Renders a magenta disk with center (129, 152) and radius 47.
; PLAN: r0=129(x), r1=152(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 152
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
