; DESCRIPTION: Composite: Sets a single blue pixel at (327, 37) then Renders a orange line between points (390, 201) and (20, 59) then Places a cyan circle of radius 60 at center (179, 107).
; PLAN: r0=327(x), r1=37(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=390(x1), r6=201(y1), r7=20(x2), r8=59(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=107(y), r12=60(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 37
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 201
LDI r7, 20
LDI r8, 59
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 107
LDI r12, 60
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
