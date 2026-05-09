; DESCRIPTION: Composite: Sets a single orange pixel at (129, 209) then Renders a green line between points (476, 201) and (405, 18).
; PLAN: r0=129(x), r1=209(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=201(y1), r7=405(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 209
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 476
LDI r6, 201
LDI r7, 405
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
