; DESCRIPTION: Composite: Sets a single purple pixel at (433, 203) then Places a yellow line segment connecting (333, 70) to (318, 87) then Places a orange circle of radius 60 at center (395, 180).
; PLAN: r0=433(x), r1=203(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=333(x1), r6=70(y1), r7=318(x2), r8=87(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=180(y), r12=60(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 203
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 333
LDI r6, 70
LDI r7, 318
LDI r8, 87
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 180
LDI r12, 60
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
