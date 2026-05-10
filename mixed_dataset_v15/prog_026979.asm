; DESCRIPTION: Composite: Places a red dot at position (372, 191) then Draws a magenta line from (427, 180) to (253, 58) then Places a magenta circle of radius 79 at center (254, 147).
; PLAN: r0=372(x), r1=191(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=427(x1), r6=180(y1), r7=253(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=254(x), r11=147(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 372
LDI r1, 191
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 427
LDI r6, 180
LDI r7, 253
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 254
LDI r11, 147
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
