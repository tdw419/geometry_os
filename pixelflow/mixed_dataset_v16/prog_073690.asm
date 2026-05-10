; DESCRIPTION: Composite: Sets a single green pixel at (226, 132) then Renders a magenta line between points (486, 234) and (442, 90).
; PLAN: r0=226(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=486(x1), r6=234(y1), r7=442(x2), r8=90(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 486
LDI r6, 234
LDI r7, 442
LDI r8, 90
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
