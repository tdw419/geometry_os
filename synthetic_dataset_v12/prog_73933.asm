; DESCRIPTION: Composite: Renders a green line between points (503, 169) and (337, 131) then Sets a single cyan pixel at (306, 169).
; PLAN: r0=503(x1), r1=169(y1), r2=337(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=306(x), r6=169(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 503
LDI r1, 169
LDI r2, 337
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 169
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
