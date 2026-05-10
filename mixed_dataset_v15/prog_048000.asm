; DESCRIPTION: Composite: Sets a single black pixel at (418, 142) then Renders a purple disk with center (25, 83) and radius 24 then Draws a white line from (259, 31) to (366, 252).
; PLAN: r0=418(x), r1=142(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=83(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x1), r11=31(y1), r12=366(x2), r13=252(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 142
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 25
LDI r6, 83
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 31
LDI r12, 366
LDI r13, 252
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
