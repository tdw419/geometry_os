; DESCRIPTION: Renders a magenta disk with center (304, 61) and radius 58.
; PLAN: r0=304(x), r1=61(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 61
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
