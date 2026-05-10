; DESCRIPTION: Composite: Renders a green disk with center (338, 148) and radius 23 then Renders a orange line between points (406, 46) and (486, 26) then Places a orange dot at position (262, 159).
; PLAN: r0=338(x), r1=148(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=46(y1), r7=486(x2), r8=26(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=159(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 148
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 46
LDI r7, 486
LDI r8, 26
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 159
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
