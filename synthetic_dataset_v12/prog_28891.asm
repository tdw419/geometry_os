; DESCRIPTION: Renders a magenta disk with center (36, 95) and radius 24.
; PLAN: r0=36(x), r1=95(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 95
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
