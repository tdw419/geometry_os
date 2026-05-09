; DESCRIPTION: Composite: Sets a single green pixel at (154, 194) then Renders a white line between points (147, 9) and (213, 229).
; PLAN: r0=154(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=9(y1), r7=213(x2), r8=229(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 147
LDI r6, 9
LDI r7, 213
LDI r8, 229
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
