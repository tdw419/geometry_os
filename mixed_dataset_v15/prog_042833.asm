; DESCRIPTION: Composite: Draws a purple line from (242, 127) to (10, 186) then Sets a single blue pixel at (193, 38).
; PLAN: r0=242(x1), r1=127(y1), r2=10(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=38(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 127
LDI r2, 10
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 38
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
