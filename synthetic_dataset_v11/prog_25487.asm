; DESCRIPTION: Renders a magenta disk with center (142, 57) and radius 32.
; PLAN: r0=142(x), r1=57(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 57
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
