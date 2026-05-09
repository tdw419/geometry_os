; DESCRIPTION: Renders a magenta disk with center (273, 165) and radius 80.
; PLAN: r0=273(x), r1=165(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 165
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
