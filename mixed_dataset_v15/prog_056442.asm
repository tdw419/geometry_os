; DESCRIPTION: Composite: Places a yellow dot at position (438, 104) then Renders a magenta line between points (13, 73) and (421, 183).
; PLAN: r0=438(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=13(x1), r6=73(y1), r7=421(x2), r8=183(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 13
LDI r6, 73
LDI r7, 421
LDI r8, 183
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
