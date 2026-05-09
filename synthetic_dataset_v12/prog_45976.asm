; DESCRIPTION: Composite: Renders a white line between points (495, 197) and (510, 236) then Sets a single magenta pixel at (77, 64).
; PLAN: r0=495(x1), r1=197(y1), r2=510(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=64(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 495
LDI r1, 197
LDI r2, 510
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 64
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
