; DESCRIPTION: Composite: Renders a green disk with center (247, 137) and radius 52 then Sets a single red pixel at (173, 115).
; PLAN: r0=247(x), r1=137(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=115(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 247
LDI r1, 137
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 115
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
