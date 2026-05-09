; DESCRIPTION: Composite: Renders a blue line between points (135, 75) and (45, 179) then Sets a single magenta pixel at (116, 208).
; PLAN: r0=135(x1), r1=75(y1), r2=45(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=208(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 75
LDI r2, 45
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 208
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
