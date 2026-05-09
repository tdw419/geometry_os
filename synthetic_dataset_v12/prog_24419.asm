; DESCRIPTION: Composite: Places a purple dot at position (197, 63) then Draws a purple circle centered at (363, 84) with radius 70 then Places a white line segment connecting (474, 122) to (244, 118).
; PLAN: r0=197(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=84(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x1), r11=122(y1), r12=244(x2), r13=118(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 363
LDI r6, 84
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 122
LDI r12, 244
LDI r13, 118
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
