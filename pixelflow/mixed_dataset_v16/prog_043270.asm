; DESCRIPTION: Composite: Renders a cyan line between points (159, 129) and (41, 70) then Sets a single orange pixel at (207, 78) then Renders a purple disk with center (171, 98) and radius 42.
; PLAN: r0=159(x1), r1=129(y1), r2=41(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=78(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=98(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 129
LDI r2, 41
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 78
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 171
LDI r11, 98
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
