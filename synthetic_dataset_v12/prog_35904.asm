; DESCRIPTION: Composite: Renders a magenta line between points (318, 48) and (103, 156) then Sets a single blue pixel at (261, 213).
; PLAN: r0=318(x1), r1=48(y1), r2=103(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=213(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 48
LDI r2, 103
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 213
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
