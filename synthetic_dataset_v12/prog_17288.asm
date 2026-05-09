; DESCRIPTION: Composite: Renders a cyan disk with center (436, 102) and radius 12 then Sets a single magenta pixel at (270, 247).
; PLAN: r0=436(x), r1=102(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 102
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
