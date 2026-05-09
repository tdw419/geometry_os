; DESCRIPTION: Renders a red line between points (83, 82) and (151, 201).
; PLAN: r0=83(x1), r1=82(y1), r2=151(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 82
LDI r2, 151
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
