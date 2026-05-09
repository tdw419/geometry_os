; DESCRIPTION: Composite: Renders a black disk with center (52, 127) and radius 47 then Sets a single black pixel at (140, 61) then Renders a green line between points (348, 178) and (237, 143).
; PLAN: r0=52(x), r1=127(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=61(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=348(x1), r11=178(y1), r12=237(x2), r13=143(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 127
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 61
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 348
LDI r11, 178
LDI r12, 237
LDI r13, 143
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
