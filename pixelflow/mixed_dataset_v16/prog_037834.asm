; DESCRIPTION: Composite: Renders a purple line between points (84, 159) and (274, 162) then Sets a single magenta pixel at (173, 243).
; PLAN: r0=84(x1), r1=159(y1), r2=274(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=243(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 159
LDI r2, 274
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 243
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
