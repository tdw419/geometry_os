; DESCRIPTION: Composite: Draws a white circle centered at (422, 38) with radius 27 then Draws a purple line from (472, 226) to (252, 88) then Sets a single red pixel at (206, 14).
; PLAN: r0=422(x), r1=38(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=226(y1), r7=252(x2), r8=88(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=206(x), r11=14(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 38
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 226
LDI r7, 252
LDI r8, 88
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 14
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
