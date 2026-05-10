; DESCRIPTION: Composite: Renders a yellow disk with center (98, 204) and radius 48 then Draws a orange line from (453, 97) to (444, 11) then Sets a single orange pixel at (427, 225).
; PLAN: r0=98(x), r1=204(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x1), r6=97(y1), r7=444(x2), r8=11(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=427(x), r11=225(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 204
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 97
LDI r7, 444
LDI r8, 11
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 225
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
