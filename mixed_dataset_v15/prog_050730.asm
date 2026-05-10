; DESCRIPTION: Composite: Renders a blue line between points (506, 18) and (263, 197) then Places a magenta dot at position (200, 47) then Creates a purple circular shape at (396, 106) with radius 77.
; PLAN: r0=506(x1), r1=18(y1), r2=263(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=47(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=106(y), r12=77(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 506
LDI r1, 18
LDI r2, 263
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 47
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 106
LDI r12, 77
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
