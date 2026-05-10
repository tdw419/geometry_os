; DESCRIPTION: Renders a magenta disk with center (373, 95) and radius 52.
; PLAN: r0=373(x), r1=95(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 95
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
