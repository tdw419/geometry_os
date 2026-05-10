; DESCRIPTION: Composite: Sets a single purple pixel at (398, 169) then Draws a orange circle centered at (339, 138) with radius 68 then Renders a red line between points (92, 155) and (36, 118).
; PLAN: r0=398(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=138(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x1), r11=155(y1), r12=36(x2), r13=118(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 138
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 155
LDI r12, 36
LDI r13, 118
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
