; DESCRIPTION: Composite: Draws a purple circle centered at (457, 51) with radius 15 then Sets a single cyan pixel at (392, 181) then Renders a orange line between points (400, 171) and (443, 248).
; PLAN: r0=457(x), r1=51(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=181(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=400(x1), r11=171(y1), r12=443(x2), r13=248(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 51
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 181
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 400
LDI r11, 171
LDI r12, 443
LDI r13, 248
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
