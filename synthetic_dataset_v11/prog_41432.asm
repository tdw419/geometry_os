; DESCRIPTION: Renders a magenta disk with center (189, 93) and radius 47.
; PLAN: r0=189(x), r1=93(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 93
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
