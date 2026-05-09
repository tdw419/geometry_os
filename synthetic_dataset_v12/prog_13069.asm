; DESCRIPTION: Composite: Places a purple dot at position (302, 162) then Renders a red line between points (51, 58) and (196, 219) then Renders a black disk with center (206, 103) and radius 80.
; PLAN: r0=302(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=51(x1), r6=58(y1), r7=196(x2), r8=219(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=103(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 58
LDI r7, 196
LDI r8, 219
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 103
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
