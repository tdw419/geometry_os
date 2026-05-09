; DESCRIPTION: Composite: Renders a green line between points (205, 12) and (383, 251) then Sets a single black pixel at (446, 112).
; PLAN: r0=205(x1), r1=12(y1), r2=383(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=112(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 12
LDI r2, 383
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 112
LDI r7, 0x000000
PSET r5, r6, r7
HALT
