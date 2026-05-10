; DESCRIPTION: Composite: Renders a magenta line between points (72, 227) and (264, 230) then Sets a single purple pixel at (229, 144).
; PLAN: r0=72(x1), r1=227(y1), r2=264(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=144(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 227
LDI r2, 264
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 144
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
