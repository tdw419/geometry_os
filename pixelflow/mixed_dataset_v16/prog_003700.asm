; DESCRIPTION: Composite: Draws a orange circle centered at (364, 134) with radius 66 then Places a blue line segment connecting (326, 178) to (226, 109) then Sets a single white pixel at (186, 84).
; PLAN: r0=364(x), r1=134(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=178(y1), r7=226(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=84(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 134
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 178
LDI r7, 226
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 84
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
