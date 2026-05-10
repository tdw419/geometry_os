; DESCRIPTION: Composite: Draws a purple circle centered at (321, 50) with radius 24 then Places a orange line segment connecting (117, 94) to (261, 146) then Sets a single cyan pixel at (499, 150).
; PLAN: r0=321(x), r1=50(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=94(y1), r7=261(x2), r8=146(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=499(x), r11=150(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 50
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 94
LDI r7, 261
LDI r8, 146
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 499
LDI r11, 150
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
