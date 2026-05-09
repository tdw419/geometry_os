; DESCRIPTION: Renders a magenta disk with center (116, 77) and radius 31.
; PLAN: r0=116(x), r1=77(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 77
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
