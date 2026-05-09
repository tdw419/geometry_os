; DESCRIPTION: Composite: Draws a black line from (374, 164) to (299, 177) then Sets a single yellow pixel at (205, 31).
; PLAN: r0=374(x1), r1=164(y1), r2=299(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=31(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 164
LDI r2, 299
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 31
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
