; DESCRIPTION: Composite: Renders a purple line between points (0, 146) and (42, 64) then Sets a single red pixel at (422, 196).
; PLAN: r0=0(x1), r1=146(y1), r2=42(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=196(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 146
LDI r2, 42
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 196
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
