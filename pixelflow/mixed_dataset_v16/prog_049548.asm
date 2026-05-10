; DESCRIPTION: Composite: Places a purple line segment connecting (190, 206) to (351, 9) then Sets a single green pixel at (265, 185) then Renders a black disk with center (284, 100) and radius 60.
; PLAN: r0=190(x1), r1=206(y1), r2=351(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=185(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=100(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 206
LDI r2, 351
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 185
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 284
LDI r11, 100
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
