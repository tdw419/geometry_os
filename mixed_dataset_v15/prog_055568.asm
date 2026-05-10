; DESCRIPTION: Composite: Places a red line segment connecting (113, 188) to (390, 8) then Places a purple dot at position (382, 59) then Draws a orange circle centered at (151, 71) with radius 63.
; PLAN: r0=113(x1), r1=188(y1), r2=390(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=59(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=71(y), r12=63(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 188
LDI r2, 390
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 59
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 151
LDI r11, 71
LDI r12, 63
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
