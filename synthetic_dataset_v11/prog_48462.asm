; DESCRIPTION: Renders a magenta disk with center (77, 111) and radius 24.
; PLAN: r0=77(x), r1=111(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 111
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
