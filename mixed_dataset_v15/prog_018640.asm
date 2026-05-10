; DESCRIPTION: Renders a magenta disk with center (77, 210) and radius 13.
; PLAN: r0=77(x), r1=210(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 210
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
