; DESCRIPTION: Composite: Places a red dot at position (487, 172) then Places a purple line segment connecting (510, 147) to (135, 58) then Places a yellow circle of radius 39 at center (341, 67).
; PLAN: r0=487(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=510(x1), r6=147(y1), r7=135(x2), r8=58(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=67(y), r12=39(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 510
LDI r6, 147
LDI r7, 135
LDI r8, 58
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 67
LDI r12, 39
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
