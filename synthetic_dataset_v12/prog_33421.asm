; DESCRIPTION: Composite: Renders a green line between points (400, 46) and (73, 30) then Sets a single red pixel at (29, 52).
; PLAN: r0=400(x1), r1=46(y1), r2=73(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=52(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 46
LDI r2, 73
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 52
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
