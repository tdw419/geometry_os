; DESCRIPTION: Composite: Creates a yellow circular shape at (405, 119) with radius 79 then Places a purple line segment connecting (301, 213) to (373, 212) then Sets a single orange pixel at (46, 202).
; PLAN: r0=405(x), r1=119(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=213(y1), r7=373(x2), r8=212(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=202(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 119
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 213
LDI r7, 373
LDI r8, 212
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 202
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
