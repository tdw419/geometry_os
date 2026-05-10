; DESCRIPTION: Renders a magenta disk with center (129, 222) and radius 32.
; PLAN: r0=129(x), r1=222(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 222
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
