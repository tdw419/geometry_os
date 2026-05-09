; DESCRIPTION: Composite: Sets a single green pixel at (347, 76) then Draws a yellow line from (27, 73) to (22, 24) then Places a green circle of radius 70 at center (137, 184).
; PLAN: r0=347(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=27(x1), r6=73(y1), r7=22(x2), r8=24(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=184(y), r12=70(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 27
LDI r6, 73
LDI r7, 22
LDI r8, 24
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 184
LDI r12, 70
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
