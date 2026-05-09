; DESCRIPTION: Composite: Renders a magenta line between points (442, 137) and (26, 202) then Sets a single blue pixel at (502, 247).
; PLAN: r0=442(x1), r1=137(y1), r2=26(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=502(x), r6=247(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 137
LDI r2, 26
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 247
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
