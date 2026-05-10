; DESCRIPTION: Composite: Places a blue dot at position (20, 202) then Draws a orange line from (50, 10) to (372, 110) then Creates a magenta circular shape at (378, 141) with radius 57.
; PLAN: r0=20(x), r1=202(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=50(x1), r6=10(y1), r7=372(x2), r8=110(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=141(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 202
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 50
LDI r6, 10
LDI r7, 372
LDI r8, 110
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 141
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
