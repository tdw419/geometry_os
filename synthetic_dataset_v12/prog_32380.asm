; DESCRIPTION: Composite: Renders a green disk with center (186, 68) and radius 64 then Sets a single magenta pixel at (444, 250).
; PLAN: r0=186(x), r1=68(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=250(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 68
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 250
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
