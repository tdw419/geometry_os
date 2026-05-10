; DESCRIPTION: Renders a magenta disk with center (321, 48) and radius 48.
; PLAN: r0=321(x), r1=48(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 48
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
