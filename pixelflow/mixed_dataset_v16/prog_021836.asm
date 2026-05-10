; DESCRIPTION: Composite: Renders a white line between points (340, 50) and (87, 38) then Sets a single orange pixel at (96, 1) then Renders a orange disk with center (275, 113) and radius 78.
; PLAN: r0=340(x1), r1=50(y1), r2=87(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=1(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=113(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 340
LDI r1, 50
LDI r2, 87
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 1
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 275
LDI r11, 113
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
