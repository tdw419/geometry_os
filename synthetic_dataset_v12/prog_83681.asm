; DESCRIPTION: Composite: Places a blue line segment connecting (423, 76) to (353, 44) then Places a green circle of radius 41 at center (293, 104) then Sets a single white pixel at (509, 159).
; PLAN: r0=423(x1), r1=76(y1), r2=353(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=104(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x), r11=159(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 423
LDI r1, 76
LDI r2, 353
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 104
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 159
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
