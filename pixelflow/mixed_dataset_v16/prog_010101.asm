; DESCRIPTION: Composite: Draws a purple line from (278, 44) to (310, 27) then Sets a single red pixel at (432, 154).
; PLAN: r0=278(x1), r1=44(y1), r2=310(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=154(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 44
LDI r2, 310
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 154
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
