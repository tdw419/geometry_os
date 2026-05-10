; DESCRIPTION: Composite: Places a orange circle of radius 77 at center (402, 89) then Draws a white line from (161, 188) to (309, 15) then Places a purple dot at position (398, 144).
; PLAN: r0=402(x), r1=89(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x1), r6=188(y1), r7=309(x2), r8=15(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=398(x), r11=144(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 89
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 188
LDI r7, 309
LDI r8, 15
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 144
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
