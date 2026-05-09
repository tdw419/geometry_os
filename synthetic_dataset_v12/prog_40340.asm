; DESCRIPTION: Composite: Places a white line segment connecting (270, 188) to (130, 168) then Places a black dot at position (489, 202) then Places a yellow circle of radius 77 at center (170, 144).
; PLAN: r0=270(x1), r1=188(y1), r2=130(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=489(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=144(y), r12=77(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 188
LDI r2, 130
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 170
LDI r11, 144
LDI r12, 77
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
