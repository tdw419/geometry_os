; DESCRIPTION: Composite: Renders a orange line between points (169, 149) and (222, 94) then Creates a orange circular shape at (168, 167) with radius 61 then Sets a single green pixel at (163, 70).
; PLAN: r0=169(x1), r1=149(y1), r2=222(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=167(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x), r11=70(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 149
LDI r2, 222
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 167
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 70
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
