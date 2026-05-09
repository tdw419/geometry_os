; DESCRIPTION: Composite: Places a green dot at position (483, 0) then Places a white line segment connecting (277, 90) to (4, 58) then Draws a cyan circle centered at (431, 62) with radius 33.
; PLAN: r0=483(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=277(x1), r6=90(y1), r7=4(x2), r8=58(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=431(x), r11=62(y), r12=33(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 483
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 277
LDI r6, 90
LDI r7, 4
LDI r8, 58
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 62
LDI r12, 33
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
