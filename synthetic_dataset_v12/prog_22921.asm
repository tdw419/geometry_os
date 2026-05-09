; DESCRIPTION: Composite: Renders a green line between points (305, 127) and (461, 246) then Sets a single red pixel at (34, 252).
; PLAN: r0=305(x1), r1=127(y1), r2=461(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=252(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 127
LDI r2, 461
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 252
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
