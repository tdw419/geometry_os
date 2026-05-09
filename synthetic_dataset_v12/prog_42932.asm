; DESCRIPTION: Composite: Draws a blue line from (272, 65) to (168, 66) then Sets a single yellow pixel at (168, 126) then Renders a blue disk with center (316, 59) and radius 30.
; PLAN: r0=272(x1), r1=65(y1), r2=168(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=126(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=59(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 272
LDI r1, 65
LDI r2, 168
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 126
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 316
LDI r11, 59
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
