; DESCRIPTION: Composite: Sets a single red pixel at (131, 217) then Creates a white rectangular region at (321, 68) spanning 83 by 75 pixels then Renders a orange line between points (436, 139) and (264, 33).
; PLAN: r0=131(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=68(y), r7=83(width), r8=75(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x1), r11=139(y1), r12=264(x2), r13=33(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 68
LDI r7, 83
LDI r8, 75
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 139
LDI r12, 264
LDI r13, 33
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
