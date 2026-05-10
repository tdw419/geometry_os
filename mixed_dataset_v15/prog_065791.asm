; DESCRIPTION: Composite: Draws a blue line from (119, 171) to (189, 248) then Sets a single yellow pixel at (363, 67) then Draws a white circle centered at (249, 193) with radius 42.
; PLAN: r0=119(x1), r1=171(y1), r2=189(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=67(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=193(y), r12=42(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 119
LDI r1, 171
LDI r2, 189
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 67
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 249
LDI r11, 193
LDI r12, 42
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
