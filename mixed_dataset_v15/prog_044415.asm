; DESCRIPTION: Composite: Draws a orange circle centered at (197, 176) with radius 72 then Sets a single red pixel at (348, 95) then Draws a green line from (152, 135) to (263, 124).
; PLAN: r0=197(x), r1=176(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=95(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=152(x1), r11=135(y1), r12=263(x2), r13=124(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 176
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 95
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 152
LDI r11, 135
LDI r12, 263
LDI r13, 124
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
