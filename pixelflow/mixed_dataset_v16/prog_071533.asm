; DESCRIPTION: Composite: Sets a single orange pixel at (214, 48) then Draws a cyan line from (232, 142) to (359, 201).
; PLAN: r0=214(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=142(y1), r7=359(x2), r8=201(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 232
LDI r6, 142
LDI r7, 359
LDI r8, 201
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
