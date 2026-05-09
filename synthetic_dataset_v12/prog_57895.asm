; DESCRIPTION: Composite: Renders a red line between points (10, 112) and (509, 164) then Sets a single yellow pixel at (9, 138).
; PLAN: r0=10(x1), r1=112(y1), r2=509(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=138(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 112
LDI r2, 509
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 138
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
