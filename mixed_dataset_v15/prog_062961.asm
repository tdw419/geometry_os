; DESCRIPTION: Composite: Places a purple dot at position (400, 197) then Places a cyan line segment connecting (438, 10) to (230, 84) then Creates a blue circular shape at (340, 198) with radius 10.
; PLAN: r0=400(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=10(y1), r7=230(x2), r8=84(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=198(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 10
LDI r7, 230
LDI r8, 84
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 198
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
