; DESCRIPTION: Composite: Draws a green line from (169, 222) to (257, 47) then Sets a single purple pixel at (379, 112).
; PLAN: r0=169(x1), r1=222(y1), r2=257(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=112(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 222
LDI r2, 257
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 112
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
