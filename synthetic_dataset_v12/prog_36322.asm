; DESCRIPTION: Composite: Renders a white line between points (280, 8) and (324, 137) then Sets a single purple pixel at (511, 33).
; PLAN: r0=280(x1), r1=8(y1), r2=324(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=33(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 8
LDI r2, 324
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 33
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
