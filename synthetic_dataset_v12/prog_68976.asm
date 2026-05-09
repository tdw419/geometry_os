; DESCRIPTION: Composite: Places a black line segment connecting (412, 134) to (506, 144) then Draws a cyan circle centered at (129, 99) with radius 39 then Sets a single orange pixel at (430, 50).
; PLAN: r0=412(x1), r1=134(y1), r2=506(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=99(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=50(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 134
LDI r2, 506
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 99
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 50
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
