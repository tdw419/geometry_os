; DESCRIPTION: Composite: Renders a green disk with center (405, 143) and radius 40 then Sets a single magenta pixel at (280, 77).
; PLAN: r0=405(x), r1=143(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=77(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 143
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 77
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
