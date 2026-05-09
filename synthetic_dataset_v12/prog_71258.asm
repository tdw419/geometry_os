; DESCRIPTION: Renders a magenta disk with center (376, 191) and radius 59.
; PLAN: r0=376(x), r1=191(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 191
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
