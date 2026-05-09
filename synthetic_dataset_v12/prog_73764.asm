; DESCRIPTION: Composite: Sets a single orange pixel at (232, 37) then Renders a black line between points (154, 183) and (289, 83).
; PLAN: r0=232(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=154(x1), r6=183(y1), r7=289(x2), r8=83(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 154
LDI r6, 183
LDI r7, 289
LDI r8, 83
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
