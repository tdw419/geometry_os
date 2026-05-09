; DESCRIPTION: Composite: Sets a single yellow pixel at (270, 23) then Draws a yellow circle centered at (60, 106) with radius 31 then Places a magenta line segment connecting (342, 220) to (83, 150).
; PLAN: r0=270(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=106(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x1), r11=220(y1), r12=83(x2), r13=150(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 60
LDI r6, 106
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 220
LDI r12, 83
LDI r13, 150
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
