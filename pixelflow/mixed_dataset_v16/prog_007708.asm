; DESCRIPTION: Composite: Renders a black line between points (467, 113) and (178, 120) then Places a cyan dot at position (241, 155) then Creates a orange circular shape at (123, 119) with radius 37.
; PLAN: r0=467(x1), r1=113(y1), r2=178(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=155(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=119(y), r12=37(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 113
LDI r2, 178
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 155
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 119
LDI r12, 37
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
