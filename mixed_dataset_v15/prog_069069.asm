; DESCRIPTION: Composite: Sets a single magenta pixel at (438, 79) then Places a magenta line segment connecting (119, 100) to (487, 95).
; PLAN: r0=438(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=100(y1), r7=487(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 100
LDI r7, 487
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
