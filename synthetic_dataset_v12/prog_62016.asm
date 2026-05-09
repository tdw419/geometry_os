; DESCRIPTION: Composite: Sets a single orange pixel at (167, 147) then Renders a orange disk with center (308, 123) and radius 80.
; PLAN: r0=167(x), r1=147(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=123(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 147
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 308
LDI r6, 123
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
