; DESCRIPTION: Composite: Sets a single blue pixel at (415, 149) then Draws a red line from (497, 71) to (203, 122) then Places a orange circle of radius 12 at center (166, 80).
; PLAN: r0=415(x), r1=149(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=71(y1), r7=203(x2), r8=122(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=166(x), r11=80(y), r12=12(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 149
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 497
LDI r6, 71
LDI r7, 203
LDI r8, 122
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 80
LDI r12, 12
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
