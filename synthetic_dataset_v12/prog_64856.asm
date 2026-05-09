; DESCRIPTION: Composite: Renders a white line between points (77, 37) and (193, 23) then Sets a single white pixel at (413, 58).
; PLAN: r0=77(x1), r1=37(y1), r2=193(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=58(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 37
LDI r2, 193
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 58
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
