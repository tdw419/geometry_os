; DESCRIPTION: Composite: Sets a single red pixel at (249, 80) then Renders a orange line between points (291, 144) and (464, 11) then Places a black circle of radius 33 at center (69, 198).
; PLAN: r0=249(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=144(y1), r7=464(x2), r8=11(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=198(y), r12=33(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 291
LDI r6, 144
LDI r7, 464
LDI r8, 11
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 198
LDI r12, 33
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
