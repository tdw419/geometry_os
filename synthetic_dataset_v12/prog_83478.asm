; DESCRIPTION: Composite: Places a yellow line segment connecting (94, 62) to (2, 165) then Renders a yellow disk with center (470, 35) and radius 19 then Sets a single orange pixel at (43, 95).
; PLAN: r0=94(x1), r1=62(y1), r2=2(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=35(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=95(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 62
LDI r2, 2
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 35
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 95
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
