; DESCRIPTION: Composite: Places a green circle of radius 45 at center (193, 204) then Draws a black line from (202, 216) to (511, 36) then Sets a single orange pixel at (381, 182).
; PLAN: r0=193(x), r1=204(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x1), r6=216(y1), r7=511(x2), r8=36(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=182(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 204
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 216
LDI r7, 511
LDI r8, 36
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 182
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
