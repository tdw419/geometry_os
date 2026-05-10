; DESCRIPTION: Composite: Places a magenta dot at position (379, 177) then Creates a black circular shape at (378, 99) with radius 59 then Draws a purple line from (439, 5) to (466, 138).
; PLAN: r0=379(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=99(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x1), r11=5(y1), r12=466(x2), r13=138(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 99
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 5
LDI r12, 466
LDI r13, 138
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
