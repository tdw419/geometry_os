; DESCRIPTION: Composite: Renders a orange line between points (7, 253) and (230, 1) then Sets a single red pixel at (436, 205).
; PLAN: r0=7(x1), r1=253(y1), r2=230(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=205(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 253
LDI r2, 230
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 205
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
