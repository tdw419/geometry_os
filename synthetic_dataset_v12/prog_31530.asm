; DESCRIPTION: Composite: Renders a white disk with center (102, 115) and radius 40 then Sets a single purple pixel at (307, 78) then Draws a purple line from (314, 8) to (475, 31).
; PLAN: r0=102(x), r1=115(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=78(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=314(x1), r11=8(y1), r12=475(x2), r13=31(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 115
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 78
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 314
LDI r11, 8
LDI r12, 475
LDI r13, 31
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
