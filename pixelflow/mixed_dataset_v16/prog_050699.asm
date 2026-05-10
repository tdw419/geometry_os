; DESCRIPTION: Composite: Places a magenta line segment connecting (255, 61) to (134, 144) then Places a yellow circle of radius 39 at center (324, 70) then Sets a single purple pixel at (87, 49).
; PLAN: r0=255(x1), r1=61(y1), r2=134(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=70(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x), r11=49(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 61
LDI r2, 134
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 70
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 49
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
