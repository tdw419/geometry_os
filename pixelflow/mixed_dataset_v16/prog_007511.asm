; DESCRIPTION: Composite: Draws a yellow line from (263, 236) to (378, 191) then Renders a orange disk with center (147, 174) and radius 72.
; PLAN: r0=263(x1), r1=236(y1), r2=378(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=174(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 236
LDI r2, 378
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 174
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
