; DESCRIPTION: Composite: Draws a black line from (27, 77) to (17, 133) then Sets a single cyan pixel at (188, 211).
; PLAN: r0=27(x1), r1=77(y1), r2=17(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=211(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 27
LDI r1, 77
LDI r2, 17
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 211
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
