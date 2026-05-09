; DESCRIPTION: Composite: Sets a single yellow pixel at (495, 193) then Renders a green line between points (5, 159) and (109, 42).
; PLAN: r0=495(x), r1=193(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=5(x1), r6=159(y1), r7=109(x2), r8=42(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 193
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 5
LDI r6, 159
LDI r7, 109
LDI r8, 42
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
