; DESCRIPTION: Composite: Draws a yellow circle centered at (229, 121) with radius 60 then Sets a single orange pixel at (273, 143) then Draws a white line from (266, 226) to (386, 75).
; PLAN: r0=229(x), r1=121(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=266(x1), r11=226(y1), r12=386(x2), r13=75(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 121
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 266
LDI r11, 226
LDI r12, 386
LDI r13, 75
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
