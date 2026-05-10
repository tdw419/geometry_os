; DESCRIPTION: Composite: Places a red dot at position (48, 172) then Places a magenta line segment connecting (267, 185) to (427, 182) then Creates a black rectangular region at (59, 147) spanning 99 by 83 pixels.
; PLAN: r0=48(x), r1=172(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=267(x1), r6=185(y1), r7=427(x2), r8=182(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=147(y), r12=99(width), r13=83(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 172
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 267
LDI r6, 185
LDI r7, 427
LDI r8, 182
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 147
LDI r12, 99
LDI r13, 83
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
