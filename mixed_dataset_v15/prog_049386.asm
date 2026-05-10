; DESCRIPTION: Composite: Sets a single green pixel at (40, 80) then Renders a orange line between points (349, 38) and (248, 107).
; PLAN: r0=40(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=349(x1), r6=38(y1), r7=248(x2), r8=107(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 349
LDI r6, 38
LDI r7, 248
LDI r8, 107
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
