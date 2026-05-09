; DESCRIPTION: Composite: Places a black dot at position (436, 229) then Renders a purple disk with center (56, 57) and radius 56 then Renders a purple line between points (243, 72) and (296, 201).
; PLAN: r0=436(x), r1=229(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=57(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x1), r11=72(y1), r12=296(x2), r13=201(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 229
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 56
LDI r6, 57
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 72
LDI r12, 296
LDI r13, 201
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
