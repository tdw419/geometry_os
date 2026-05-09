; DESCRIPTION: Composite: Places a red line segment connecting (423, 126) to (13, 113) then Draws a white circle centered at (38, 185) with radius 36 then Sets a single red pixel at (338, 46).
; PLAN: r0=423(x1), r1=126(y1), r2=13(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=185(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=46(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 126
LDI r2, 13
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 185
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 46
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
