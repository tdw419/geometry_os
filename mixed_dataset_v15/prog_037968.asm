; DESCRIPTION: Composite: Places a white dot at position (286, 232) then Draws a blue line from (393, 180) to (459, 233) then Renders a green disk with center (102, 155) and radius 77.
; PLAN: r0=286(x), r1=232(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=393(x1), r6=180(y1), r7=459(x2), r8=233(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=155(y), r12=77(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 286
LDI r1, 232
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 180
LDI r7, 459
LDI r8, 233
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 155
LDI r12, 77
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
