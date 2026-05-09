; DESCRIPTION: Composite: Sets a single cyan pixel at (14, 212) then Draws a black circle centered at (127, 78) with radius 20 then Places a red line segment connecting (40, 104) to (489, 118).
; PLAN: r0=14(x), r1=212(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=78(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x1), r11=104(y1), r12=489(x2), r13=118(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 212
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 78
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 104
LDI r12, 489
LDI r13, 118
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
