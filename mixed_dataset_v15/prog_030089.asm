; DESCRIPTION: Composite: Creates a black circular shape at (428, 58) with radius 37 then Draws a purple line from (315, 122) to (444, 184).
; PLAN: r0=428(x), r1=58(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=122(y1), r7=444(x2), r8=184(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 58
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 122
LDI r7, 444
LDI r8, 184
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
