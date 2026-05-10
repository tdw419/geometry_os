; DESCRIPTION: Composite: Places a cyan line segment connecting (214, 218) to (311, 220) then Places a yellow dot at position (495, 35) then Creates a orange circular shape at (413, 160) with radius 52.
; PLAN: r0=214(x1), r1=218(y1), r2=311(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=35(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=160(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 218
LDI r2, 311
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 35
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 413
LDI r11, 160
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
