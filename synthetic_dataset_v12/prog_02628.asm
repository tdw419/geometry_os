; DESCRIPTION: Composite: Renders a yellow line between points (31, 106) and (66, 196) then Sets a single green pixel at (236, 140).
; PLAN: r0=31(x1), r1=106(y1), r2=66(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=140(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 31
LDI r1, 106
LDI r2, 66
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 140
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
