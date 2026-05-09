; DESCRIPTION: Composite: Places a magenta line segment connecting (492, 4) to (372, 111) then Sets a single purple pixel at (192, 53) then Places a purple circle of radius 66 at center (435, 106).
; PLAN: r0=492(x1), r1=4(y1), r2=372(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=53(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=106(y), r12=66(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 492
LDI r1, 4
LDI r2, 372
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 53
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 435
LDI r11, 106
LDI r12, 66
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
