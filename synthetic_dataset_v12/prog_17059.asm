; DESCRIPTION: Composite: Places a green dot at position (198, 165) then Draws a purple line from (172, 71) to (499, 12) then Creates a yellow circular shape at (74, 176) with radius 74.
; PLAN: r0=198(x), r1=165(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=172(x1), r6=71(y1), r7=499(x2), r8=12(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=176(y), r12=74(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 198
LDI r1, 165
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 172
LDI r6, 71
LDI r7, 499
LDI r8, 12
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 176
LDI r12, 74
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
