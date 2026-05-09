; DESCRIPTION: Composite: Places a white dot at position (221, 129) then Draws a purple line from (199, 189) to (438, 163).
; PLAN: r0=221(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=199(x1), r6=189(y1), r7=438(x2), r8=163(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 199
LDI r6, 189
LDI r7, 438
LDI r8, 163
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
