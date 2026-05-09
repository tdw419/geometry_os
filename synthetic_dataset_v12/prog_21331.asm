; DESCRIPTION: Composite: Creates a yellow circular shape at (387, 117) with radius 70 then Renders a red line between points (165, 87) and (391, 181) then Sets a single orange pixel at (320, 193).
; PLAN: r0=387(x), r1=117(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=87(y1), r7=391(x2), r8=181(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=193(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 117
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 87
LDI r7, 391
LDI r8, 181
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 193
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
