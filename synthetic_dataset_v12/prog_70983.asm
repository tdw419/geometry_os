; DESCRIPTION: Composite: Sets a single red pixel at (471, 232) then Draws a white circle centered at (276, 138) with radius 80 then Renders a magenta line between points (68, 14) and (77, 92).
; PLAN: r0=471(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=138(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x1), r11=14(y1), r12=77(x2), r13=92(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 276
LDI r6, 138
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 14
LDI r12, 77
LDI r13, 92
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
