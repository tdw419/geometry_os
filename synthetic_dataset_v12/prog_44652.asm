; DESCRIPTION: Composite: Draws a cyan line from (330, 136) to (373, 72) then Creates a purple circular shape at (345, 199) with radius 45 then Sets a single green pixel at (353, 95).
; PLAN: r0=330(x1), r1=136(y1), r2=373(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=199(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x), r11=95(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 136
LDI r2, 373
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 199
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 95
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
