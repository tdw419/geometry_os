; DESCRIPTION: Composite: Draws a green line from (5, 187) to (351, 11) then Sets a single green pixel at (265, 18) then Places a green circle of radius 25 at center (173, 226).
; PLAN: r0=5(x1), r1=187(y1), r2=351(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=226(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 5
LDI r1, 187
LDI r2, 351
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 173
LDI r11, 226
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
