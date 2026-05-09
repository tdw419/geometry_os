; DESCRIPTION: Composite: Sets a single black pixel at (86, 198) then Renders a white line between points (438, 145) and (66, 227).
; PLAN: r0=86(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=145(y1), r7=66(x2), r8=227(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 198
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 438
LDI r6, 145
LDI r7, 66
LDI r8, 227
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
