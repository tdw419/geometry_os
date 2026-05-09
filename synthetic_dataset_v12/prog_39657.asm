; DESCRIPTION: Composite: Sets a single yellow pixel at (233, 105) then Renders a magenta line between points (70, 76) and (495, 145).
; PLAN: r0=233(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=76(y1), r7=495(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 105
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 70
LDI r6, 76
LDI r7, 495
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
