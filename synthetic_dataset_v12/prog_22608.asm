; DESCRIPTION: Composite: Sets a single red pixel at (108, 183) then Renders a red line between points (164, 65) and (362, 220).
; PLAN: r0=108(x), r1=183(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=65(y1), r7=362(x2), r8=220(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 183
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 164
LDI r6, 65
LDI r7, 362
LDI r8, 220
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
