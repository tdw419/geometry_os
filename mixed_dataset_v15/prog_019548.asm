; DESCRIPTION: Composite: Draws a red line from (178, 229) to (341, 192) then Draws a yellow circle centered at (140, 123) with radius 19 then Sets a single purple pixel at (367, 215).
; PLAN: r0=178(x1), r1=229(y1), r2=341(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=123(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=215(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 229
LDI r2, 341
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 123
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 215
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
