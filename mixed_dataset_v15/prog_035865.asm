; DESCRIPTION: Composite: Creates a white circular shape at (406, 175) with radius 12 then Renders a green line between points (296, 203) and (355, 124) then Sets a single orange pixel at (350, 200).
; PLAN: r0=406(x), r1=175(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=203(y1), r7=355(x2), r8=124(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=200(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 406
LDI r1, 175
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 203
LDI r7, 355
LDI r8, 124
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 200
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
