; DESCRIPTION: Composite: Sets a single blue pixel at (308, 240) then Places a red 72x110 rectangle at position (68, 33) then Places a purple line segment connecting (373, 161) to (511, 200).
; PLAN: r0=308(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=33(y), r7=72(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x1), r11=161(y1), r12=511(x2), r13=200(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 33
LDI r7, 72
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 161
LDI r12, 511
LDI r13, 200
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
