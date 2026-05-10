; DESCRIPTION: Composite: Places a blue dot at position (12, 92) then Creates a black circular shape at (337, 79) with radius 59.
; PLAN: r0=12(x), r1=92(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=79(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 92
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 79
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
