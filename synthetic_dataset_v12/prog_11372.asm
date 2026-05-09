; DESCRIPTION: Renders a magenta disk with center (350, 191) and radius 31.
; PLAN: r0=350(x), r1=191(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 191
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
