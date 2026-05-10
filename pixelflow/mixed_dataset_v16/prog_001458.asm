; DESCRIPTION: Composite: Renders a green disk with center (401, 82) and radius 79 then Renders a black line between points (198, 232) and (236, 110) then Sets a single red pixel at (449, 175).
; PLAN: r0=401(x), r1=82(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x1), r6=232(y1), r7=236(x2), r8=110(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=449(x), r11=175(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 82
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 232
LDI r7, 236
LDI r8, 110
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 175
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
