; DESCRIPTION: Composite: Renders a magenta line between points (229, 211) and (84, 56) then Sets a single cyan pixel at (486, 252).
; PLAN: r0=229(x1), r1=211(y1), r2=84(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=252(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 211
LDI r2, 84
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 252
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
