; DESCRIPTION: Composite: Creates a white circular shape at (81, 83) with radius 40 then Places a green line segment connecting (459, 85) to (252, 155) then Sets a single magenta pixel at (194, 160).
; PLAN: r0=81(x), r1=83(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=85(y1), r7=252(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=160(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 83
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 85
LDI r7, 252
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 160
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
