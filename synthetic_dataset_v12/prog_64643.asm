; DESCRIPTION: Composite: Places a white line segment connecting (465, 161) to (325, 180) then Places a yellow dot at position (109, 248).
; PLAN: r0=465(x1), r1=161(y1), r2=325(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=248(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 161
LDI r2, 325
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 248
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
