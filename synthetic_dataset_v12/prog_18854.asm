; DESCRIPTION: Composite: Renders a black line between points (145, 55) and (210, 193) then Creates a cyan circular shape at (117, 201) with radius 20 then Sets a single orange pixel at (187, 185).
; PLAN: r0=145(x1), r1=55(y1), r2=210(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=201(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=185(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 55
LDI r2, 210
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 201
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 185
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
