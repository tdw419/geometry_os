; DESCRIPTION: Composite: Renders a yellow disk with center (66, 104) and radius 15 then Draws a orange line from (179, 231) to (393, 23) then Sets a single magenta pixel at (348, 191).
; PLAN: r0=66(x), r1=104(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x1), r6=231(y1), r7=393(x2), r8=23(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=191(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 104
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 231
LDI r7, 393
LDI r8, 23
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 191
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
