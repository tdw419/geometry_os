; DESCRIPTION: Composite: Places a green dot at position (129, 209) then Places a red line segment connecting (366, 241) to (436, 124) then Creates a white circular shape at (149, 59) with radius 13.
; PLAN: r0=129(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=366(x1), r6=241(y1), r7=436(x2), r8=124(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=59(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 366
LDI r6, 241
LDI r7, 436
LDI r8, 124
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 59
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
