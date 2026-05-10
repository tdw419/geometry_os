; DESCRIPTION: Composite: Places a black circle of radius 63 at center (226, 115) then Renders a purple line between points (19, 90) and (407, 2) then Sets a single cyan pixel at (187, 146).
; PLAN: r0=226(x), r1=115(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=90(y1), r7=407(x2), r8=2(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=146(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 115
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 90
LDI r7, 407
LDI r8, 2
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 146
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
