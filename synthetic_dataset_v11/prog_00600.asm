; DESCRIPTION: Renders a magenta disk with center (160, 191) and radius 60.
; PLAN: r0=160(x), r1=191(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 191
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
