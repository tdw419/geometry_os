; DESCRIPTION: Composite: Draws a red circle centered at (229, 144) with radius 73 then Sets a single purple pixel at (388, 215) then Renders a orange line between points (258, 9) and (181, 35).
; PLAN: r0=229(x), r1=144(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=215(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=258(x1), r11=9(y1), r12=181(x2), r13=35(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 144
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 215
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 258
LDI r11, 9
LDI r12, 181
LDI r13, 35
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
