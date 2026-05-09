; DESCRIPTION: Renders a black disk with center (59, 191) and radius 42.
; PLAN: r0=59(x), r1=191(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 191
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
