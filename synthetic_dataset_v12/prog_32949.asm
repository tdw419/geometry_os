; DESCRIPTION: Composite: Draws a purple circle centered at (184, 37) with radius 10 then Places a purple line segment connecting (120, 104) to (415, 215) then Places a orange dot at position (340, 212).
; PLAN: r0=184(x), r1=37(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=104(y1), r7=415(x2), r8=215(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=212(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 37
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 104
LDI r7, 415
LDI r8, 215
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 212
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
