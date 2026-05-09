; DESCRIPTION: Composite: Renders a orange disk with center (347, 169) and radius 72 then Draws a orange line from (63, 146) to (178, 18).
; PLAN: r0=347(x), r1=169(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x1), r6=146(y1), r7=178(x2), r8=18(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 169
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 146
LDI r7, 178
LDI r8, 18
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
