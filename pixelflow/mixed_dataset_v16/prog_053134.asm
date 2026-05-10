; DESCRIPTION: Composite: Renders a cyan line between points (74, 229) and (23, 77) then Places a yellow dot at position (165, 125) then Places a orange circle of radius 14 at center (430, 225).
; PLAN: r0=74(x1), r1=229(y1), r2=23(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=125(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=225(y), r12=14(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 229
LDI r2, 23
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 125
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 430
LDI r11, 225
LDI r12, 14
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
