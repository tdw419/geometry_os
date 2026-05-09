; DESCRIPTION: Composite: Renders a green line between points (276, 200) and (297, 106) then Sets a single purple pixel at (298, 46).
; PLAN: r0=276(x1), r1=200(y1), r2=297(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=46(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 200
LDI r2, 297
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 46
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
