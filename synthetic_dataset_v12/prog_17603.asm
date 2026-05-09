; DESCRIPTION: Composite: Places a magenta line segment connecting (212, 5) to (460, 37) then Sets a single red pixel at (234, 11).
; PLAN: r0=212(x1), r1=5(y1), r2=460(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=11(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 5
LDI r2, 460
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 11
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
