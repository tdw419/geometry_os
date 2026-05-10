; DESCRIPTION: Composite: Places a orange dot at position (210, 143) then Draws a yellow line from (331, 49) to (160, 69) then Places a orange circle of radius 25 at center (337, 72).
; PLAN: r0=210(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=49(y1), r7=160(x2), r8=69(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=72(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 210
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 331
LDI r6, 49
LDI r7, 160
LDI r8, 69
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 72
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
