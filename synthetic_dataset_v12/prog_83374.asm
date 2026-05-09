; DESCRIPTION: Composite: Places a cyan dot at position (181, 151) then Places a blue circle of radius 77 at center (194, 79) then Places a green line segment connecting (347, 201) to (489, 186).
; PLAN: r0=181(x), r1=151(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=79(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=347(x1), r11=201(y1), r12=489(x2), r13=186(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 151
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 79
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 347
LDI r11, 201
LDI r12, 489
LDI r13, 186
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
