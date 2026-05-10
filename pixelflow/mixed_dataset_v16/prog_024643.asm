; DESCRIPTION: Composite: Draws a red line from (179, 24) to (357, 140) then Places a orange circle of radius 10 at center (435, 177) then Sets a single orange pixel at (352, 153).
; PLAN: r0=179(x1), r1=24(y1), r2=357(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=177(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x), r11=153(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 24
LDI r2, 357
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 177
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 153
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
