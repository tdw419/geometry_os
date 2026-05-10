; DESCRIPTION: Composite: Draws a red circle centered at (377, 85) with radius 73 then Places a green dot at position (201, 124) then Places a yellow line segment connecting (400, 236) to (289, 237).
; PLAN: r0=377(x), r1=85(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=124(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=400(x1), r11=236(y1), r12=289(x2), r13=237(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 85
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 124
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 400
LDI r11, 236
LDI r12, 289
LDI r13, 237
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
