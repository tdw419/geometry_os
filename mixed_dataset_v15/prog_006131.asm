; DESCRIPTION: Composite: Places a magenta line segment connecting (70, 241) to (126, 102) then Places a purple 44x70 rectangle at position (20, 118) then Sets a single black pixel at (414, 227).
; PLAN: r0=70(x1), r1=241(y1), r2=126(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=118(y), r7=44(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x), r11=227(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 241
LDI r2, 126
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 118
LDI r7, 44
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 227
LDI r12, 0x000000
PSET r10, r11, r12
HALT
