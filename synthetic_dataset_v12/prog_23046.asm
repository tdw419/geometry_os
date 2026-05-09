; DESCRIPTION: Composite: Creates a orange circular shape at (244, 124) with radius 76 then Places a green line segment connecting (205, 124) to (269, 4) then Sets a single blue pixel at (49, 122).
; PLAN: r0=244(x), r1=124(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x1), r6=124(y1), r7=269(x2), r8=4(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=122(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 124
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 124
LDI r7, 269
LDI r8, 4
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 122
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
