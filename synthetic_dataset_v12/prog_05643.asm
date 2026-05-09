; DESCRIPTION: Composite: Renders a magenta line between points (262, 241) and (473, 227) then Sets a single green pixel at (315, 123).
; PLAN: r0=262(x1), r1=241(y1), r2=473(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=123(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 241
LDI r2, 473
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 123
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
