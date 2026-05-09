; DESCRIPTION: Composite: Places a yellow 83x100 rectangle at position (347, 94) then Renders a yellow line between points (388, 81) and (345, 134) then Creates a green circular shape at (90, 47) with radius 18.
; PLAN: r0=347(x), r1=94(y), r2=83(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=81(y1), r7=345(x2), r8=134(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=47(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 94
LDI r2, 83
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 81
LDI r7, 345
LDI r8, 134
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 47
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
