; DESCRIPTION: Composite: Draws a cyan circle centered at (241, 89) with radius 37 then Places a purple dot at position (447, 233) then Places a white line segment connecting (154, 133) to (395, 17).
; PLAN: r0=241(x), r1=89(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x), r6=233(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=133(y1), r12=395(x2), r13=17(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 89
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 233
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 133
LDI r12, 395
LDI r13, 17
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
