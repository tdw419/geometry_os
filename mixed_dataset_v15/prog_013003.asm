; DESCRIPTION: Composite: Renders a purple line between points (100, 2) and (214, 57) then Places a orange dot at position (428, 147).
; PLAN: r0=100(x1), r1=2(y1), r2=214(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=147(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 2
LDI r2, 214
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 147
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
