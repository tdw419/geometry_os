; DESCRIPTION: Renders a magenta disk with center (289, 143) and radius 70.
; PLAN: r0=289(x), r1=143(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 143
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
