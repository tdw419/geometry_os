; DESCRIPTION: Composite: Renders a black disk with center (368, 150) and radius 61 then Sets a single red pixel at (163, 113).
; PLAN: r0=368(x), r1=150(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=113(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 150
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 113
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
