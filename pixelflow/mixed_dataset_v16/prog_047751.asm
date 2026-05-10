; DESCRIPTION: Composite: Sets a single yellow pixel at (335, 74) then Creates a white rectangular region at (409, 23) spanning 37 by 105 pixels then Renders a yellow line between points (368, 56) and (464, 185).
; PLAN: r0=335(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=23(y), r7=37(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x1), r11=56(y1), r12=464(x2), r13=185(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 409
LDI r6, 23
LDI r7, 37
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 56
LDI r12, 464
LDI r13, 185
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
