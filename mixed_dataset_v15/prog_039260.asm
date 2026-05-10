; DESCRIPTION: Composite: Draws a green line from (413, 116) to (223, 22) then Sets a single yellow pixel at (22, 37).
; PLAN: r0=413(x1), r1=116(y1), r2=223(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=37(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 116
LDI r2, 223
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 37
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
