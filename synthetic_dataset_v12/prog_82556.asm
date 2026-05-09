; DESCRIPTION: Composite: Draws a cyan line from (396, 242) to (510, 176) then Creates a purple circular shape at (211, 218) with radius 19 then Sets a single purple pixel at (24, 9).
; PLAN: r0=396(x1), r1=242(y1), r2=510(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=218(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=9(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 242
LDI r2, 510
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 218
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 9
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
