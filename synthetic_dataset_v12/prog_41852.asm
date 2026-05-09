; DESCRIPTION: Composite: Places a yellow line segment connecting (315, 7) to (438, 177) then Renders a orange disk with center (294, 145) and radius 46.
; PLAN: r0=315(x1), r1=7(y1), r2=438(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=145(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 7
LDI r2, 438
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 145
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
