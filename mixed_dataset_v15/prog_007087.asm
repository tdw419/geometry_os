; DESCRIPTION: Composite: Draws a purple line from (189, 184) to (187, 176) then Sets a single red pixel at (464, 131).
; PLAN: r0=189(x1), r1=184(y1), r2=187(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=131(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 184
LDI r2, 187
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 131
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
