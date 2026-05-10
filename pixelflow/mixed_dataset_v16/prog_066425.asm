; DESCRIPTION: Composite: Creates a blue circular shape at (193, 138) with radius 52 then Sets a single orange pixel at (155, 143) then Places a red line segment connecting (129, 208) to (221, 222).
; PLAN: r0=193(x), r1=138(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=208(y1), r12=221(x2), r13=222(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 138
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 129
LDI r11, 208
LDI r12, 221
LDI r13, 222
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
