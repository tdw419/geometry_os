; DESCRIPTION: Composite: Sets a single blue pixel at (501, 124) then Places a white line segment connecting (235, 49) to (306, 168) then Renders a green disk with center (447, 216) and radius 23.
; PLAN: r0=501(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=49(y1), r7=306(x2), r8=168(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=216(y), r12=23(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 501
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 49
LDI r7, 306
LDI r8, 168
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 216
LDI r12, 23
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
