; DESCRIPTION: Composite: Renders a red line between points (420, 249) and (102, 43) then Sets a single green pixel at (273, 187).
; PLAN: r0=420(x1), r1=249(y1), r2=102(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=187(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 249
LDI r2, 102
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 187
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
