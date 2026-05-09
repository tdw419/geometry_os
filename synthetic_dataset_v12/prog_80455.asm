; DESCRIPTION: Composite: Creates a cyan circular shape at (260, 118) with radius 44 then Renders a cyan line between points (427, 69) and (77, 11).
; PLAN: r0=260(x), r1=118(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=69(y1), r7=77(x2), r8=11(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 118
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 69
LDI r7, 77
LDI r8, 11
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
