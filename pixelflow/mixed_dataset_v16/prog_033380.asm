; DESCRIPTION: Composite: Places a red line segment connecting (379, 202) to (65, 15) then Places a red dot at position (130, 94).
; PLAN: r0=379(x1), r1=202(y1), r2=65(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=94(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 202
LDI r2, 65
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 94
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
