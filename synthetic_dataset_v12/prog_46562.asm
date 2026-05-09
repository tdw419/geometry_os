; DESCRIPTION: Composite: Sets a single purple pixel at (249, 58) then Creates a purple circular shape at (203, 180) with radius 39 then Draws a yellow line from (260, 96) to (441, 40).
; PLAN: r0=249(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=180(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=260(x1), r11=96(y1), r12=441(x2), r13=40(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 58
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 180
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 260
LDI r11, 96
LDI r12, 441
LDI r13, 40
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
