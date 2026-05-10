; DESCRIPTION: Composite: Sets a single magenta pixel at (355, 193) then Creates a red circular shape at (59, 169) with radius 56 then Renders a orange line between points (413, 167) and (359, 251).
; PLAN: r0=355(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=169(y), r7=56(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x1), r11=167(y1), r12=359(x2), r13=251(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 169
LDI r7, 56
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 167
LDI r12, 359
LDI r13, 251
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
