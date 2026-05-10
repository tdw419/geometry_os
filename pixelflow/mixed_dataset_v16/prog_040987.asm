; DESCRIPTION: Composite: Draws a black line from (107, 240) to (391, 186) then Sets a single cyan pixel at (10, 88).
; PLAN: r0=107(x1), r1=240(y1), r2=391(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=88(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 240
LDI r2, 391
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 88
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
