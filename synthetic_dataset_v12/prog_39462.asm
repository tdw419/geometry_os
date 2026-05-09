; DESCRIPTION: Composite: Places a black dot at position (456, 137) then Draws a magenta line from (103, 121) to (331, 13) then Draws a green circle centered at (318, 78) with radius 18.
; PLAN: r0=456(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=103(x1), r6=121(y1), r7=331(x2), r8=13(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=78(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 456
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 103
LDI r6, 121
LDI r7, 331
LDI r8, 13
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 78
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
