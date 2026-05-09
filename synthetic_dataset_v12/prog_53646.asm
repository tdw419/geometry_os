; DESCRIPTION: Composite: Draws a white line from (146, 107) to (112, 215) then Sets a single magenta pixel at (314, 199).
; PLAN: r0=146(x1), r1=107(y1), r2=112(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=199(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 107
LDI r2, 112
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 199
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
