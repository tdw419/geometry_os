; DESCRIPTION: Composite: Renders a yellow line between points (223, 151) and (497, 204) then Creates a green circular shape at (126, 123) with radius 18 then Sets a single red pixel at (217, 219).
; PLAN: r0=223(x1), r1=151(y1), r2=497(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=123(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=219(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 151
LDI r2, 497
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 123
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 219
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
