; DESCRIPTION: Composite: Sets a single white pixel at (490, 21) then Creates a black rectangular region at (145, 170) spanning 83 by 62 pixels then Places a green line segment connecting (230, 72) to (142, 220).
; PLAN: r0=490(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=145(x), r6=170(y), r7=83(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=230(x1), r11=72(y1), r12=142(x2), r13=220(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 145
LDI r6, 170
LDI r7, 83
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 72
LDI r12, 142
LDI r13, 220
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
