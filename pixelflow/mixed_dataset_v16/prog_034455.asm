; DESCRIPTION: Composite: Sets a single red pixel at (77, 229) then Renders a red disk with center (355, 219) and radius 29 then Draws a red line from (321, 90) to (174, 83).
; PLAN: r0=77(x), r1=229(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=219(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=321(x1), r11=90(y1), r12=174(x2), r13=83(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 229
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 355
LDI r6, 219
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 321
LDI r11, 90
LDI r12, 174
LDI r13, 83
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
