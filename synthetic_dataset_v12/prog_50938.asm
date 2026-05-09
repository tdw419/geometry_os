; DESCRIPTION: Composite: Renders a cyan line between points (471, 170) and (506, 143) then Sets a single black pixel at (46, 169).
; PLAN: r0=471(x1), r1=170(y1), r2=506(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 471
LDI r1, 170
LDI r2, 506
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
HALT
