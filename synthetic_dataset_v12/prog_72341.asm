; DESCRIPTION: Composite: Sets a single blue pixel at (3, 67) then Places a red line segment connecting (376, 4) to (394, 242) then Places a blue circle of radius 72 at center (137, 97).
; PLAN: r0=3(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=376(x1), r6=4(y1), r7=394(x2), r8=242(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=97(y), r12=72(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 4
LDI r7, 394
LDI r8, 242
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 97
LDI r12, 72
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
