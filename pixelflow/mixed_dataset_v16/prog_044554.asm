; DESCRIPTION: Composite: Draws a orange circle centered at (393, 170) with radius 62 then Renders a white line between points (419, 214) and (172, 126) then Places a orange dot at position (90, 220).
; PLAN: r0=393(x), r1=170(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=214(y1), r7=172(x2), r8=126(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=220(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 170
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 214
LDI r7, 172
LDI r8, 126
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 220
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
