; DESCRIPTION: Composite: Sets a single black pixel at (154, 205) then Places a white line segment connecting (466, 201) to (131, 186) then Renders a yellow box of size 90x84 starting at (297, 47).
; PLAN: r0=154(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=466(x1), r6=201(y1), r7=131(x2), r8=186(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=47(y), r12=90(width), r13=84(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 466
LDI r6, 201
LDI r7, 131
LDI r8, 186
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 47
LDI r12, 90
LDI r13, 84
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
