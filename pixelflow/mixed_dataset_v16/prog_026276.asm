; DESCRIPTION: Composite: Sets a single black pixel at (294, 21) then Renders a purple line between points (142, 252) and (293, 37) then Creates a blue rectangular region at (248, 33) spanning 33 by 55 pixels.
; PLAN: r0=294(x), r1=21(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=142(x1), r6=252(y1), r7=293(x2), r8=37(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=248(x), r11=33(y), r12=33(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 21
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 142
LDI r6, 252
LDI r7, 293
LDI r8, 37
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 33
LDI r12, 33
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
