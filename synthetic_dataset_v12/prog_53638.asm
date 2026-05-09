; DESCRIPTION: Composite: Draws a purple rectangle at (273, 211) with width 24 and height 22 then Sets a single red pixel at (21, 201) then Draws a white line from (242, 141) to (314, 38).
; PLAN: r0=273(x), r1=211(y), r2=24(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=201(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=242(x1), r11=141(y1), r12=314(x2), r13=38(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 211
LDI r2, 24
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 201
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 242
LDI r11, 141
LDI r12, 314
LDI r13, 38
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
