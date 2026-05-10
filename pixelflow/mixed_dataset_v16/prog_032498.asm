; DESCRIPTION: Composite: Renders a green line between points (505, 206) and (154, 28) then Sets a single orange pixel at (345, 59) then Creates a orange circular shape at (385, 91) with radius 48.
; PLAN: r0=505(x1), r1=206(y1), r2=154(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=59(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=385(x), r11=91(y), r12=48(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 505
LDI r1, 206
LDI r2, 154
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 59
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 385
LDI r11, 91
LDI r12, 48
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
