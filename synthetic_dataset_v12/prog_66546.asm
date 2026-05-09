; DESCRIPTION: Composite: Renders a yellow line between points (445, 155) and (64, 231) then Sets a single white pixel at (399, 148) then Creates a yellow circular shape at (404, 195) with radius 47.
; PLAN: r0=445(x1), r1=155(y1), r2=64(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=148(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=404(x), r11=195(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 445
LDI r1, 155
LDI r2, 64
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 148
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 195
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
