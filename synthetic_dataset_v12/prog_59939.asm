; DESCRIPTION: Composite: Sets a single red pixel at (164, 62) then Renders a magenta line between points (2, 15) and (186, 174).
; PLAN: r0=164(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=15(y1), r7=186(x2), r8=174(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 15
LDI r7, 186
LDI r8, 174
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
