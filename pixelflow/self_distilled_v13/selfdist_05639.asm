; DESCRIPTION: Places a magenta disk with center (51, 191) and radius 45.
; PLAN: r0=51(x), r1=191(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 191
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
