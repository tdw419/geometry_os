; DESCRIPTION: Composite: Places a white line segment connecting (196, 85) to (342, 183) then Sets a single magenta pixel at (160, 247).
; PLAN: r0=196(x1), r1=85(y1), r2=342(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=247(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 196
LDI r1, 85
LDI r2, 342
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 247
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
