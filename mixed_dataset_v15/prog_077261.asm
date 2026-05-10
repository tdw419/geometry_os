; DESCRIPTION: Composite: Places a orange circle of radius 11 at center (439, 217) then Renders a magenta line between points (437, 118) and (97, 55) then Places a green dot at position (221, 237).
; PLAN: r0=439(x), r1=217(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x1), r6=118(y1), r7=97(x2), r8=55(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=237(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 217
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 118
LDI r7, 97
LDI r8, 55
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 237
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
