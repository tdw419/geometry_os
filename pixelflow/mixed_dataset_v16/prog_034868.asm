; DESCRIPTION: Composite: Renders a magenta line between points (7, 240) and (392, 100) then Sets a single blue pixel at (269, 172).
; PLAN: r0=7(x1), r1=240(y1), r2=392(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=172(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 240
LDI r2, 392
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 172
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
