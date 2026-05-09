; DESCRIPTION: Composite: . Then Renders a yellow disk with center (92, 102) and radius 55. Then Sets a single orange pixel at (106, 253).
; PLAN: r0=92(x), r1=102(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow disk with center (92, 102) and radius 55.
; PLAN: r0=92(x), r1=102(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 102
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (106, 253).
; PLAN: r0=106(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
