; DESCRIPTION: Composite: Draws a blue line from (438, 146) to (307, 191) then Sets a single cyan pixel at (148, 21) then Renders a yellow disk with center (253, 110) and radius 38.
; PLAN: r0=438(x1), r1=146(y1), r2=307(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=21(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=253(x), r11=110(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 438
LDI r1, 146
LDI r2, 307
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 21
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 253
LDI r11, 110
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
