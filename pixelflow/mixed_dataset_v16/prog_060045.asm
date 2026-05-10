; DESCRIPTION: Composite: Draws a yellow line from (7, 170) to (159, 52) then Sets a single cyan pixel at (430, 86) then Renders a red disk with center (409, 107) and radius 70.
; PLAN: r0=7(x1), r1=170(y1), r2=159(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=86(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=409(x), r11=107(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 7
LDI r1, 170
LDI r2, 159
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 86
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 409
LDI r11, 107
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
