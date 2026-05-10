; DESCRIPTION: Composite: Places a blue circle of radius 11 at center (63, 152) then Renders a purple line between points (315, 0) and (57, 193) then Sets a single blue pixel at (335, 50).
; PLAN: r0=63(x), r1=152(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=0(y1), r7=57(x2), r8=193(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=335(x), r11=50(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 152
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 0
LDI r7, 57
LDI r8, 193
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 50
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
