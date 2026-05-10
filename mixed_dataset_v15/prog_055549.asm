; DESCRIPTION: Composite: Draws a orange circle centered at (222, 84) with radius 54 then Renders a green line between points (141, 173) and (110, 188) then Places a green dot at position (348, 150).
; PLAN: r0=222(x), r1=84(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=173(y1), r7=110(x2), r8=188(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=150(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 84
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 173
LDI r7, 110
LDI r8, 188
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 150
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
