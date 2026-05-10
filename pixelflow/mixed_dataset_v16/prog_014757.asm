; DESCRIPTION: Composite: Creates a blue circular shape at (207, 173) with radius 58 then Sets a single blue pixel at (434, 75) then Draws a blue line from (104, 123) to (266, 52).
; PLAN: r0=207(x), r1=173(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=75(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=104(x1), r11=123(y1), r12=266(x2), r13=52(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 173
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 75
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 104
LDI r11, 123
LDI r12, 266
LDI r13, 52
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
