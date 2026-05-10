; DESCRIPTION: Renders a magenta disk with center (262, 101) and radius 37.
; PLAN: r0=262(x), r1=101(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 101
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
