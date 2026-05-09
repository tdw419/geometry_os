; DESCRIPTION: Renders a magenta disk with center (374, 109) and radius 80.
; PLAN: r0=374(x), r1=109(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 109
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
