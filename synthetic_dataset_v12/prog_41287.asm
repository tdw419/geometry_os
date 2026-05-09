; DESCRIPTION: Renders a magenta disk with center (348, 127) and radius 80.
; PLAN: r0=348(x), r1=127(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 127
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
