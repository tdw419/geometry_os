; DESCRIPTION: Composite: Sets a single red pixel at (111, 239) then Places a yellow line segment connecting (40, 109) to (280, 133) then Creates a orange circular shape at (341, 57) with radius 21.
; PLAN: r0=111(x), r1=239(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=109(y1), r7=280(x2), r8=133(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=57(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 239
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 40
LDI r6, 109
LDI r7, 280
LDI r8, 133
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 57
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
