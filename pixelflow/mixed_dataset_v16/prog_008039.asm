; DESCRIPTION: Composite: Draws a red circle centered at (439, 152) with radius 16 then Sets a single black pixel at (435, 7) then Draws a blue line from (266, 143) to (88, 3).
; PLAN: r0=439(x), r1=152(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=7(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=266(x1), r11=143(y1), r12=88(x2), r13=3(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 152
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 7
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 266
LDI r11, 143
LDI r12, 88
LDI r13, 3
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
