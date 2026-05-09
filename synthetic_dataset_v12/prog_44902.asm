; DESCRIPTION: Composite: Draws a green line from (476, 212) to (249, 0) then Sets a single orange pixel at (372, 30).
; PLAN: r0=476(x1), r1=212(y1), r2=249(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 476
LDI r1, 212
LDI r2, 249
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
