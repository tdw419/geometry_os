; DESCRIPTION: Composite: Sets a single red pixel at (338, 87) then Renders a black line between points (101, 17) and (245, 179).
; PLAN: r0=338(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=17(y1), r7=245(x2), r8=179(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 87
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 101
LDI r6, 17
LDI r7, 245
LDI r8, 179
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
