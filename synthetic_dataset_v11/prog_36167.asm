; DESCRIPTION: Renders a magenta disk with center (61, 107) and radius 58.
; PLAN: r0=61(x), r1=107(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 107
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
