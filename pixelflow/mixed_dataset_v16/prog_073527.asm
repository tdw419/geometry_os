; DESCRIPTION: Composite: Draws a white line from (221, 147) to (206, 141) then Sets a single magenta pixel at (340, 163).
; PLAN: r0=221(x1), r1=147(y1), r2=206(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=163(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 221
LDI r1, 147
LDI r2, 206
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 163
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
