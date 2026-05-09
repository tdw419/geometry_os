; DESCRIPTION: Composite: Renders a green line between points (445, 62) and (5, 81) then Sets a single yellow pixel at (458, 200).
; PLAN: r0=445(x1), r1=62(y1), r2=5(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 445
LDI r1, 62
LDI r2, 5
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
