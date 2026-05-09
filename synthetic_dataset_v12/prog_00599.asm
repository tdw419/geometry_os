; DESCRIPTION: Composite: Creates a orange circular shape at (159, 63) with radius 61 then Draws a white line from (316, 61) to (176, 52) then Sets a single green pixel at (138, 88).
; PLAN: r0=159(x), r1=63(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=61(y1), r7=176(x2), r8=52(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=88(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 63
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 61
LDI r7, 176
LDI r8, 52
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 88
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
