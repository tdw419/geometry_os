; DESCRIPTION: Composite: Places a magenta line segment connecting (116, 194) to (379, 211) then Places a yellow dot at position (237, 131).
; PLAN: r0=116(x1), r1=194(y1), r2=379(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=131(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 116
LDI r1, 194
LDI r2, 379
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 131
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
