; DESCRIPTION: Composite: Places a orange circle of radius 19 at center (203, 143) then Places a white dot at position (47, 80) then Draws a purple line from (49, 186) to (383, 16).
; PLAN: r0=203(x), r1=143(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=80(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=49(x1), r11=186(y1), r12=383(x2), r13=16(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 143
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 80
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 49
LDI r11, 186
LDI r12, 383
LDI r13, 16
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
