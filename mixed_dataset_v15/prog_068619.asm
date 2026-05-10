; DESCRIPTION: Composite: Sets a single orange pixel at (60, 133) then Renders a magenta disk with center (314, 158) and radius 36 then Places a red line segment connecting (504, 102) to (447, 8).
; PLAN: r0=60(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=158(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=102(y1), r12=447(x2), r13=8(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 133
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 314
LDI r6, 158
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 102
LDI r12, 447
LDI r13, 8
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
