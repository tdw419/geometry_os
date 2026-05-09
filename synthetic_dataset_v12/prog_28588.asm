; DESCRIPTION: Composite: Sets a single magenta pixel at (253, 51) then Renders a orange line between points (379, 56) and (379, 79).
; PLAN: r0=253(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=379(x1), r6=56(y1), r7=379(x2), r8=79(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 56
LDI r7, 379
LDI r8, 79
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
