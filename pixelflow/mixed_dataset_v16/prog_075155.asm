; DESCRIPTION: Composite: Places a green line segment connecting (330, 61) to (190, 170) then Places a purple dot at position (405, 12) then Places a orange circle of radius 52 at center (226, 179).
; PLAN: r0=330(x1), r1=61(y1), r2=190(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=12(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=226(x), r11=179(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 61
LDI r2, 190
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 12
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 226
LDI r11, 179
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
