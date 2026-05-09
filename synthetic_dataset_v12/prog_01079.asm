; DESCRIPTION: Composite: Sets a single green pixel at (489, 151) then Renders a cyan line between points (447, 33) and (257, 63).
; PLAN: r0=489(x), r1=151(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=33(y1), r7=257(x2), r8=63(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 151
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 447
LDI r6, 33
LDI r7, 257
LDI r8, 63
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
