; DESCRIPTION: Composite: Draws a black line from (169, 154) to (324, 236) then Sets a single blue pixel at (68, 70).
; PLAN: r0=169(x1), r1=154(y1), r2=324(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 154
LDI r2, 324
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
