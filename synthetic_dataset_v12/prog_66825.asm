; DESCRIPTION: Composite: Draws a green circle centered at (74, 155) with radius 58 then Sets a single white pixel at (295, 98) then Draws a green line from (474, 15) to (169, 41).
; PLAN: r0=74(x), r1=155(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=98(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=474(x1), r11=15(y1), r12=169(x2), r13=41(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 155
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 98
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 15
LDI r12, 169
LDI r13, 41
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
